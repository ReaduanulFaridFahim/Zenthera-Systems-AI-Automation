Write-Host "=== RUNNING COMPREHENSIVE QA AUDIT FOR ZENTHRA SYSTEMS ===" -ForegroundColor Cyan
Write-Host ""

# 1. Test JSON validity across all JSON files
Write-Host "--- 1. VALIDATING ALL JSON FILES ---" -ForegroundColor Yellow
$jsonFiles = Get-ChildItem -Path "d:\Aviation" -Filter "*.json" -Recurse | Where-Object { $_.FullName -notmatch "node_modules" }
$jsonPass = 0
$jsonFail = 0

$nodeExe = "C:\Program Files\nodejs\node.exe"
if (-not (Test-Path $nodeExe)) {
    $nodeCmd = Get-Command node -ErrorAction SilentlyContinue
    if ($nodeCmd) { $nodeExe = $nodeCmd.Source } else { $nodeExe = $null }
}

foreach ($f in $jsonFiles) {
    $valid = $false
    $errMsg = ""
    if ($nodeExe) {
        $filePathEscaped = $f.FullName.Replace('\', '/')
        $res = & $nodeExe -e "try { JSON.parse(require('fs').readFileSync('$filePathEscaped')); process.exit(0); } catch(e) { console.error(e.message); process.exit(1); }" 2>&1
        if ($LASTEXITCODE -eq 0) {
            $valid = $true
        } else {
            $errMsg = $res
        }
    } else {
        try {
            $raw = [System.IO.File]::ReadAllText($f.FullName)
            $parsed = ConvertFrom-Json $raw -ErrorAction Stop
            $valid = $true
        } catch {
            $errMsg = $_.Exception.Message
        }
    }

    if ($valid) {
        Write-Host "  [PASS] $($f.Name) (Valid JSON)" -ForegroundColor Green
        $jsonPass++
    } else {
        Write-Host "  [FAIL] $($f.Name): $errMsg" -ForegroundColor Red
        $jsonFail++
    }
}
Write-Host "JSON Result: $jsonPass Passed, $jsonFail Failed." -ForegroundColor Cyan
Write-Host ""

# 2. Check HTML files for structure, scripts, and links
Write-Host "--- 2. VALIDATING HTML INTERFACES ---" -ForegroundColor Yellow
$htmlFiles = Get-ChildItem -Path "d:\Aviation" -Filter "*.html" -Recurse | Where-Object { $_.FullName -notmatch "node_modules" }

foreach ($h in $htmlFiles) {
    $raw = [System.IO.File]::ReadAllText($h.FullName)
    $hasDoctype = $raw.Contains("<!DOCTYPE html>")
    $hasHtmlOpen = $raw.Contains("<html")
    $hasHtmlClose = $raw.Contains("</html>")
    $hasHeadClose = $raw.Contains("</head>")
    $hasBodyClose = $raw.Contains("</body>")
    
    if ($hasDoctype -and $hasHtmlOpen -and $hasHtmlClose -and $hasHeadClose -and $hasBodyClose) {
        Write-Host "  [PASS] $($h.Name): Complete HTML5 structure ($($raw.Length) bytes)" -ForegroundColor Green
    } else {
        Write-Host "  [WARN] $($h.Name): Incomplete HTML5 tags" -ForegroundColor Yellow
    }
}
Write-Host ""

# 3. Check Cal.com booking link consistency
Write-Host "--- 3. CHECKING CAL.COM INTEGRATION ---" -ForegroundColor Yellow
$verifiedCalUrl = "https://cal.com/zenthra-systems-dyuqpi/30min"
$searchTargets = Get-ChildItem -Path "d:\Aviation" -Include "*.html","*.md","*.json","*.js" -Recurse | Where-Object { $_.FullName -notmatch "node_modules" -and $_.FullName -notmatch "\.git" }
$calFoundCount = 0
$wrongCalCount = 0

foreach ($file in $searchTargets) {
    $content = [System.IO.File]::ReadAllText($file.FullName)
    if ($content.Contains("cal.com")) {
        $calFoundCount++
        if ($content.Contains("cal.com/zenthra-systems-dyuqpi/30min")) {
            Write-Host "  [PASS] $($file.Name): Verified Cal.com URL present" -ForegroundColor Green
        } else {
            # Check if there is an outdated or placeholder slug
            if ($content -match "cal\.com/[a-zA-Z0-9_-]+") {
                Write-Host "  [WARN] $($file.Name): Contains other Cal.com pattern: $($Matches[0])" -ForegroundColor Yellow
                $wrongCalCount++
            }
        }
    }
}
Write-Host "Cal.com Audit: $calFoundCount files reference Cal.com ($wrongCalCount warnings)." -ForegroundColor Cyan
Write-Host ""

# 4. Check Webhook connectivity
Write-Host "--- 4. CHECKING LIVE N8N CLUSTER WEBHOOK ---" -ForegroundColor Yellow
$webhookUrl = "https://zenthrasystems.app.n8n.cloud/webhook/c3bf3837-a96a-4283-9a3f-ab55afe4df54/chat"
try {
    $uniqueSession = "qa-probe-" + (Get-Date -Format "yyyyMMddHHmmss")
    $body = @{
        action = "chat"
        chatInput = "Hi, we are looking for an enterprise n8n workflow consultancy to automate our sales operations and lead routing into HubSpot and Slack. Can Zenthra Systems help?"
        sessionId = $uniqueSession
        clientContext = @{
            name = "Enterprise Lead QA"
            company = "Global Enterprise Corp"
            title = "VP of Technology"
            region = "USA / EMEA"
        }
    } | ConvertTo-Json -Depth 5

    $resp = Invoke-RestMethod -Uri $webhookUrl -Method POST -Body $body -ContentType "application/json" -TimeoutSec 35
    Write-Host "  [PASS] n8n Webhook responding: $($resp | ConvertTo-Json -Compress)" -ForegroundColor Green
} catch {
    Write-Host "  [INFO] Webhook ping status: $($_.Exception.Message)" -ForegroundColor Yellow
}
Write-Host ""
Write-Host "=== QA AUDIT COMPLETE ===" -ForegroundColor Cyan
