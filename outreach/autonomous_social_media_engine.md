# Zenthra Systems — Autonomous Social Media & Inbound Acquisition Engine

> 🚀 **Production Blueprint:** Autonomous multi-platform B2B content generation, automated poster rendering (1080x1350), multi-network distribution (LinkedIn, X, Instagram, Facebook), and 24/7 inbound DM lead triage.

---

## 🏗️ Architectural Topology

```
                  ┌──────────────────────────────────────────────┐
                  │ n8n Schedule Trigger (Mon / Wed / Fri 13:00) │
                  └──────────────────────┬───────────────────────┘
                                         │
                                         ▼
                  ┌──────────────────────────────────────────────┐
                  │         OpenAI Node (GPT-4o Engine)          │
                  │ • Generates LinkedIn, X, & Instagram copy    │
                  │ • Formulates B2B Poster Headline & 3 Points  │
                  └──────────────────────┬───────────────────────┘
                                         │
                    ┌────────────────────┴────────────────────┐
                    ▼                                         ▼
  ┌───────────────────────────────────┐     ┌───────────────────────────────────┐
  │ Option A: Node.js / HTML5 Canvas  │     │ Option B: Creatomate Video API    │
  │ • 1080x1350 (4:5) Tech Minimalist │     │ • Dynamic motion graphics render  │
  │ • Zero recurring tool fees        │     │ • Output: Hosted MP4 / WebP URL   │
  └─────────────────┬─────────────────┘     └─────────────────┬─────────────────┘
                    │                                         │
                    └────────────────────┬────────────────────┘
                                         │
                                         ▼
                  ┌──────────────────────────────────────────────┐
                  │    Ayrshare / Publer Unified Social API      │
                  │ • Single POST distributes cross-network:     │
                  │   LinkedIn Company Page, X, IG Pro, FB Page  │
                  └──────────────────────┬───────────────────────┘
                                         │
                                         ▼
                  ┌──────────────────────────────────────────────┐
                  │        24/7 Inbound DM Lead Triage           │
                  │ (ManyChat + n8n Webhook -> Cal.com Booking)  │
                  │ Trigger Keywords: WEBSITE, AI, AUDIT, SCALE  │
                  └──────────────────────────────────────────────┘
```

---

## 🎨 Phase 1: Automated High-End Poster Engine

The poster engine generates **1080x1350 (4:5 aspect ratio)** graphics specifically optimized for the algorithms of LinkedIn, Instagram, and X.

### Technical Specifications
- **Dimensions:** 1080 x 1350 pixels (4:5 portrait ratio — maximizes screen real estate on mobile feeds).
- **Aesthetic:** Dark enterprise tech minimalist (`#0a0d14` slate-black base with radial royal blue/cyan ambient glow).
- **Typography:** Bold headers (`Plus Jakarta Sans` / `Inter`), monospaced numbering (`01`, `02`, `03` in `JetBrains Mono`).
- **Footer CTA:** Persistent call-to-action directing to `connect.zenthra@gmail.com` and `https://cal.com/zenthra-systems-dyuqpi/30min`.

### Running Locally / In CI/CD
```bash
# Generate the default B2B Tech Insight Poster
node poster-generator.js

# Or require the module programmatically:
const { generateB2BPoster } = require('./tools/poster-generator.js');

generateB2BPoster({
  headline: "Why Zapier Breaks at 10,000 Events/Month",
  subheadline: "The cost breakdown between workflow stitching and custom n8n clusters.",
  points: [
    { title: "Task Tax Elimination", desc: "Save $800+/mo in Zapier task overages with self-hosted n8n." },
    { title: "Sub-Second Event Processing", desc: "Direct Webhook-to-PostgreSQL processing with zero rate limits." },
    { title: "Complete Data Sovereignty", desc: "Customer PII never traverses third-party automation servers." }
  ],
  category: "ENTERPRISE AUTOMATION",
  outputPath: "outbound_zapier_comparison.png"
});
```

---

## ⚙️ Phase 2: n8n Workflow Configuration (`workflows/zenthra_social_automation.json`)

