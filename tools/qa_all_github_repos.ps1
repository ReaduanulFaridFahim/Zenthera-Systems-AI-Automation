# ==============================================================================
# Comprehensive Multi-Repository QA Inspector for ReaduanulFaridFahim
# ==============================================================================

$user = "ReaduanulFaridFahim"
$reposJsonFile = "d:\Aviation\outreach\all_github_repositories.json"

if (-not (Test-Path $reposJsonFile)) {
    Write-Host "[ERROR] Repositories inventory file missing." -ForegroundColor Red
    exit 1
}

$repos = Get-Content $reposJsonFile -Raw | ConvertFrom-Json
$qaResults = @()

Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "  PERFORMING DEEP QA AUDIT ON ALL 14 GITHUB REPOSITORIES" -ForegroundColor White
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host ""

$index = 0
foreach ($r in $repos) {
    $index++
    $repoName = $r.name
    Write-Host "[$index/$($repos.Count)] Auditing: $repoName ..." -ForegroundColor Yellow

    $hasDescription = -not [string]::IsNullOrWhiteSpace($r.description)
    $descLength = if ($hasDescription) { $r.description.Length } else { 0 }
    
    # Query repository details from API
    $apiRepoUrl = "https://api.github.com/repos/$user/$repoName"
    $apiReadmeUrl = "https://api.github.com/repos/$user/$repoName/readme"
    
    $hasReadme = $false
    $readmeSize = 0
    $topics = @()
    $hasLicense = $false
    $licenseName = "None"
    $openIssues = 0
    $pagesStatus = "None"

    try {
        $detail = Invoke-RestMethod -Uri $apiRepoUrl -Headers @{ "User-Agent" = "PowerShell-QA-Auditor" } -TimeoutSec 10
        if ($detail.topics) { $topics = $detail.topics }
        $openIssues = $detail.open_issues_count
        if ($detail.license) {
            $hasLicense = $true
            $licenseName = $detail.license.spdx_id
        }
    } catch {}

    try {
        $rm = Invoke-RestMethod -Uri $apiReadmeUrl -Headers @{ "User-Agent" = "PowerShell-QA-Auditor" } -TimeoutSec 10
        $hasReadme = $true
        $readmeSize = $rm.size
    } catch {}

    # Check pages status if enabled using curl.exe
    if ($r.has_pages) {
        $pagesUrl = if ($repoName -eq "$user.github.io") {
            "https://$user.github.io/"
        } else {
            "https://$user.github.io/$repoName/"
        }
        $curlHeader = & curl.exe -s -I -m 4 $pagesUrl 2>$null
        if ($curlHeader -match "HTTP/.*?\s(\d{3})") {
            $pagesStatus = "$($Matches[1]) Live"
        } else {
            $pagesStatus = "Active"
        }
    }

    $gaps = @()
    if (-not $hasDescription) { $gaps += "Missing description" }
    elseif ($descLength -lt 20) { $gaps += "Short description" }
    
    if (-not $hasReadme) { $gaps += "Missing README.md" }
    elseif ($readmeSize -lt 250) { $gaps += "README.md skeletal" }

    if ($topics.Count -eq 0) { $gaps += "No topics/tags" }
    if (-not $hasLicense) { $gaps += "No open-source license" }

    $qaGrade = if ($gaps.Count -eq 0) { "A+ (Enterprise)" }
               elseif ($gaps.Count -le 2) { "B (Solid / Polish Needed)" }
               else { "C (Needs Attention)" }

    $color = if ($qaGrade -like 'A*') { 'Green' } elseif ($qaGrade -like 'B*') { 'Cyan' } else { 'Yellow' }
    Write-Host "  Grade: $qaGrade | README: $(if ($hasReadme) { 'Yes (' + $readmeSize + ' B)' } else { 'NO' }) | Pages: $pagesStatus" -ForegroundColor $color
    if ($gaps.Count -gt 0) {
        Write-Host "  Identified Gaps: $($gaps -join ' | ')" -ForegroundColor Gray
    }
    Write-Host ""

    $qaResults += @{
        name = $repoName
        html_url = $r.html_url
        description = $r.description
        has_readme = $hasReadme
        readme_size = $readmeSize
        topics = $topics
        has_license = $hasLicense
        license = $licenseName
        language = $r.language
        has_pages = $r.has_pages
        pages_status = $pagesStatus
        open_issues = $openIssues
        gaps = $gaps
        qa_grade = $qaGrade
    }
}

$summary = @{
    audited_at = (Get-Date).ToString("o")
    total_repositories = $repos.Count
    results = $qaResults
}

$summaryJson = $summary | ConvertTo-Json -Depth 6
[System.IO.File]::WriteAllText("d:\Aviation\outreach\all_repos_qa_audit.json", $summaryJson)

Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "QA AUDIT COMPLETE ACROSS ALL $($repos.Count) REPOSITORIES" -ForegroundColor Green
Write-Host "Detailed report saved to d:\Aviation\outreach\all_repos_qa_audit.json" -ForegroundColor Yellow
Write-Host "======================================================================" -ForegroundColor Cyan
