# ==============================================================================
# Zenthra Systems: Multi-Repository Inspector for ReaduanulFaridFahim
# ==============================================================================

try {
    $user = "ReaduanulFaridFahim"
    $url = "https://api.github.com/users/$user/repos?per_page=100&sort=updated"
    $repos = Invoke-RestMethod -Uri $url -Headers @{ "User-Agent" = "PowerShell-MultiRepo-Inspector" }

    Write-Host "======================================================================" -ForegroundColor Cyan
    Write-Host "  DISCOVERED GITHUB REPOSITORIES FOR: $user" -ForegroundColor White
    Write-Host "======================================================================" -ForegroundColor Cyan
    Write-Host "Total Repositories Found: $($repos.Count)" -ForegroundColor Yellow
    Write-Host ""

    $repoList = @()

    foreach ($r in $repos) {
        Write-Host "----------------------------------------------------------------------" -ForegroundColor DarkGray
        Write-Host "Repository: $($r.name)" -ForegroundColor Cyan
        Write-Host "  Full Name: $($r.full_name)" -ForegroundColor White
        Write-Host "  HTML URL: $($r.html_url)" -ForegroundColor Yellow
        Write-Host "  Description: $($r.description)" -ForegroundColor Gray
        Write-Host "  Default Branch: $($r.default_branch)" -ForegroundColor White
        Write-Host "  Visibility: $($r.visibility) | Fork: $($r.fork)" -ForegroundColor White
        Write-Host "  Primary Language: $($r.language)" -ForegroundColor Green
        Write-Host "  Has Pages: $($r.has_pages)" -ForegroundColor Yellow
        Write-Host "  Pushed At: $($r.pushed_at)" -ForegroundColor Gray
        
        $repoList += @{
            name = $r.name
            full_name = $r.full_name
            html_url = $r.html_url
            description = $r.description
            default_branch = $r.default_branch
            visibility = $r.visibility
            is_fork = $r.fork
            language = $r.language
            has_pages = $r.has_pages
            pushed_at = $r.pushed_at
        }
    }

    $outputJson = $repoList | ConvertTo-Json -Depth 5
    [System.IO.File]::WriteAllText("d:\Aviation\outreach\all_github_repositories.json", $outputJson)
    Write-Host ""
    Write-Host "Saved inventory to d:\Aviation\outreach\all_github_repositories.json" -ForegroundColor Green
} catch {
    Write-Host "[ERROR] Could not fetch repositories: $($_.Exception.Message)" -ForegroundColor Red
}
