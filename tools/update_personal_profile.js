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

const markdown = fs.readFileSync('tools/personal_profile_readme.md', 'utf8');

// Strictly verify zero mention of zenthra
if (/zenthra/i.test(markdown)) {
  console.error("ERROR: Found mention of zenthra! Aborting.");
  process.exit(1);
}

const base64Content = Buffer.from(markdown, 'utf8').toString('base64');

const body = JSON.stringify({
  message: "docs(profile): update personal profile with animations, view counter, and zero agency mentions",
  content: base64Content,
  sha: sha
});

const tempPath = 'tools/_temp_profile_payload.json';
fs.writeFileSync(tempPath, body, 'utf8');

try {
  console.log("Pushing animated personal profile README to GitHub...");
  execSync(`gh api --method PUT repos/${owner}/${repo}/contents/${path} --input ${tempPath}`, { stdio: 'inherit' });
  console.log("SUCCESS! Personal profile README updated with dynamic animations and view counter.");
} finally {
  if (fs.existsSync(tempPath)) {
    fs.unlinkSync(tempPath);
  }
}
