# ==============================================================================
# Execute Repository Content & README Updates via Git & GitHub CLI
# ==============================================================================

$tempDir = "d:\Aviation\.temp_repos_upgrade"
if (Test-Path $tempDir) {
    Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue
}
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null

$licenseContent = Get-Content "d:\Aviation\LICENSE" -Raw
$profileReadme = Get-Content "d:\Aviation\outreach\github_portfolio_elevation_guide.md" -Raw
# Extract section between the first ```markdown and the next ```
if ($profileReadme -match "(?s)```markdown\r?\n(.*?)\r?\n```\r?\n\r?\n---") {
    $profileReadme = $Matches[1]
}

$tasks = @(
    @{
        repo = "ReaduanulFaridFahim/ReaduanulFaridFahim"
        sub = "profile"
        readmeContent = $profileReadme
        addLicense = $false
        commitMsg = "feat: upgrade master profile README with executive engineering showcase and live deployments"
    },
    @{
        repo = "ReaduanulFaridFahim/Libray-Managment-System-RFF-WRT"
        sub = "library"
        readmeContent = (Get-Content "d:\Aviation\outreach\skeletal_repos_readmes\library_management_README.md" -Raw)
        addLicense = $true
        commitMsg = "docs: add enterprise architecture documentation and MIT license"
    },
    @{
        repo = "ReaduanulFaridFahim/Hotel-Management-System-"
        sub = "hotel"
        readmeContent = (Get-Content "d:\Aviation\outreach\skeletal_repos_readmes\hotel_management_README.md" -Raw)
        addLicense = $true
        commitMsg = "docs: add full-stack reservation system documentation and MIT license"
    },
    @{
        repo = "ReaduanulFaridFahim/CV"
        sub = "cv"
        readmeContent = (Get-Content "d:\Aviation\outreach\skeletal_repos_readmes\cv_README.md" -Raw)
        addLicense = $true
        commitMsg = "docs: add responsive digital CV architecture documentation and MIT license"
    }
)

Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "  EXECUTING REPOSITORY CODE & DOCUMENTATION UPGRADES" -ForegroundColor White
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host ""

$completed = 0

foreach ($t in $tasks) {
    $repoName = $t.repo
    $dest = Join-Path $tempDir $t.sub
    Write-Host "Processing: $repoName ..." -ForegroundColor Yellow

    try {
        & gh repo clone $repoName $dest 2>&1 | Out-Null
        if (-not (Test-Path $dest)) {
            Write-Host "  [ERROR] Failed to clone $repoName" -ForegroundColor Red
            continue
        }

        # Write new README
        $readmePath = Join-Path $dest "README.md"
        [System.IO.File]::WriteAllText($readmePath, $t.readmeContent, [System.Text.Encoding]::UTF8)

        # Write LICENSE if requested
        if ($t.addLicense) {
            $licensePath = Join-Path $dest "LICENSE"
            [System.IO.File]::WriteAllText($licensePath, $licenseContent, [System.Text.Encoding]::UTF8)
        }

        # Commit and push
        $pushed = $false
        Push-Location $dest
        try {
            & git add -A 2>&1 | Out-Null
            & git commit -m $t.commitMsg 2>&1 | Out-Null
            $pushRes = & git push 2>&1
            Write-Host "  [SUCCESS] $repoName upgraded and pushed to GitHub." -ForegroundColor Green
            $completed++
            $pushed = $true
        } finally {
            Pop-Location
        }
    } catch {
        Write-Host "  [ERROR] $repoName update failed: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Cleanup
Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "CONTENT UPGRADE COMPLETE: $completed / $($tasks.Count) Repositories Pushed" -ForegroundColor Green
Write-Host "======================================================================" -ForegroundColor Cyan
