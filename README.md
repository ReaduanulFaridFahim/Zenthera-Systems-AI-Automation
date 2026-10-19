# Zenthra Systems — Autonomous Front-Office & Operations n8n AI Agent

> 🌐 **Live Hosted Portal:** [https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/](https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/)  
> 💬 **Live Chat Specialist:** [https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/embed/chat-widget.html](https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/embed/chat-widget.html)  
> 🎓 **Interactive Website Training:** [https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/?train=true](https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/?train=true)  
> 📦 **GitHub Repository:** [https://github.com/ReaduanulFaridFahim/Zenthera-Systems-AI-Automation](https://github.com/ReaduanulFaridFahim/Zenthera-Systems-AI-Automation)  
> 📅 **Live Calendar Booking:** [https://cal.com/zenthra-systems-dyuqpi/30min](https://cal.com/zenthra-systems-dyuqpi/30min)

This repository contains the complete operational blueprint, production-ready n8n workflows, system prompt engineering, Supabase pgvector knowledge base, and client-facing web application for **Zenthra Systems' Autonomous Technical Operations Agent**.

---

## 🎯 Architecture Overview

```
                      ┌──────────────────────────────────────────────┐
                      │ Inbound Channels                             │
                      │ • Website Chat Widget (n8n Chat Trigger)     │
                      │ • Webhook (Contact Form / Landing Page)      │
                      │ • Email / WhatsApp / Telegram Webhook        │
                      └──────────────────────┬───────────────────────┘
                                             │
                                             ▼
                      ┌──────────────────────────────────────────────┐
                      │              n8n AI Agent Core               │
                      │   (LangChain Tools Agent / Autonomous Hub)   │
                      └───────┬──────────────┬──────────────┬────────┘
                              │              │              │
      ┌───────────────────────┴─┐   ┌────────┴────────┐   ┌─┴────────────────────────┐
      │  Conversational Memory  │   │ LLM Engine      │   │ Connected Tools Engine   │
      │  Window Buffer (10 msg) │   │ Claude 3.5 /    │   │ (Deterministic Exec)     │
      │  or Redis Session Store │   │ GPT-4o / Mini   │   │                          │
      └─────────────────────────┘   └─────────────────┘   └─┬────────────────────────┘
                                                            │
    ┌──────────────────────────────┬────────────────────────┴─────┬──────────────────────────────┐
    │                              │                              │                              │
    ▼                              ▼                              ▼                              ▼
┌────────────────────────┐  ┌───────────────────────────┐  ┌────────────────────────┐  ┌────────────────────────┐
│ Tool 1: Knowledge Base │  │ Tool 2: CRM & Lead Logger │  │ Tool 3: Calendar Book  │  │ Tool 4: Team Notifier  │
│ Vector Store / Doc Q&A │  │ `save_qualified_lead`     │  │ `get_booking_link`     │  │ `notify_internal_team` │
│ • Service catalog      │  │ • Airtable / HubSpot      │  │ • Cal.com / Google Cal │  │ • Telegram / Discord   │
│ • Case studies         │  │ • PostgreSQL / Supabase   │  │ • Prefilled parameters │  │ • Instant Lead Alert   │
│ • Turnaround SLAs      │  │ • Discovery Memo output   │  │ • Slot validation      │  │ • High-priority flag   │
└────────────────────────┘  └───────────────────────────┘  └────────────────────────┘  └────────────────────────┘
```

---

## 📁 Repository Structure

- [`workflows/outbound_client_acquisition_pipeline.json`](file:///d:/Aviation/workflows/outbound_client_acquisition_pipeline.json) — Production n8n workflow for automated B2B client prospecting (Apollo/Hunter API), AI email personalization, and automated cold outreach.
- [`workflows/zenthra_social_automation.json`](file:///d:/Aviation/workflows/zenthra_social_automation.json) — Production n8n workflow for autonomous multi-network social media publishing (LinkedIn, X, Instagram, Facebook via Ayrshare) with GPT-4o copywriting and video/poster rendering.
- [`outreach/autonomous_social_media_engine.md`](file:///d:/Aviation/outreach/autonomous_social_media_engine.md) — Complete 4-phase social media blueprint: Canvas poster generation, n8n publisher, Ayrshare setup, and 24/7 ManyChat DM lead triage.
- [`poster_studio.html`](file:///d:/Aviation/poster_studio.html) — Interactive in-browser B2B Poster Studio with live 1080x1350 canvas rendering, 5 high-converting presets, and 1-click PNG download.
- [`poster-generator.js`](file:///d:/Aviation/poster-generator.js) — Standalone Node.js script generating 1080x1350 dark tech minimalist posters via HTML5 Canvas or vector SVG fallback.
- [`outreach/autonomous_client_acquisition_playbook.md`](file:///d:/Aviation/outreach/autonomous_client_acquisition_playbook.md) — Strategic playbook: high-converting outreach channels, technographic search filters, and the 3-Sentence Engineering Diagnostic email templates.
- [`workflows/zenthra_operations_agent.json`](file:///d:/Aviation/workflows/zenthra_operations_agent.json) — Production-ready, importable n8n workflow containing the Chat Trigger, AI Agent, Window Buffer Memory, OpenAI Model, Supabase Vector Store Tool, and lead qualification tools.
- [`workflows/knowledge_ingestion_pipeline.json`](file:///d:/Aviation/workflows/knowledge_ingestion_pipeline.json) — Dedicated n8n workflow for chunking, embedding, and synchronizing knowledge base documentation to Supabase pgvector.
- [`sql/supabase_pgvector_setup.sql`](file:///d:/Aviation/sql/supabase_pgvector_setup.sql) — QA-hardened PostgreSQL schema with HNSW index, GIN full-text index, and `min_similarity` threshold filtering.
- [`rag/supabase_rag_guide.md`](file:///d:/Aviation/rag/supabase_rag_guide.md) — Step-by-step Supabase deployment, credentials, and verification guide.
- [`knowledge/seed_data.json`](file:///d:/Aviation/knowledge/seed_data.json) — Pre-chunked knowledge base items ready for batch vector ingestion.
- [`prompts/technical_operations_specialist_prompt.md`](file:///d:/Aviation/prompts/technical_operations_specialist_prompt.md) — Comprehensive System Prompt with strict qualification rubrics, tool call formatting, few-shot examples, and discovery memo generation instructions.
- [`knowledge/zenthra_knowledge_base.md`](file:///d:/Aviation/knowledge/zenthra_knowledge_base.md) — Exhaustive service catalog, pricing models, Cyclistic analytics case study, automation frameworks, and company FAQs.
- [`index.html`](file:///d:/Aviation/index.html) — Corporate enterprise portal with interactive Automation ROI Calculator, live embedded AI Agent preview, engineering capabilities, guided walkthrough HUD, and discovery booking.
- [`embed/chat-widget.html`](file:///d:/Aviation/embed/chat-widget.html) — Next-gen white-theme AI operations console featuring the 1-Click Quick Scope Wizard, native speech-to-text voice input, dynamic follow-up chips, Cal.com scheduling cards, Markdown rendering, and collapsible telemetry drawer.


---

## 🚀 Quick Start Deployment Guide

### Step 1: Set Up Supabase pgvector
1. Open your Supabase Dashboard → **SQL Editor**.
2. Run [`sql/supabase_pgvector_setup.sql`](file:///d:/Aviation/sql/supabase_pgvector_setup.sql) to create `zenthra_knowledge` and the `match_zenthra_documents` RPC function.

### Step 2: Ingest Knowledge Base
1. In n8n, import [`workflows/knowledge_ingestion_pipeline.json`](file:///d:/Aviation/workflows/knowledge_ingestion_pipeline.json).
2. Connect your **Supabase API** and **OpenAI** credentials.
3. Click **Execute Workflow** on the manual trigger to embed and index all knowledge modules.

### Step 3: Import Main Agent Workflow into n8n
1. Open your n8n instance (n8n Cloud or self-hosted `v1.40.0+`).
2. Go to **Workflows** → Click **Add Workflow** (or press `Ctrl+O`).
3. Click the `...` menu in the top right → **Import from File** → select [`workflows/zenthra_operations_agent.json`](file:///d:/Aviation/workflows/zenthra_operations_agent.json).
4. All nodes and connections (including Supabase Vector Store search tool) will load automatically onto the canvas.

### Step 4: Configure Credentials & Environment
- **OpenAI Credential**: Attach to `OpenAI Chat Model (GPT-4o)` and `OpenAI Embeddings`.
- **Supabase Credential**: Attach to `Supabase Vector Store (Query)`.
- **Calendar Link**: Configured with live Cal.com account (`https://cal.com/zenthra-systems-dyuqpi/30min`) and API Key (`config/cal_com.json`).
- **Telegram / Discord / Slack Webhook**: Add your internal alert webhook URL into `notify_internal_team`.

### Step 5: Embed on Your Website
Paste the embed snippet from [`embed/chat-widget.html`](file:///d:/Aviation/embed/chat-widget.html) right before the closing `</body>` tag of your site.

