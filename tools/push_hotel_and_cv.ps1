# ==============================================================================
# Push Documentation & License for Hotel-Management-System- and CV
# ==============================================================================

$tempDir = "d:\Aviation\.temp_repos_upgrade"
$licenseContent = Get-Content "d:\Aviation\LICENSE" -Raw

# 1. Hotel Management System
$hotelDest = Join-Path $tempDir "hotel"
if (-not (Test-Path $hotelDest)) {
    & gh repo clone "ReaduanulFaridFahim/Hotel-Management-System-" $hotelDest
}

$hotelReadme = Get-Content "d:\Aviation\outreach\skeletal_repos_readmes\hotel_management_README.md" -Raw
[System.IO.File]::WriteAllText((Join-Path $hotelDest "README.md"), $hotelReadme, [System.Text.Encoding]::UTF8)
[System.IO.File]::WriteAllText((Join-Path $hotelDest "LICENSE"), $licenseContent, [System.Text.Encoding]::UTF8)

Push-Location $hotelDest
try {
    & git checkout -B main
    & git add README.md LICENSE
    & git commit -m "docs: add full-stack reservation system documentation and MIT license"
    & git push -u origin main
    Write-Host "[SUCCESS] Hotel-Management-System- pushed." -ForegroundColor Green
} catch {
    Write-Host "[ERROR] Hotel: $($_.Exception.Message)" -ForegroundColor Red
} finally {
    Pop-Location
}

# 2. CV Repository
$cvDest = Join-Path $tempDir "cv"
if (Test-Path $cvDest) {
    Remove-Item -Path $cvDest -Recurse -Force -ErrorAction SilentlyContinue
}
& gh repo clone "ReaduanulFaridFahim/CV" $cvDest

$cvReadme = Get-Content "d:\Aviation\outreach\skeletal_repos_readmes\cv_README.md" -Raw
[System.IO.File]::WriteAllText((Join-Path $cvDest "README.md"), $cvReadme, [System.Text.Encoding]::UTF8)
[System.IO.File]::WriteAllText((Join-Path $cvDest "LICENSE"), $licenseContent, [System.Text.Encoding]::UTF8)

Push-Location $cvDest
try {
    & git checkout -B main
    & git add README.md LICENSE
    & git commit -m "docs: add responsive digital CV architecture documentation and MIT license"
    & git push -u origin main
    Write-Host "[SUCCESS] CV repository pushed." -ForegroundColor Green
} catch {
    Write-Host "[ERROR] CV: $($_.Exception.Message)" -ForegroundColor Red
} finally {
    Pop-Location
}

# Cleanup
Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue
Write-Host "All targets pushed and cleaned up." -ForegroundColor Cyan
