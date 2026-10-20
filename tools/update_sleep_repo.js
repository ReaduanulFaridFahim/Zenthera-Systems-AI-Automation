const fs = require('fs');
const { execSync } = require('child_process');

const owner = 'ReaduanulFaridFahim';
const repo = 'Sleep-Disorder-Predictions-';
const path = 'README.md';

console.log(`Fetching latest SHA for ${owner}/${repo}/${path}...`);
const fileInfoRaw = execSync(`gh api repos/${owner}/${repo}/contents/${path}`, { encoding: 'utf8' });
const fileInfo = JSON.parse(fileInfoRaw);
const sha = fileInfo.sha;
console.log(`Current SHA: ${sha}`);

const markdown = fs.readFileSync('tools/sleep_disorder_readme.md', 'utf8');

// Strict safety check
if (/zenth/i.test(markdown)) {
  console.error("ERROR: Found mention of zenthra! Aborting.");
  process.exit(1);
}

const base64Content = Buffer.from(markdown, 'utf8').toString('base64');

const body = JSON.stringify({
  message: "docs(readme): upgrade to publication-grade ML documentation with 9-model benchmarks, LIME XAI, and pipeline architecture",
  content: base64Content,
  sha: sha
});

const tempPath = 'tools/_temp_sleep_payload.json';
fs.writeFileSync(tempPath, body, 'utf8');

try {
  console.log("Pushing Sleep Disorder Predictions README to GitHub...");
  execSync(`gh api --method PUT repos/${owner}/${repo}/contents/${path} --input ${tempPath}`, { stdio: 'inherit' });
  console.log("SUCCESS! Sleep Disorder Predictions README updated professionally.");
} finally {
  if (fs.existsSync(tempPath)) {
    fs.unlinkSync(tempPath);
  }
}
