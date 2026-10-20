const fs = require('fs');
const { execSync } = require('child_process');

const owner = 'ReaduanulFaridFahim';
const repo = 'ReaduanulFaridFahim';
const path = 'README.md';

console.log(`Fetching latest SHA for ${owner}/${repo}/${path}...`);
const fileInfoRaw = execSync(`gh api repos/${owner}/${repo}/contents/${path}`, { encoding: 'utf8' });
const fileInfo = JSON.parse(fileInfoRaw);
const sha = fileInfo.sha;
console.log(`Current SHA: ${sha}`);

const markdown = `<div align="center">

# Hi there, I'm Readuanul Farid Fahim 👋
### AI Systems Engineer · Autonomous Workflow Architect · Solutions Lead

[![Profile Views](https://komarev.com/ghpvc/?username=ReaduanulFaridFahim&label=Profile%20Views&color=0284c7&style=for-the-badge&logo=eye)](https://github.com/ReaduanulFaridFahim)
[![Cal.com Booking](https://img.shields.io/badge/Cal.com-Schedule%2030--Min%20Discovery-0284c7?style=for-the-badge&logo=calendar)](https://cal.com/zenthra-systems-dyuqpi/30min)
[![Email](https://img.shields.io/badge/Email-connect.zenthra%40gmail.com-ea4335?style=for-the-badge&logo=gmail)](mailto:connect.zenthra@gmail.com)
[![Live Platform](https://img.shields.io/badge/Live%20Platform-Zenthra%20Systems-059669?style=for-the-badge&logo=statuspage)](https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/)
[![Portfolio](https://img.shields.io/badge/Portfolio-Personal%20Site-7c3aed?style=for-the-badge&logo=google-chrome)](https://readuanulfaridfahim.github.io/)

<br>

**Founder of [Zenthra Systems](https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/) · Architecting Sovereign AI Agents, n8n Orchestration Clusters & Enterprise Automation Meshes**

</div>

---

### 🚀 Executive Bio

I architect high-throughput autonomous AI agents, enterprise n8n workflow systems, sovereign Supabase pgvector RAG databases, and resilient full-stack applications. I partner with scaling enterprises across North America, EMEA, and APAC to eliminate manual data handoffs and reclaim up to **85% of operational labor costs**.

- 🏢 **Founder & Solutions Architect:** [Zenthra Systems](https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/) — Enterprise AI Automation Agency & Systems Studio.
- 🧠 **Technical Specializations:** Autonomous AI Agents (LangChain / GPT-4o / Claude 3.5), n8n Private Clusters, Sovereign Vector Search (Supabase pgvector), Mobile & Web SQA Automation (Appium / Selenium / PyTest), Computer Vision & Document OCR.
- 🌍 **Global Coverage:** Deploying turnkey automation systems across the US, UK, Europe, Singapore, and Australia.
- 💬 **Ask Me About:** Eliminating the "Zapier tax", sub-30s speed-to-lead triage, autonomous invoicing vision pipelines, and multi-currency ROI modeling.

---

### 🏆 Featured Flagship Repositories

| Repository | Focus & Architecture | Live Deployment |
| :--- | :--- | :--- |
| [**Zenthera-Systems-AI-Automation**](https://github.com/ReaduanulFaridFahim/Zenthera-Systems-AI-Automation) | Autonomous Front-Office AI Agent, n8n Orchestration Backbone, Supabase pgvector RAG, Multi-CRM Sync & B2B Poster Studio | [🌐 Live Enterprise Portal](https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/) • [🎨 Poster Studio](https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/poster_studio.html) |
| [**tactical-void-replacement-engine**](https://github.com/ReaduanulFaridFahim/tactical-void-replacement-engine) | Empirical Sporting Continuity, Vector Similarity & Arbitrage Scouting Platform for Football Players and Coaches | [🌐 Live Analytics App](https://readuanulfaridfahim.github.io/tactical-void-replacement-engine/) |
| [**ABC-Company-Sqa-Assignment**](https://github.com/ReaduanulFaridFahim/ABC-Company-Sqa-Assignment) | Enterprise Mobile App SQA Automation Suite engineered with Appium, PyTest, and Page Object Model (POM) | [📄 Architecture & POM Specs](https://github.com/ReaduanulFaridFahim/ABC-Company-Sqa-Assignment) |
| [**football-transfers-ffp**](https://github.com/ReaduanulFaridFahim/football-transfers-ffp) | Financial Fair Play (FFP) Compliance, Squad Amortization & Transfer Market Intelligence Platform | [🌐 Analytics Portal](https://readuanulfaridfahim.github.io/football-transfers-ffp/) |
| [**readuanulfaridfahim.github.io**](https://github.com/ReaduanulFaridFahim/readuanulfaridfahim.github.io) | Personal Engineering Portfolio & Technical Systems Showcase | [🌐 Live Website](https://readuanulfaridfahim.github.io/) |

---

### 🛠️ Core Engineering Stack

<p align="center">
  <img src="https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white" />
  <img src="https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge&logo=typescript&logoColor=white" />
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black" />
  <img src="https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=node.js&logoColor=white" />
  <img src="https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/n8n-EA4B71?style=for-the-badge&logo=n8n&logoColor=white" />
  <img src="https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white" />
  <img src="https://img.shields.io/badge/OpenAI-412991?style=for-the-badge&logo=openai&logoColor=white" />
  <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" />
  <img src="https://img.shields.io/badge/Appium-662D91?style=for-the-badge&logo=appium&logoColor=white" />
  <img src="https://img.shields.io/badge/Selenium-43B02A?style=for-the-badge&logo=selenium&logoColor=white" />
  <img src="https://img.shields.io/badge/PyTest-0A9EDC?style=for-the-badge&logo=pytest&logoColor=white" />
</p>

\`\`\`
Languages:        Python, TypeScript, JavaScript (ES6+), SQL (PostgreSQL), HTML5/CSS3
AI & RAG:         LangChain, OpenAI GPT-4o, Claude 3.5 Sonnet, Supabase pgvector, HuggingFace
Automation:       n8n (Self-Hosted Clusters & Cloud), Webhook Event Meshes, Zapier Migration, Ayrshare API
CRM & APIs:       HubSpot API, Notion Enterprise API, Resend, SendGrid, Cal.com API, Apollo.io, Slack Webhooks
QA & Testing:     Appium, Selenium WebDriver, PyTest, Allure Reporting, Postman, Jest
Data & Cloud:     PostgreSQL, Google BigQuery, Redis, Docker, GitHub Actions, Linux
\`\`\`

---

### 📊 GitHub Activity & Real-Time Telemetry

<p align="center">
  <img src="https://github-readme-stats.vercel.app/api?username=ReaduanulFaridFahim&show_icons=true&theme=tokyonight&hide_border=true&count_private=true" width="49%" />
  <img src="https://github-readme-stats.vercel.app/api/top-langs/?username=ReaduanulFaridFahim&layout=compact&theme=tokyonight&hide_border=true" width="49%" />
</p>

<p align="center">
  <img src="https://github-readme-streak-stats.herokuapp.com/?user=ReaduanulFaridFahim&theme=tokyonight&hide_border=true" width="98%" />
</p>

---

### 📬 Connect With Me

- 📅 **Direct Consultation:** [https://cal.com/zenthra-systems-dyuqpi/30min](https://cal.com/zenthra-systems-dyuqpi/30min)
- 💼 **Email:** [connect.zenthra@gmail.com](mailto:connect.zenthra@gmail.com)
- 🌐 **Company Website:** [https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/](https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/)
- 💻 **Engineering Portfolio:** [https://readuanulfaridfahim.github.io/](https://readuanulfaridfahim.github.io/)
`;

const base64Content = Buffer.from(markdown, 'utf8').toString('base64');

const body = JSON.stringify({
  message: "docs(profile): elevate README with executive showcase, tech stack shields, telemetry, and live view count",
  content: base64Content,
  sha: sha
});

const tempPath = 'tools/_temp_profile_payload.json';
fs.writeFileSync(tempPath, body, 'utf8');

try {
  console.log("Pushing UTF-8 profile update to GitHub...");
  execSync(`gh api --method PUT repos/${owner}/${repo}/contents/${path} --input ${tempPath}`, { stdio: 'inherit' });
  console.log("SUCCESS! Profile README updated with pristine UTF-8 encoding and live view count.");
} finally {
  if (fs.existsSync(tempPath)) {
    fs.unlinkSync(tempPath);
  }
}
