const { execSync } = require('child_process');

const owner = 'ReaduanulFaridFahim';
const repo = 'Sign-Language-Detection';

console.log(`Inspecting ${owner}/${repo}...`);
try {
  const contentsRaw = execSync(`gh api repos/${owner}/${repo}/contents`, { encoding: 'utf8' });
  const files = JSON.parse(contentsRaw);
  console.log('Files:');
  console.log(files.map(f => ({ name: f.name, type: f.type, size: f.size })));

  try {
    const readmeRaw = execSync(`gh api repos/${owner}/${repo}/contents/README.md`, { encoding: 'utf8' });
    const readmeJson = JSON.parse(readmeRaw);
    const readmeText = Buffer.from(readmeJson.content, 'base64').toString('utf8');
    console.log('\n--- Current README.md Content ---');
    console.log(readmeText);
    console.log('--- End Current README.md Content ---\n');
    console.log('README SHA:', readmeJson.sha);
  } catch (err) {
    console.log('README.md not found or error:', err.message);
  }
} catch (e) {
  console.error('Error:', e.message);
}
