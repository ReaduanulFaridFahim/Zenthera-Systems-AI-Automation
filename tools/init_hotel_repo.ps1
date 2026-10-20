# ==============================================================================
# Initialize Empty Hotel-Management-System- Repository
# ==============================================================================

$tempDir = "d:\Aviation\.temp_hotel_init"
if (Test-Path $tempDir) {
    Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue
}
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

$readmeContent = Get-Content "d:\Aviation\outreach\skeletal_repos_readmes\hotel_management_README.md" -Raw
$licenseContent = Get-Content "d:\Aviation\LICENSE" -Raw

[System.IO.File]::WriteAllText((Join-Path $tempDir "README.md"), $readmeContent, [System.Text.Encoding]::UTF8)
[System.IO.File]::WriteAllText((Join-Path $tempDir "LICENSE"), $licenseContent, [System.Text.Encoding]::UTF8)

Push-Location $tempDir
try {
    & git init 2>&1 | Out-Null
    & git config user.name "Readuanul Farid Fahim"
    & git config user.email "connect.zenthra@gmail.com"
    & git branch -M main
    & git remote add origin "https://github.com/ReaduanulFaridFahim/Hotel-Management-System-.git"
    & git add -A
    & git commit -m "docs: initialize full-stack hotel management architecture and MIT license"
    & git push -u origin main --force
    Write-Host "[SUCCESS] Hotel-Management-System- initialized and pushed to main!" -ForegroundColor Green
} catch {
    Write-Host "[ERROR] $($_.Exception.Message)" -ForegroundColor Red
} finally {
    Pop-Location
}

Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue
