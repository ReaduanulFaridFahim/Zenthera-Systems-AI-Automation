// poster-generator.js — Zenthra Systems B2B Social Poster Engine
// Generates high-converting, 1080x1350 (4:5) dark tech minimalist posters for LinkedIn, X (Twitter), and Instagram.

const fs = require('fs');
const path = require('path');

/**
 * Generate a high-end 1080x1350 B2B poster using Node canvas or pure SVG fallback.
 */
async function generateB2BPoster({
  headline = "Is Your Website Costing You 6-Figure Deals?",
  subheadline = "Why modern Western enterprises are leaving template sites behind.",
  points = [
    { title: "Sub-Second Page Speeds (<0.8s)", desc: "Engineered in Next.js & TypeScript for 99+ Core Web Vitals." },
    { title: "24/7 Autonomous AI Sales Agents", desc: "Instantly qualify and book inbound leads without human delay." },
    { title: "Custom API & Microservice Pipelines", desc: "Automate payments, CRM sync, and enterprise workflows." }
  ],
  category = "B2B TECH INSIGHT",
  ctaText = "Scale your digital infrastructure with custom AI & web engineering.",
  ctaSub = "DM us or email connect.zenthra@gmail.com",
  outputPath = 'zenthra_poster.png'
}) {
  let hasCanvas = false;
  let canvasModule = null;

  try {
    canvasModule = require('canvas');
    hasCanvas = true;
  } catch (err) {
    hasCanvas = false;
  }

  if (hasCanvas && canvasModule) {
    const { createCanvas } = canvasModule;
    const width = 1080;
    const height = 1350; // Optimized 4:5 ratio for LinkedIn, IG, and X
    const canvas = createCanvas(width, height);
    const ctx = canvas.getContext('2d');

    // Background: Deep Dark Tech Minimalist
    ctx.fillStyle = '#0a0d14';
    ctx.fillRect(0, 0, width, height);

    // Subtle Accent Glow
    const gradient = ctx.createRadialGradient(900, 200, 50, 900, 200, 600);
    gradient.addColorStop(0, 'rgba(0, 102, 255, 0.18)');
    gradient.addColorStop(1, 'transparent');
    ctx.fillStyle = gradient;
    ctx.fillRect(0, 0, width, height);

    // Top Brand Header
    ctx.font = 'bold 24px "Plus Jakarta Sans", "Inter", "Helvetica Neue", sans-serif';
    ctx.fillStyle = '#0084ff';
    ctx.fillText('ZENTHRA SYSTEMS', 80, 100);

    ctx.font = '500 16px "Plus Jakarta Sans", "Inter", sans-serif';
    ctx.fillStyle = '#64748b';
    ctx.fillText('ENTERPRISE DIGITAL ARCHITECTURE', 80, 130);

    // Category Tag
    ctx.fillStyle = '#1e293b';
    if (ctx.roundRect) {
      ctx.beginPath();
      ctx.roundRect(80, 185, 200, 42, 8);
      ctx.fill();
    } else {
      ctx.fillRect(80, 185, 200, 42);
    }
    ctx.font = '600 14px sans-serif';
    ctx.fillStyle = '#38bdf8';
    ctx.fillText(`• ${category}`, 100, 212);

    // Main Headline
    ctx.font = 'bold 52px "Plus Jakarta Sans", "Inter", sans-serif';
    ctx.fillStyle = '#ffffff';
    ctx.fillText(headline, 80, 310, 920);

    // Subheadline
    ctx.font = 'normal 24px "Plus Jakarta Sans", "Inter", sans-serif';
    ctx.fillStyle = '#94a3b8';
    ctx.fillText(subheadline, 80, 380, 920);

    // Divider Line
    ctx.strokeStyle = '#1e293b';
    ctx.lineWidth = 2;
    ctx.beginPath();
    ctx.moveTo(80, 440);
    ctx.lineTo(1000, 440);
    ctx.stroke();

    // Value Proposition Cards
    let startY = 510;
    points.forEach((point, index) => {
      // Card Box
      ctx.fillStyle = '#0f172a';
      if (ctx.roundRect) {
        ctx.beginPath();
        ctx.roundRect(80, startY, 920, 100, 12);
        ctx.fill();
        ctx.strokeStyle = '#1e293b';
        ctx.stroke();
      } else {
        ctx.fillRect(80, startY, 920, 100);
      }

      // Checkmark / Number
      ctx.fillStyle = '#0084ff';
      ctx.font = 'bold 20px "JetBrains Mono", monospace';
      ctx.fillText(`0${index + 1}`, 110, startY + 58);

      // Point Text
      ctx.font = '600 22px sans-serif';
      ctx.fillStyle = '#f8fafc';
      ctx.fillText(point.title, 160, startY + 45);

      ctx.font = 'normal 18px sans-serif';
      ctx.fillStyle = '#94a3b8';
      ctx.fillText(point.desc, 160, startY + 75);

      startY += 125;
    });

    // Footer / Call-to-Action Box
    ctx.fillStyle = '#111827';
    if (ctx.roundRect) {
      ctx.beginPath();
      ctx.roundRect(80, 1140, 920, 120, 12);
      ctx.fill();
      ctx.strokeStyle = '#1e293b';
      ctx.stroke();
    } else {
      ctx.fillRect(80, 1140, 920, 120);
    }

    ctx.font = 'bold 22px sans-serif';
    ctx.fillStyle = '#ffffff';
    ctx.fillText(ctaText, 110, 1190);

    ctx.font = '600 18px sans-serif';
    ctx.fillStyle = '#38bdf8';
    ctx.fillText(ctaSub, 110, 1225);

    const buffer = canvas.toBuffer('image/png');
    const finalPath = path.resolve(outputPath);
    fs.writeFileSync(finalPath, buffer);
    console.log(`[Canvas] Poster generated successfully: ${finalPath}`);
    return finalPath;
  } else {
    // Pure SVG Standalone Generation Fallback (Zero npm dependencies required!)
    console.log('[Notice] "canvas" module not detected. Generating high-resolution vector SVG poster...');
    const svgContent = generateSVGPoster({ headline, subheadline, points, category, ctaText, ctaSub });
    const svgPath = outputPath.replace(/\.png$/i, '.svg');
    fs.writeFileSync(svgPath, svgContent, 'utf8');
    console.log(`[SVG] Vector poster generated successfully: ${path.resolve(svgPath)}`);
    console.log('💡 Tip: You can open this SVG in any browser, or use our in-browser studio (poster_studio.html) to export to 1080x1350 PNG with 1 click!');
    return svgPath;
  }
}

