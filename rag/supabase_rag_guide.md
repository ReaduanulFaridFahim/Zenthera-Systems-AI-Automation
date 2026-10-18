# Supabase pgvector RAG Setup Guide for Zenthra Systems

This guide walks through deploying semantic search (Retrieval-Augmented Generation) for the Zenthra Systems n8n AI Agent using Supabase and `pgvector`.

---

## 🏗️ Architecture

```
┌─────────────────────────────────┐
│ Zenthra Knowledge Base Source   │
│ (Services, Cyclistic Study, etc)│
└───────────────┬─────────────────┘
                │
                ▼
┌─────────────────────────────────┐
│ Ingestion Workflow (n8n)        │
│ • Chunking & Metadata Tagging   │
│ • OpenAI text-embedding-3-small │
└───────────────┬─────────────────┘
                │
                ▼
┌─────────────────────────────────────────────────────────┐
│ Supabase PostgreSQL + pgvector                          │
│ • Table: `zenthra_knowledge`                            │
│ • Index: HNSW (Hierarchical Navigable Small World)      │
│ • RPC Function: `match_zenthra_documents()`             │
└───────────────┬─────────────────────────────────────────┘
                │
                ▲ (Semantic Cosine Retrieval)
                │
┌───────────────┴─────────────────┐
│ Zenthra Operations Agent (n8n)  │
│ • Tool: Supabase Vector Store   │
│ • Real-time context injection   │
└─────────────────────────────────┘
```

---

## 🛠️ Step 1: Execute SQL in Supabase

1. Log into your [Supabase Dashboard](https://supabase.com/dashboard) and navigate to your project.
2. In the left navigation, click on **SQL Editor**.
3. Open or paste the contents of [`sql/supabase_pgvector_setup.sql`](file:///d:/Aviation/sql/supabase_pgvector_setup.sql):
   - Enables `vector` extension.
   - Creates the `public.zenthra_knowledge` table with a 1536-dimensional `embedding` column.
   - Builds an **HNSW** index with `vector_cosine_ops` for sub-millisecond similarity retrieval.
   - Deploys the `match_zenthra_documents` RPC function.
4. Click **Run**. Verify that the query executes with `Success. No rows returned`.

---

## 🔑 Step 2: Configure Credentials in n8n

Inside your n8n instance (**Settings** → **Credentials**):

1. **Supabase API Credential (`supabaseApi`):**
   - **Host / URL:** `https://your-project-ref.supabase.co` (from Supabase Project Settings → API).
   - **Service Role Secret:** Paste the `service_role` secret (from Supabase Project Settings → API → Project API Keys).  
     *(Note: Use `service_role` so the ingestion workflow can bypass RLS when inserting embeddings).*
2. **OpenAI Credential (`openAiApi`):**
   - Connect your standard OpenAI API key for `gpt-4o` and `text-embedding-3-small`.

---

## 📥 Step 3: Run the Ingestion Pipeline

1. In n8n, click **Add Workflow** → Import [`workflows/knowledge_ingestion_pipeline.json`](file:///d:/Aviation/workflows/knowledge_ingestion_pipeline.json).
2. Attach your `Supabase Zenthra Account` credential to the **Supabase Vector Store (Insert)** node and your `OpenAI Account` to the **OpenAI Embeddings** node.
3. Click **Execute Workflow** on the **Manual Ingestion Trigger**.
4. The workflow will:
   - Ingest all 10 pre-chunked knowledge modules from [`knowledge/seed_data.json`](file:///d:/Aviation/knowledge/seed_data.json).
   - Generate embeddings using `text-embedding-3-small`.
   - Insert rows into `public.zenthra_knowledge`.
5. Check your Supabase Table Editor: you should see 10 populated rows with vector embeddings!

---

## 🤖 Step 4: Run the AI Agent with Native Vector Store

1. Import or open [`workflows/zenthra_operations_agent.json`](file:///d:/Aviation/workflows/zenthra_operations_agent.json).
2. The agent has the **Tool: Supabase Vector Store Search** node connected directly to the **Zenthra Technical Operations Agent**.
3. Whenever a prospect asks questions such as:
   - *"Tell me how you guys handled the Cyclistic bike-share project."*
   - *"What are your turnaround times for an MVP?"*
   - *"Can n8n run inside our private VPC?"*
4. The agent executes semantic vector retrieval against `match_zenthra_documents()` and returns grounded, factual answers with zero hallucination.
