# ==============================================================================
# Zenthra Systems: GitHub Live Repository Status Inspector
# ==============================================================================

try {
    $repoUrl = "https://api.github.com/repos/ReaduanulFaridFahim/Zenthera-Systems-AI-Automation"
    $repo = Invoke-RestMethod -Uri $repoUrl -Headers @{ "User-Agent" = "PowerShell-Zenthra-Inspector" }
    
    Write-Host "======================================================================" -ForegroundColor Cyan
    Write-Host "  GITHUB REPOSITORY LIVE AUDIT" -ForegroundColor White
    Write-Host "======================================================================" -ForegroundColor Cyan
    Write-Host "Repository:" $repo.full_name -ForegroundColor Green
    Write-Host "HTML URL:" $repo.html_url -ForegroundColor Yellow
    Write-Host "Default Branch:" $repo.default_branch -ForegroundColor White
    Write-Host "Visibility:" $repo.visibility -ForegroundColor White
    Write-Host "Last Pushed At:" $repo.pushed_at -ForegroundColor White
    Write-Host "Last Updated At:" $repo.updated_at -ForegroundColor White
    Write-Host "Stars:" $repo.stargazers_count " | Forks:" $repo.forks_count -ForegroundColor Gray
    Write-Host ""

    $commitsUrl = "https://api.github.com/repos/ReaduanulFaridFahim/Zenthera-Systems-AI-Automation/commits?per_page=5"
    $commits = Invoke-RestMethod -Uri $commitsUrl -Headers @{ "User-Agent" = "PowerShell-Zenthra-Inspector" }

    Write-Host "LATEST COMMITS ON ORIGIN/MAIN:" -ForegroundColor Cyan
    foreach ($c in $commits) {
        $shortSha = $c.sha.Substring(0, 7)
        $msg = $c.commit.message.Split("`n")[0]
        $date = $c.commit.author.date
        $author = $c.commit.author.name
        Write-Host "  [$shortSha] $msg" -ForegroundColor Green
        Write-Host "    Author: $author | Date: $date" -ForegroundColor Gray
    }
    Write-Host "======================================================================" -ForegroundColor Cyan
} catch {
    Write-Host "[ERROR] Could not fetch from GitHub API: $($_.Exception.Message)" -ForegroundColor Red
}
