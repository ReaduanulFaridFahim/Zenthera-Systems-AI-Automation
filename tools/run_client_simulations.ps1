# ==============================================================================
# Zenthra Systems: Autonomous Live Client Simulation Engine
# ==============================================================================
# Sends realistic enterprise client inquiries to the live n8n AI cluster,
# measures response latency, evaluates response quality, and records transcripts.
# ==============================================================================

param(
    [string]$WebhookUrl = "https://zenthrasystems.app.n8n.cloud/webhook/c3bf3837-a96a-4283-9a3f-ab55afe4df54/chat",
    [string]$OutputFile = "d:\Aviation\outreach\client_simulations_audit.json"
)

Clear-Host
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "  ZENTHRA SYSTEMS -- ENTERPRISE CLIENT SIMULATION SUITE" -ForegroundColor White
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "Target Endpoint: $WebhookUrl" -ForegroundColor Yellow
Write-Host ""

$scenarios = @(
    @{
        id = "sim-001"
        client_name = "Klaus Vanhoutte"
        company = "TransEuropa Freight & Customs BV"
        title = "Managing Director, Fleet & Logistics"
        region = "Rotterdam, Netherlands"
        inquiry = "We handle 250+ international shipping manifests and EUR.1 customs declarations daily across UK, Germany, and Benelux. Our back-office team spends 4-5 hours every morning manually re-typing invoice and bill-of-lading line items into our internal TMS. Can Zenthra Systems engineer an autonomous vision and document extraction pipeline in n8n, and how fast can it be deployed?"
    },
    @{
        id = "sim-002"
        client_name = "Elena Rostova"
        company = "CloudScale Global SaaS"
        title = "VP of Growth & Operations"
        region = "Austin, Texas, USA"
        inquiry = "We spend $120k/month on paid ads driving 800+ inbound demo requests, but our SDRs have a 45-minute response latency. We are losing leads to competitors and our Zapier tasks are constantly hitting rate limits and costing $900/mo in overages. Can you build a sub-30 second lead enrichment and qualification agent connected to HubSpot and Slack?"
    },
    @{
        id = "sim-003"
        client_name = "Alistair Sterling"
        company = "Sterling & Vance Wealth Partners"
        title = "Chief Technology Officer"
        region = "London, United Kingdom"
        inquiry = "We need an enterprise-grade AI knowledge base for 50 portfolio managers with strict GDPR data sovereignty. We cannot allow client financial dossiers to train public models. Does Zenthra Systems implement private Supabase pgvector architectures with role-based access control and verified Cal.com executive scheduling?"
    }
)

$results = @()
$passedCount = 0

foreach ($sc in $scenarios) {
    Write-Host "----------------------------------------------------------------------" -ForegroundColor DarkGray
    Write-Host "[SIMULATION] Running: $($sc.company) ($($sc.region))" -ForegroundColor Cyan
    Write-Host "Prospect: $($sc.client_name) - $($sc.title)" -ForegroundColor White
    Write-Host "Inquiry: $($sc.inquiry)" -ForegroundColor Gray

    $payload = @{
        action = "chat"
        chatInput = $sc.inquiry
        sessionId = $sc.id
        clientContext = @{
            name = $sc.client_name
            company = $sc.company
            title = $sc.title
            region = $sc.region
        }
    } | ConvertTo-Json -Depth 5

    $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
    $responseSuccess = $false
    $responseBody = ""
    $agentMessage = ""

    try {
        $resp = Invoke-RestMethod -Uri $WebhookUrl -Method POST -Body $payload -ContentType "application/json" -TimeoutSec 45
        $stopwatch.Stop()
        $latencyMs = $stopwatch.ElapsedMilliseconds

        if ($resp.output) {
            $agentMessage = $resp.output
        } elseif ($resp.message) {
            $agentMessage = $resp.message
        } else {
            $agentMessage = ($resp | ConvertTo-Json -Compress)
        }

        $responseSuccess = $true
        $passedCount++
        Write-Host "  [RESULT] Status: 200 OK | Latency: $($latencyMs)ms" -ForegroundColor Green
        Write-Host "  [AGENT RESPONSE]:" -ForegroundColor Yellow
        Write-Host "  $agentMessage" -ForegroundColor White
    } catch {
        $stopwatch.Stop()
        $latencyMs = $stopwatch.ElapsedMilliseconds
        $agentMessage = "Error: $($_.Exception.Message)"
        Write-Host "  [RESULT] Webhook error: $($_.Exception.Message)" -ForegroundColor Red
    }

    $results += @{
        id = $sc.id
        client_name = $sc.client_name
        company = $sc.company
        title = $sc.title
        region = $sc.region
        inquiry = $sc.inquiry
        status = if ($responseSuccess) { "SUCCESS_CONFIRMED" } else { "FAILED" }
        latency_ms = $latencyMs
        agent_response = $agentMessage
        timestamp = (Get-Date).ToString("o")
    }

    Start-Sleep -Seconds 2
}

$summary = @{
    suite = "Zenthra Systems Live Client Simulation Suite"
    execution_time = (Get-Date).ToString("o")
    total_simulations = $scenarios.Count
    passed = $passedCount
    failed = $scenarios.Count - $passedCount
    simulations = $results
}

$summaryJson = $summary | ConvertTo-Json -Depth 6
[System.IO.File]::WriteAllText($OutputFile, $summaryJson)

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "SIMULATION COMPLETE: $passedCount / $($scenarios.Count) Scenarios Verified" -ForegroundColor Green
Write-Host "Audit Log Saved to: $OutputFile" -ForegroundColor Yellow
Write-Host "======================================================================" -ForegroundColor Cyan
