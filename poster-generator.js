// poster-generator.js — Root Entrypoint for Zenthra Systems B2B Social Poster Engine
// Requirements: npm install canvas (Optional — automatic SVG vector fallback provided if canvas is absent)

const { generateB2BPoster } = require('./tools/poster-generator.js');

// Example Execution matching user specification
generateB2BPoster({
  headline: "Is Your Website Costing You 6-Figure Deals?",
  subheadline: "Why modern Western enterprises are leaving template sites behind.",
  points: [
    { title: "Sub-Second Page Speeds (<0.8s)", desc: "Engineered in Next.js & TypeScript for 99+ Core Web Vitals." },
    { title: "24/7 Autonomous AI Sales Agents", desc: "Instantly qualify and book inbound leads without human delay." },
    { title: "Custom API & Microservice Pipelines", desc: "Automate payments, CRM sync, and enterprise workflows." }
  ],
  outputPath: 'zenthra_poster.png'
});