function generateSVGPoster({ headline, subheadline, points, category, ctaText, ctaSub }) {
  const pointsSVG = points.map((p, idx) => {
    const y = 510 + (idx * 125);
    return `
    <!-- Card ${idx + 1} -->
    <rect x="80" y="${y}" width="920" height="100" rx="12" fill="#0f172a" stroke="#1e293b" stroke-width="1.5" />
    <text x="110" y="${y + 58}" fill="#0084ff" font-family="'JetBrains Mono', monospace" font-weight="bold" font-size="20">0${idx + 1}</text>
    <text x="160" y="${y + 45}" fill="#f8fafc" font-family="'Plus Jakarta Sans', sans-serif" font-weight="600" font-size="22">${escapeXML(p.title)}</text>
    <text x="160" y="${y + 75}" fill="#94a3b8" font-family="'Plus Jakarta Sans', sans-serif" font-size="18">${escapeXML(p.desc)}</text>
    `;
  }).join('\n');

  return `<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1080 1350" width="1080" height="1350">
  <defs>
    <radialGradient id="techGlow" cx="85%" cy="15%" r="50%">
      <stop offset="0%" stop-color="#0066ff" stop-opacity="0.22" />
      <stop offset="100%" stop-color="#0066ff" stop-opacity="0" />
    </radialGradient>
    <linearGradient id="brandGrad" x1="0%" y1="0%" x2="100%" y2="100%">
      <stop offset="0%" stop-color="#0084ff" />
      <stop offset="100%" stop-color="#2563eb" />
    </linearGradient>
  </defs>

  <!-- Background -->
  <rect width="1080" height="1350" fill="#0a0d14" />
  <rect width="1080" height="1350" fill="url(#techGlow)" />

  <!-- Top Brand Header -->
  <text x="80" y="100" fill="#0084ff" font-family="'Plus Jakarta Sans', sans-serif" font-weight="800" font-size="24" letter-spacing="1">ZENTHRA SYSTEMS</text>
  <text x="80" y="130" fill="#64748b" font-family="'Plus Jakarta Sans', sans-serif" font-weight="600" font-size="16" letter-spacing="2">ENTERPRISE DIGITAL ARCHITECTURE</text>

  <!-- Category Tag -->
  <rect x="80" y="185" width="220" height="42" rx="8" fill="#1e293b" />
  <text x="100" y="212" fill="#38bdf8" font-family="'Plus Jakarta Sans', sans-serif" font-weight="700" font-size="14" letter-spacing="1">• ${escapeXML(category)}</text>

  <!-- Main Headline -->
  <text x="80" y="310" fill="#ffffff" font-family="'Plus Jakarta Sans', sans-serif" font-weight="800" font-size="48">${escapeXML(headline)}</text>

  <!-- Subheadline -->
  <text x="80" y="375" fill="#94a3b8" font-family="'Plus Jakarta Sans', sans-serif" font-size="24">${escapeXML(subheadline)}</text>

  <!-- Divider Line -->
  <line x1="80" y1="440" x2="1000" y2="440" stroke="#1e293b" stroke-width="2" />

  <!-- Points -->
  ${pointsSVG}

  <!-- Footer / Call-to-Action Box -->
  <rect x="80" y="1140" width="920" height="120" rx="12" fill="#111827" stroke="#1e293b" stroke-width="1.5" />
  <text x="110" y="1190" fill="#ffffff" font-family="'Plus Jakarta Sans', sans-serif" font-weight="700" font-size="22">${escapeXML(ctaText)}</text>
  <text x="110" y="1225" fill="#38bdf8" font-family="'Plus Jakarta Sans', sans-serif" font-weight="600" font-size="18">${escapeXML(ctaSub)}</text>
</svg>`;
}

function escapeXML(str) {
  if (!str) return '';
  return str.replace(/[<>&'"]/g, c => {
    switch (c) {
      case '<': return '&lt;';
      case '>': return '&gt;';
      case '&': return '&amp;';
      case '\'': return '&apos;';
      case '"': return '&quot;';
    }
  });
}

// Default execution if run directly
if (require.main === module) {
  generateB2BPoster({
    headline: "Is Your Website Costing You 6-Figure Deals?",
    subheadline: "Why modern Western enterprises are leaving template sites behind.",
    points: [
      { title: "Sub-Second Page Speeds (<0.8s)", desc: "Engineered in Next.js & TypeScript for 99+ Core Web Vitals." },
      { title: "24/7 Autonomous AI Sales Agents", desc: "Instantly qualify and book inbound leads without human delay." },
      { title: "Custom API & Microservice Pipelines", desc: "Automate payments, CRM sync, and enterprise workflows." }
    ],
    outputPath: 'zenthra_poster.png'
  }).catch(console.error);
}

module.exports = { generateB2BPoster, generateSVGPoster };
