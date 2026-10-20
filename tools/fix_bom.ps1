$path = "d:\Aviation\outreach\all_repos_qa_audit.json"
if (Test-Path $path) {
    $content = [System.IO.File]::ReadAllText($path)
    $clean = $content.TrimStart([char]0xFEFF)
    [System.IO.File]::WriteAllText($path, $clean, [System.Text.UTF8Encoding]::new($false))
    Write-Host "Cleaned BOM from $path"
}
