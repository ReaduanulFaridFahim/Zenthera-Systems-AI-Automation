# ==============================================================================
# Execute GitHub Metadata Updates Across All 14 Repositories
# ==============================================================================

$user = "ReaduanulFaridFahim"

$repoConfigs = @(
    @{
        name = "Zenthera-Systems-AI-Automation"
        desc = "Autonomous Enterprise AI Operations, n8n Workflow Systems, Supabase Vector RAG Hub & Client Acquisition Engine"
        topics = "ai-agents,n8n-automation,supabase-pgvector,langchain,workflow-automation"
        homepage = "https://readuanulfaridfahim.github.io/Zenthera-Systems-AI-Automation/"
    },
    @{
        name = "tactical-void-replacement-engine"
        desc = "Empirical Sporting Continuity, Vector Similarity & Arbitrage Scouting Platform for Football Players and Head Coaches."
        topics = "sports-analytics,vector-similarity,arbitrage-scouting,football-analytics,javascript"
        homepage = "https://readuanulfaridfahim.github.io/tactical-void-replacement-engine/"
    },
    @{
        name = "football-transfers-ffp"
        desc = "Financial Fair Play (FFP) Compliance, Squad Amortization & Transfer Market Intelligence Platform."
        topics = "football-finance,ffp-compliance,transfer-analytics,python,data-analytics"
        homepage = "https://readuanulfaridfahim.github.io/football-transfers-ffp/"
    },
    @{
        name = "ReaduanulFaridFahim"
        desc = "Master Profile README & Enterprise Engineering Portfolio Showcase."
        topics = "github-profile,portfolio,ai-engineer,solutions-architect"
        homepage = "https://readuanulfaridfahim.github.io/"
    },
    @{
        name = "readuanulfaridfahim.github.io"
        desc = "Personal Engineering Portfolio & Technical Systems Showcase."
        topics = "portfolio-website,software-engineer,fullstack,personal-website"
        homepage = "https://readuanulfaridfahim.github.io/"
    },
    @{
        name = "Pre-Owned-Bike-Price-Prediction"
        desc = "Machine Learning Valuation Model for Secondary Two-Wheeler Market Pricing with Regression Pipelines."
        topics = "machine-learning,price-prediction,scikit-learn,regression,data-science"
        homepage = ""
    },
    @{
        name = "ABC-Company-Sqa-Assignment"
        desc = "Automated SQA Testing Framework for Enterprise Mobile Apps using Appium, Python & Page Object Model."
        topics = "sqa-automation,appium,pytest,mobile-testing,quality-assurance"
        homepage = ""
    },
    @{
        name = "Augmented-Reality-Based-Clothing-Trial-App"
        desc = "Augmented Reality Virtual Fitting Room & Clothing Trial Application with Real-Time Pose Estimation."
        topics = "augmented-reality,virtual-fitting,pose-estimation,computer-vision"
        homepage = ""
    },
    @{
        name = "-Bangla-Handwritten-Text-Conversion-Using-Optical-Character-Recognition-"
        desc = "Deep Learning OCR Pipeline for Bangla Handwritten Script Segmentation, Classification & Digital Transcription."
        topics = "ocr,bangla-ocr,deep-learning,optical-character-recognition,nlp"
        homepage = ""
    },
    @{
        name = "Sign-Language-Detection"
        desc = "Real-Time Computer Vision System for Sign Language Gesture Recognition using OpenCV & Deep Learning."
        topics = "sign-language-detection,computer-vision,opencv,deep-learning,gesture-recognition"
        homepage = ""
    },
    @{
        name = "Sleep-Disorder-Predictions-"
        desc = "Clinical Sleep Disorder Classification System Utilizing Predictive Machine Learning Pipelines."
        topics = "machine-learning,health-informatics,sleep-disorder,classification,healthcare-ai"
        homepage = ""
    },
    @{
        name = "Libray-Managment-System-RFF-WRT"
        desc = "Enterprise Library Management System with Role-Based Access Control, Catalog Tracking & SQL Database."
        topics = "java,library-management,sql,desktop-application,crud-operations"
        homepage = ""
    },
    @{
        name = "Hotel-Management-System-"
        desc = "Full-Stack Hospitality Reservation, Room Inventory & Billing Management Web Application."
        topics = "php,mysql,hotel-management,web-application,reservation-system"
        homepage = ""
    },
    @{
        name = "CV"
        desc = "Interactive Digital Curriculum Vitae & Professional Career Portfolio."
        topics = "cv,resume,career-portfolio,html5,css3"
        homepage = ""
    }
)

Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "  UPDATING DESCRIPTIONS, TOPICS & HOMEPAGES ACROSS ALL 14 REPOSITORIES" -ForegroundColor White
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host ""

$successCount = 0

foreach ($cfg in $repoConfigs) {
    $repoTarget = "$user/$($cfg.name)"
    Write-Host "Updating: $repoTarget ..." -ForegroundColor Yellow
    
    $argsList = @("repo", "edit", $repoTarget, "--description", $cfg.desc)
    
    if (-not [string]::IsNullOrWhiteSpace($cfg.topics)) {
        $argsList += "--add-topic"
        $argsList += $cfg.topics
    }
    
    if (-not [string]::IsNullOrWhiteSpace($cfg.homepage)) {
        $argsList += "--homepage"
        $argsList += $cfg.homepage
    }

    try {
        & gh @argsList 2>&1 | Out-Null
        if ($LASTEXITCODE -eq 0) {
            Write-Host "  [SUCCESS] $repoTarget updated." -ForegroundColor Green
            $successCount++
        } else {
            Write-Host "  [WARN] gh repo edit returned code $LASTEXITCODE for $repoTarget" -ForegroundColor Yellow
        }
    } catch {
        Write-Host "  [ERROR] Failed to update $repoTarget : $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "======================================================================" -ForegroundColor Cyan
Write-Host "COMPLETED METADATA UPDATES: $successCount / $($repoConfigs.Count) Repositories" -ForegroundColor Green
Write-Host "======================================================================" -ForegroundColor Cyan
