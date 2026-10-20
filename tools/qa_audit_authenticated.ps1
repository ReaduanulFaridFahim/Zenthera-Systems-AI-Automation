# Authenticated QA Audit across all 14 public repositories using GitHub CLI
$repos = @(
    "Zenthera-Systems-AI-Automation",
    "tactical-void-replacement-engine",
    "football-transfers-ffp",
    "ReaduanulFaridFahim",
    "readuanulfaridfahim.github.io",
    "Pre-Owned-Bike-Price-Prediction",
    "ABC-Company-Sqa-Assignment",
    "Augmented-Reality-Based-Clothing-Trial-App",
    "-Bangla-Handwritten-Text-Conversion-Using-Optical-Character-Recognition-",
    "Sign-Language-Detection",
    "Sleep-Disorder-Predictions-",
    "Libray-Managment-System-RFF-WRT",
    "Hotel-Management-System-",
    "CV"
)

$auditResults = @()

Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "  AUTHENTICATED REPOSITORY QA AUDIT (ReaduanulFaridFahim)" -ForegroundColor White
Write-Host "======================================================================" -ForegroundColor Cyan

foreach ($name in $repos) {
    Write-Host "Auditing: $name ..." -ForegroundColor Yellow
    
    $repoData = gh api "repos/ReaduanulFaridFahim/$name" | ConvertFrom-Json
    
    $readmeData = $null
    try {
        $readmeData = gh api "repos/ReaduanulFaridFahim/$name/readme" 2>$null | ConvertFrom-Json
    } catch {}
    
    $hasReadme = ($readmeData -ne $null -and $readmeData.size -gt 0)
    $readmeSize = if ($hasReadme) { $readmeData.size } else { 0 }
    
    $hasLicense = ($repoData.license -ne $null -and $repoData.license.spdx_id -ne $null)
    $licenseName = if ($hasLicense) { $repoData.license.spdx_id } else { "None" }
    
    $desc = $repoData.description
    $hasDesc = (-not [string]::IsNullOrWhiteSpace($desc))
    
    $topics = $repoData.topics
    if ($topics -eq $null) { $topics = @() }
    
    $gaps = @()
    if (-not $hasDesc) { $gaps += "Missing description" }
    elseif ($desc.Length -lt 25) { $gaps += "Short description" }
    
    if (-not $hasReadme) { $gaps += "Missing README.md" }
    elseif ($readmeSize -lt 300) { $gaps += "Skeletal README.md" }
    
    if ($topics.Count -eq 0) { $gaps += "Missing topics" }
    if (-not $hasLicense) { $gaps += "Missing open-source license" }
    
    $grade = if ($gaps.Count -eq 0) { "A+ (Enterprise)" }
             elseif ($gaps.Count -le 2) { "B (Solid / Minor Gap)" }
             else { "C (Needs Attention)" }
             
    $color = if ($grade -like "A*") { "Green" } elseif ($grade -like "B*") { "Cyan" } else { "Yellow" }
    Write-Host "  Grade: $grade | License: $licenseName | README: $(if ($hasReadme) { $readmeSize.ToString() + ' B' } else { 'NO' }) | Topics: $($topics.Count)" -ForegroundColor $color
    if ($gaps.Count -gt 0) {
        Write-Host "  Gaps: $($gaps -join ' | ')" -ForegroundColor Gray
    }

    $auditResults += [PSCustomObject]@{
        name = $name
        grade = $grade
        license = $licenseName
        has_license = $hasLicense
        readme_size = $readmeSize
        has_readme = $hasReadme
        description = $desc
        topics = $topics
        topics_count = $topics.Count
        gaps = $gaps
        html_url = $repoData.html_url
    }
}

$report = [PSCustomObject]@{
    audited_at = (Get-Date).ToString("o")
    total_repositories = $auditResults.Count
    results = $auditResults
}

$report | ConvertTo-Json -Depth 5 | Set-Content -Path "d:\Aviation\outreach\all_repos_qa_audit.json" -Encoding UTF8
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "QA AUDIT COMPLETE - SAVED TO outreach/all_repos_qa_audit.json" -ForegroundColor Green
Write-Host "======================================================================" -ForegroundColor Cyan
