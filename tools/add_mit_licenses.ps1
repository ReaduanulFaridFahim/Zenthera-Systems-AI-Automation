# Add MIT License to repositories lacking open source licensing
$licenseText = @"
MIT License

Copyright (c) 2026 Readuanul Farid Fahim

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
"@

$bytes = [System.Text.Encoding]::UTF8.GetBytes($licenseText)
$b64 = [Convert]::ToBase64String($bytes)

$reposNeedingLicense = @(
    "ReaduanulFaridFahim",
    "tactical-void-replacement-engine",
    "football-transfers-ffp",
    "readuanulfaridfahim.github.io",
    "ABC-Company-Sqa-Assignment",
    "Sign-Language-Detection",
    "Sleep-Disorder-Predictions-"
)

foreach ($repo in $reposNeedingLicense) {
    Write-Host "Adding MIT License to $repo ..." -ForegroundColor Yellow
    
    # Check if license already exists
    $existing = $null
    try {
        $existing = gh api "repos/ReaduanulFaridFahim/$repo/contents/LICENSE" 2>$null | ConvertFrom-Json
    } catch {}

    if ($existing -and $existing.sha) {
        Write-Host "  LICENSE already exists in $repo." -ForegroundColor Green
        continue
    }

    $body = @{
        message = "docs(license): add MIT license"
        content = $b64
    } | ConvertTo-Json

    # Write payload to temp file to avoid escaping issues
    $tempFile = [System.IO.Path]::GetTempFileName()
    [System.IO.File]::WriteAllText($tempFile, $body)

    try {
        $res = gh api --method PUT "repos/ReaduanulFaridFahim/$repo/contents/LICENSE" --input $tempFile
        Write-Host "  Successfully added MIT License to $repo!" -ForegroundColor Green
    } catch {
        Write-Host "  Error adding license to $($repo): $_" -ForegroundColor Red
    } finally {
        if (Test-Path $tempFile) { Remove-Item $tempFile -Force }
    }
}
