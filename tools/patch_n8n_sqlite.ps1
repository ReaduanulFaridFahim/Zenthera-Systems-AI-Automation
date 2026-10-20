# Patch n8n global installation with working sqlite3 v6.0.1 for Node 24
$source = "d:\Aviation\node_modules\sqlite3"
$target1 = Join-Path $env:APPDATA "npm\node_modules\n8n\node_modules\sqlite3"
$target2 = Join-Path $env:APPDATA "npm\node_modules\n8n\node_modules\@n8n\db\node_modules\sqlite3"

Write-Host "Patching n8n sqlite3 bindings for Node 24..." -ForegroundColor Yellow

if (Test-Path $source) {
    # Backup original or overwrite directly
    Copy-Item -Recurse -Path $source -Destination (Split-Path $target1 -Parent) -Force
    Write-Host "Updated: $target1" -ForegroundColor Green

    # Also update @n8n/db nested module
    $parent2 = Split-Path $target2 -Parent
    if (-not (Test-Path $parent2)) {
        New-Item -ItemType Directory -Force -Path $parent2 | Out-Null
    }
    Copy-Item -Recurse -Path $source -Destination $parent2 -Force
    Write-Host "Updated: $target2" -ForegroundColor Green
} else {
    Write-Host "Source sqlite3 not found in d:\Aviation\node_modules\sqlite3" -ForegroundColor Red
}
