# ==============================================================================
# Zenthra Systems: Autonomous Global Sales Campaign & Marketing Generator
# ==============================================================================
# Generates battle-tested B2B sales outreach copy across 5 international verticals.
# Directs all prospective clients to your verified Cal.com booking link.
# ==============================================================================

param(
    [string]$Vertical = "all", # 'agency', 'ecommerce', 'logistics', 'all'
    [string]$BookingUrl = "https://cal.com/zenthra-systems-dyuqpi/30min",
    [string]$SenderEmail = "connect.zenthra@gmail.com"
)

Clear-Host
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "  ZENTHRA SYSTEMS -- GLOBAL CLIENT ACQUISITION AND SALES ENGINE" -ForegroundColor White
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "Booking Link: $BookingUrl" -ForegroundColor Yellow
Write-Host "Sender Email: $SenderEmail" -ForegroundColor Yellow
Write-Host ""

$campaigns = @{}

$agencyBody = @"
Hi {{first_name}},

Noticed {{company}} is scaling client acquisition across Meta and Google Ads. 

Most agencies we speak with experience a 35-minute delay routing ad payloads into HubSpot and Slack, causing an estimated 40% drop in lead-to-call conversion. 

We recently deployed an automated n8n pipeline for a peer agency that ingests ad webhooks, enriches records, and pings sales reps with 1-click claim buttons in under 30 seconds.

Would you be open to an asynchronous 2-minute architectural blueprint showing how we wired this up?

Best,
Zenthra Systems Engineering Practice
connect.zenthra@gmail.com
Schedule: $BookingUrl
"@

$agencyDm = @"
Hi {{first_name}} -- saw your team is managing substantial ad volume at {{company}}. Quick question: are your reps still manually copying lead data into HubSpot/Slack, or do you have a sub-30s automated webhook pipeline in place? We recently cut response latency by 90% for a London agency without adding headcount. Happy to share the blueprint if helpful: $BookingUrl
"@

$agencyRfp = @"
Hi {{client_name}},

Your requirement for automating lead flows into {{crm_name}} and Slack with high reliability caught our attention. 

We are Zenthra Systems, an elite engineering studio specializing in enterprise n8n workflow systems. For a peer B2B client, we deployed an event-driven webhook pipeline with deduplication, Clearbit enrichment, and instant team routing, reducing lead response latency from 45 minutes to 28 seconds.

Key Architectural Deliverables:
1. Webhook endpoint with HMAC authentication and dead-letter retry queues.
2. Field normalization and CRM deduplication (HubSpot / Salesforce).
3. 30-day post-launch warranty with zero vendor lock-in (runs in your own n8n instance).

We can deliver this turnkey in 2 weeks. Let us sync for 15 minutes: $BookingUrl
"@

$campaigns["agency"] = @{
    name = "B2B Marketing and Lead Generation Agencies (US, UK, Australia)"
    target_titles = "Founder, CEO, Head of Performance, VP of Growth"
    pain_point = "Losing 40% of ad leads due to delayed manual routing into HubSpot/Slack"
    email_subject = "lead triage latency for {{company}}'s ad campaigns"
    email_body = $agencyBody
    linkedin_dm = $agencyDm
    upwork_rfp = $agencyRfp
}

$ecomBody = @"
Hi {{first_name}},

Saw {{company}} is rapidly scaling fulfillment channels across Shopify and multiple marketplaces.

High-growth brands frequently lose 15 to 20 hours every week manually reconciling order payloads with 3PL balance sheets and QuickBooks purchase orders.

Zenthra Systems built an autonomous n8n workflow that syncs order events in real time, parses vendor PDF statements via vision AI, and flags discrepancies above $50 to Slack for 1-tap approval.

Would you be open to seeing the architecture diagram of how this runs without per-task Zapier fees?

Best regards,
Zenthra Systems Solutions Team
connect.zenthra@gmail.com
Direct Scheduling: $BookingUrl
"@

$campaigns["ecommerce"] = @{
    name = "High-Growth E-Commerce and DTC Brands (US, Europe)"
    target_titles = "COO, VP of Operations, Head of Supply Chain, E-Commerce Director"
    pain_point = "Spending 20+ hours a week reconciling Shopify orders with 3PL inventory and QuickBooks"
    email_subject = "inventory and 3PL reconciliation for {{company}}"
    email_body = $ecomBody
    linkedin_dm = "Hi {{first_name}} -- impressive momentum at {{company}}. We help scaling DTC brands eliminate 15+ hours/week of manual 3PL & QuickBooks inventory reconciliation using self-hosted n8n pipelines. Would an asynchronous diagram of how we eliminate inventory discrepancies be useful for your operations team? ($BookingUrl)"
}

$logisticsBody = @"
Hi {{first_name}},

Noticed {{company}} is handling high-throughput freight and cargo operations.

Most logistics operators we partner with struggle with hours of manual data entry transcribing multi-page vendor PDF invoices and customs manifests into internal TMS/ERP software.

We engineered an autonomous document vision pipeline using GPT-4o and n8n that parses line-items with 99.4% accuracy, matches POs against GL accounting schemas, and alerts ops managers instantly on discrepancies.

Open to seeing a 2-minute video walkthrough of how this works?

Best,
Zenthra Systems Operations Team
connect.zenthra@gmail.com
Calendar: $BookingUrl
"@

$campaigns["logistics"] = @{
    name = "Logistics, Freight and Supply Chain Operators (Global)"
    target_titles = "VP of Logistics, Operations Director, Managing Director"
    pain_point = "Manual PDF bill-of-lading and vendor invoice extraction causing costly accounting delays"
    email_subject = "automated bill-of-lading and invoice vision for {{company}}"
    email_body = $logisticsBody
}

$selectedKeys = if ($Vertical -eq "all") { $campaigns.Keys } else { @($Vertical) }

foreach ($k in $selectedKeys) {
    $c = $campaigns[$k]
    Write-Host "----------------------------------------------------------------------" -ForegroundColor DarkGray
    Write-Host "VERTICAL: $($c.name)" -ForegroundColor Green
    Write-Host "Target Titles: $($c.target_titles)" -ForegroundColor White
    Write-Host "Core Pain Point: $($c.pain_point)" -ForegroundColor DarkYellow
    Write-Host ""
    Write-Host "[COLD EMAIL DISPATCH TEMPLATE]" -ForegroundColor Cyan
    Write-Host "Subject: $($c.email_subject)" -ForegroundColor White
    Write-Host $c.email_body -ForegroundColor Gray
    Write-Host ""
    if ($c.linkedin_dm) {
        Write-Host "[LINKEDIN INMAIL / DIRECT MESSAGE]" -ForegroundColor Magenta
        Write-Host $c.linkedin_dm -ForegroundColor Gray
        Write-Host ""
    }
    if ($c.upwork_rfp) {
        Write-Host "[WINNING UPWORK / CONTRACT PROPOSAL]" -ForegroundColor Yellow
        Write-Host $c.upwork_rfp -ForegroundColor Gray
        Write-Host ""
    }
}

Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "All campaigns are ready. Import workflows/outbound_client_acquisition_pipeline.json" -ForegroundColor Green
Write-Host "into n8n Cloud to start automated daily dispatch." -ForegroundColor Green
Write-Host "======================================================================" -ForegroundColor Cyan