The production workflow is saved at [`workflows/zenthra_social_automation.json`](file:///d:/Aviation/workflows/zenthra_social_automation.json).

### Workflow Node Breakdown

| Node Name | Node Type | Purpose | Configuration Notes |
| :--- | :--- | :--- | :--- |
| **Schedule (Mon/Wed/Fri 1PM GMT)** | `scheduleTrigger` | Triggers post generation 3x/week at peak Western B2B browsing times (09:00 AM EST / 14:00 GMT). | Cron: `0 13 * * 1,3,5` |
| **Generate Marketing Copy & Poster Data** | `@n8n/n8n-nodes-langchain.openAi` | Prompts GPT-4o with Zenthra Systems' elite voice to output structured JSON. | Schema includes `linkedin_post`, `twitter_post`, `ig_caption`, and poster fields. |
| **Render Dynamic Video / Image (Creatomate API)** | `httpRequest` | (Optional) Renders animated video or banner via Creatomate template. | Endpoint: `https://api.creatomate.com/v1/renders` |
| **Auto-Publish Across All Platforms (Ayrshare API)** | `httpRequest` | Dispatches post copy + media URL simultaneously to LinkedIn, X, IG, and Facebook. | Endpoint: `https://api.ayrshare.com/api/post` |

### How to Import into n8n:
1. Open your n8n workspace (`https://zenthrasystems.app.n8n.cloud` or self-hosted).
2. Click **Workflows** → **Import from File**.
3. Select [`workflows/zenthra_social_automation.json`](file:///d:/Aviation/workflows/zenthra_social_automation.json).
4. Supply your OpenAI Credential and your Ayrshare API key in the HTTP Request node.
5. Toggle the workflow to **Active**.

---

## 🌐 Phase 3: Multi-Platform Unified Publishing Setup

Instead of maintaining 4 separate developer apps (Meta Graph API, LinkedIn OAuth 2.0, X Developer Portal with $100/mo paywalls), Ayrshare or Publer provides a unified gateway.

### Setup Instructions (Ayrshare)
1. Create a free/pro account at [Ayrshare.com](https://www.ayrshare.com/).
2. In the Ayrshare Social Accounts dashboard, connect:
   - **LinkedIn:** Official Zenthra Systems Company Page.
   - **X (Twitter):** Official `@ZenthraSystems` handle.
   - **Instagram:** Business/Creator account connected to your Facebook Page.
   - **Facebook:** Official Zenthra Systems Agency Page.
3. Copy your API Key from the Ayrshare dashboard.
4. Set the API Key in the n8n HTTP Request node header:
   `Authorization: Bearer YOUR_AYRSHARE_API_KEY`
5. The unified payload automatically handles character limits (280 on X, 3000 on LinkedIn) and media transcoding per platform.

---

## 🤖 Phase 4: Automated Inbound Lead Triage (24/7 DMs)

When prospective clients in North America, UK, and Europe discover your content and comment or DM your accounts:

### ManyChat / Native Webhook Automation Architecture
1. **Trigger Keywords:** `WEBSITE`, `AUDIT`, `AI`, `CODE`, `SCALE`, `SPRINT`.
2. **Instant Automated Response (under 15 seconds):**
   > *"Hey! Thanks for reaching out to Zenthra Systems. We engineer custom web applications and autonomous AI pipelines for scaling brands. What type of project are you looking to build (e.g. Full-Stack Web App, Custom AI Agent, or Infrastructure Rebuild)?"*
3. **Follow-Up Decision Branch:**
   - **If Web App / MVP:** Prompts for current tech stack and directs to the website ROI Calculator: `https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/#calculator`.
   - **If Discovery Call Requested:** Sends Cal.com booking link: `https://cal.com/zenthra-systems-dyuqpi/30min`.
   - **Lead Capture:** Dispatches contact email and project notes directly to `connect.zenthra@gmail.com`.

---

## 📅 High-Converting Content Pillars

| Day | Pillar | Angle & Hook | CTA |
| :--- | :--- | :--- | :--- |
| **Monday** | **Technical Breakdown** | *"Why static brochure sites fail to convert enterprise deals in 2026."* | *"Audit your web architecture: DM 'AUDIT'"* |
| **Wednesday** | **Economic Comparison** | *"The real cost of Zapier vs. self-hosted n8n at scale ($12k/yr difference)."* | *"Calculate your ROI on our live portal"* |
| **Friday** | **Case Study Proof** | *"How our 2-week Automation Sprint automated lead qualification for Cyclistic."* | *"Book your 30-min architecture session on Cal.com"* |
