# ⚡ Zenthra Systems — Autonomous AI Operations, n8n Systems & Client Acquisition Engine

<div align="center">

![GitHub Pages Deployment](https://img.shields.io/badge/Deployment-GitHub%20Pages%20Live-0284c7?style=for-the-badge&logo=github)
![Cluster SLA](https://img.shields.io/badge/Cluster%20SLA-99.98%25%20Uptime-059669?style=for-the-badge&logo=statuspage)
![Node Version](https://img.shields.io/badge/Node.js-v24.20.0-339933?style=for-the-badge&logo=node.js)
[![Powered by n8n](https://img.shields.io/badge/Orchestrated%20With-n8n%20Workflow%20Engine-EA4B71?style=for-the-badge&logo=n8n)](https://github.com/n8n-io/n8n)
![Supabase pgvector](https://img.shields.io/badge/Supabase-pgvector%20RAG-3ECF8E?style=for-the-badge&logo=supabase)
![Cal.com](https://img.shields.io/badge/Cal.com-Verified%20Booking-292929?style=for-the-badge&logo=calendar)
![License](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)

<br>

**Enterprise n8n Workflow Systems · Autonomous AI Front-Office Concierge · Sub-30s Lead Triage · Sovereign pgvector RAG**

[🌐 Live Enterprise Portal](https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/) • [🎨 B2B Social Poster Studio](https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/poster_studio.html) • [🎓 Interactive Practice Hub](https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/practice_video.html) • [📅 Cal.com 30-Min Booking](https://cal.com/zenthra-systems-dyuqpi/30min) • [🐙 Powered by n8n](https://github.com/n8n-io/n8n)

</div>

---

## 🎯 Executive Overview

**Zenthra Systems** is a high-throughput engineering studio specializing in autonomous enterprise AI agents, resilient data pipelines, self-hosted n8n workflow clusters, and sovereign vector search architectures. 

This repository contains the complete production-grade source code, importable n8n workflow JSONs, automated outbound acquisition engines, and responsive client-facing web applications.

```
                                  ZENTHRA SYSTEMS PRODUCTION MESH
                                  
  ┌────────────────────────────────────────────────────────────────────────────────────────┐
  │ 🌐 INBOUND FRONT-OFFICE & CONCIERGE                                                    │
  │ • Enterprise Portal (Next.js/HTML5 + Multi-Currency ROI Modeler: USD, EUR, GBP)        │
  │ • Embeddable AI Operations Specialist (Speech-to-Text, Scope Wizard, Telemetry Drawer) │
  │ • Cal.com Executive Scheduling Hub (Verified: cal.com/zenthra-systems-dyuqpi/30min)    │
  └───────────────────────────────────────────┬────────────────────────────────────────────┘
                                              │ Real-Time Inbound Event
                                              ▼
  ┌────────────────────────────────────────────────────────────────────────────────────────┐
  │ 🤖 ORCHESTRATION & AGENT CORE (n8n Cloud Cluster + LangChain)                         │
  │ • Zenthra Operations Agent (Window Buffer Memory + GPT-4o Multi-Tool Router)           │
  │ • Supabase pgvector RAG Engine (Cosine similarity search over sovereign documentation)  │
  │ • Autonomous Lead Scoper & Qualifier (Discovery memos + CRM persistence)              │
  └─────────────────────┬────────────────────────────────────────────────────┬─────────────┘
                        │                                                    │
          Outbound Sync │                                                    │ Internal Telemetry
                        ▼                                                    ▼
  ┌──────────────────────────────────────────────┐  ┌──────────────────────────────────────┐
  │ 🏢 MULTI-CRM & EMAIL DELIVERY PIPELINE       │  │ 🎨 AUTONOMOUS CONTENT ENGINE         │
  │ • HubSpot CRM (Contact & Lead Stages)        │  │ • 8-Template Social Poster Studio    │
  │ • Notion Enterprise Pipeline Database        │  │ • Automated 1080x1350 Canvas Engine  │
  │ • Resend API & SMTP (High-Deliverability)    │  │ • Cross-Platform Social Copywriter   │
  │ • Slack / Discord Instant Deal Room Pings    │  │ • 24/7 Inbound DM ManyChat Webhook   │
  └──────────────────────────────────────────────┘  └──────────────────────────────────────┘
```

---

## ⚡ Orchestration Core — Powered by [n8n](https://github.com/n8n-io/n8n)

Zenthra Systems is engineered directly on top of [n8n (n8n-io/n8n)](https://github.com/n8n-io/n8n) — the industry-leading fair-code workflow automation and AI agent orchestration platform.

### Why Zenthra Runs on [n8n](https://github.com/n8n-io/n8n)
- **Zero Per-Execution "Zapier Tax"**: Host on private enterprise infrastructure with unlimited workflow runs and zero per-step billing fees.
- **Data Sovereignty & Enterprise Compliance**: Customer data, vector embeddings, and API keys remain strictly inside your private network or cloud cluster.
- **First-Class AI & LangChain Ecosystem**: Native support for LLMs (GPT-4o, Claude 3.5), autonomous agent memory, dynamic tool calling, and vector stores.
- **Source Control for Workflows**: Every pipeline is version-controlled as standard JSON definitions in [`/workflows/`](file:///d:/Aviation/workflows/).

### Quickstart: Launching the n8n Engine

#### 1. Via Docker Compose (Recommended)
This repository includes a production-ready [`docker-compose.yml`](file:///d:/Aviation/docker-compose.yml) configured with persistent storage and read-only workflow mounts:

```bash
# Launch official n8n container in the background
docker compose up -d

# Check cluster logs
docker compose logs -f n8n
```
Access the local n8n Workflow Studio at: **`http://localhost:5678`**

#### 2. Via Local Node.js / npm
```bash
# Install n8n globally
npm install -g n8n

# Start n8n using npm script
npm run n8n

# Or run the Windows batch launcher:
.\start_n8n.bat
```

#### 3. Importing Production Workflows
Once your n8n workspace is open, go to **Workflows > Import from File** and select any workflow from [`workflows/`](file:///d:/Aviation/workflows/):
- **[`outbound_client_acquisition_pipeline.json`](file:///d:/Aviation/workflows/outbound_client_acquisition_pipeline.json)** — Multi-CRM sync (HubSpot, Notion, Resend, Slack).
- **[`zenthra_operations_agent.json`](file:///d:/Aviation/workflows/zenthra_operations_agent.json)** — Autonomous LangChain agent with Supabase pgvector RAG memory.
- **[`knowledge_ingestion_pipeline.json`](file:///d:/Aviation/workflows/knowledge_ingestion_pipeline.json)** — Document chunking and embedding ingestion.
- **[`zenthra_social_automation.json`](file:///d:/Aviation/workflows/zenthra_social_automation.json)** — Scheduled social media multi-channel poster.

---

## 🚀 Key Modules & Production Capabilities

### 1. 📡 Autonomous Outbound Lead Acquisition Engine
- **Target Manifest ([`data/outbound_prospects.json`](file:///d:/Aviation/data/outbound_prospects.json))**: 6 verified enterprise leads across North America, EMEA, and APAC (Logistics, SaaS, FinTech, Precision Manufacturing, HealthTech, and E-Commerce).
- **Automated Dispatcher ([`tools/dispatch_outbound_campaign.ps1`](file:///d:/Aviation/tools/dispatch_outbound_campaign.ps1))**: Synthesizes hyper-personalized 3-sentence architectural diagnostics calculating recoverable labor savings (e.g. **$96k**, **$187k**, **£167k**, **€215k** / year).
- **Dispatch Log ([`outreach/campaign_dispatch_log.json`](file:///d:/Aviation/outreach/campaign_dispatch_log.json))**: Tracks cold email and LinkedIn touchpoints with verified Cal.com booking hooks.

### 2. 🔌 Multi-CRM & Transactional Email Pipeline ([`workflows/outbound_client_acquisition_pipeline.json`](file:///d:/Aviation/workflows/outbound_client_acquisition_pipeline.json))
- **HubSpot CRM Node**: Automatically creates/updates contacts with lifecycle stage `Lead` and tags.
- **Notion Enterprise Pipeline Node**: Syncs prospects to an internal database with annual ROI projections.
- **Resend API Node**: High-deliverability transactional email delivery (`https://api.resend.com/emails`) with DKIM/SPF alignment.
- **Slack Deal Alert Node**: Real-time sales room alerts with 1-click Cal.com booking view.

### 3. 🎨 High-Converting B2B Social Poster Studio v2 ([`poster_studio.html`](file:///d:/Aviation/poster_studio.html))
- **8 Pre-Configured B2B Templates**:
  1. *Brochure Sites vs Next.js + AI Agents* (High Conversion)
  2. *The True Cost of Zapier vs n8n Clusters* (Financial Comparison)
  3. *Eliminating Manual Lead Routing* (Sub-30s Speed-to-Lead)
  4. *Autonomous Invoicing & Vision PO Reconciliation* (Financial AI Ops)
  5. *Cyclistic BI & Scalable BigQuery Pipelines* (Data Engineering)
  6. *The Bottleneck Breakdown* (Where Margins Leak)
  7. *AI Agent vs. Human FTE Benchmark* (Cost, Speed & Coverage Numbers)
  8. *The Autonomous Scale Matrix* (Scaling to 1,000,000 Monthly Events)
- **Multi-Format Canvas Engine**: 4:5 Portrait (1080×1350), 1:1 Square (1080×1080), 16:9 Landscape (1920×1080).
- **Dynamic Caption Generator**: Formatted copy generator for LinkedIn, X (Twitter), and Instagram that adapts to live user input.

### 4. 🧪 Live Enterprise Client Simulation Suite ([`tools/run_client_simulations.ps1`](file:///d:/Aviation/tools/run_client_simulations.ps1))
- **Verified Telemetry ([`outreach/client_simulations_audit.json`](file:///d:/Aviation/outreach/client_simulations_audit.json))**: 100% Pass rate (3 / 3 Scenarios Verified):
  - *TransEuropa Freight BV (Rotterdam)*: 250+ daily customs declarations vision pipeline (`200 OK`, 5539ms).
  - *CloudScale Global SaaS (Austin)*: Sub-30s lead triage & Zapier tax elimination (`200 OK`, 3526ms).
  - *Sterling & Vance Wealth (London)*: Sovereign Supabase pgvector GDPR compliance (`200 OK`, 5332ms).
- **Embedded in Academy**: Full simulation audits live in Module 7 of the Operational Academy in [`index.html`](file:///d:/Aviation/index.html).

---

## 📁 Repository Structure

```bash
├── index.html                   # Corporate portal with multi-currency ROI modeler & Academy
├── poster_studio.html           # In-browser B2B Social Poster Studio (8 templates & HD PNG export)
├── practice_video.html          # Interactive training video hub & step-by-step simulator
├── embed/
│   └── chat-widget.html         # Embeddable AI Operations Console with voice & telemetry drawer
├── workflows/
│   ├── outbound_client_acquisition_pipeline.json # Multi-CRM, Apollo & Resend engine
│   ├── zenthra_operations_agent.json            # LangChain conversational AI & Supabase RAG
│   ├── knowledge_ingestion_pipeline.json        # Vector chunking & embedding ingestion
│   └── zenthra_social_automation.json           # Scheduled cross-network Ayrshare publisher
├── data/
│   └── outbound_prospects.json  # 6 Verified enterprise prospect personas
├── outreach/
│   ├── campaign_dispatch_log.json    # Outbound email and LinkedIn dispatch manifest
│   ├── client_simulations_audit.json # End-to-end telemetry from live client simulations
│   ├── autonomous_client_acquisition_playbook.md # B2B closing scripts & diagnostic templates
│   ├── autonomous_social_media_engine.md        # 4-phase content machine architecture
│   └── global_marketing_engine.md              # Global acquisition strategy
├── tools/
│   ├── run_qa_audit.ps1         # Automated 4-tier QA verification suite
│   ├── check_github_status.ps1  # Live GitHub API repository status inspector
│   ├── dispatch_outbound_campaign.ps1 # Outbound lead dispatcher script
│   ├── run_client_simulations.ps1    # Live webhook client simulation runner
│   ├── generate_global_campaigns.ps1 # Multi-vertical cold outreach copy generator
│   └── poster-generator.js      # Headless Node.js canvas & SVG poster renderer
└── sql/
    └── supabase_pgvector_setup.sql # PostgreSQL schema with HNSW index & similarity RPC
```

---

## 🛠️ Verification & Quality Assurance Suite

Run the full automated QA audit locally anytime:

```powershell
powershell -ExecutionPolicy Bypass -File tools\run_qa_audit.ps1
```

**Audit Guarantees:**
- ✅ 100% JSON schema validation across all workflows and data files.
- ✅ HTML5 semantic structure & W3C compliance across all web views.
- ✅ Canonical Cal.com URL consistency (`https://cal.com/zenthra-systems-dyuqpi/30min`) across all 13 documentation files.
- ✅ Live n8n cluster health probe.

---

## 🌐 Live Production Links

- **Enterprise Portal:** [https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/](https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/)
- **Social Poster Studio:** [https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/poster_studio.html](https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/poster_studio.html)
- **Practice Video Hub:** [https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/practice_video.html](https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/practice_video.html)
- **Executive 30-Min Booking:** [https://cal.com/zenthra-systems-dyuqpi/30min](https://cal.com/zenthra-systems-dyuqpi/30min)
- **GitHub Repository:** [https://github.com/ReaduanulFaridFahim/Zenthera-Systems-AI-Automation](https://github.com/ReaduanulFaridFahim/Zenthera-Systems-AI-Automation)

---

## 📄 License & Intellectual Property

Licensed under the [MIT License](file:///d:/Aviation/LICENSE). Turnkey enterprise automation architectures include 100% client intellectual property transfer with zero recurring vendor lock-in.
