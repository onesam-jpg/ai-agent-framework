# AI Agent Framework - Add GitHub Secrets
Write-Host "AI Agent Framework - Secrets Setup" -ForegroundColor Cyan
Write-Host ""

# Get repository
$repo = gh repo view --json nameWithOwner -q .nameWithOwner 2>$null
if ($LASTEXITCODE -ne 0) {
    $repo = Read-Host "Enter repository (username/repo-name)"
}
Write-Host "Repository: $repo" -ForegroundColor Green
Write-Host ""

# Get credentials
Write-Host "Enter Supabase credentials:" -ForegroundColor Yellow
Write-Host ""
Write-Host "1. Project URL (from Settings -> API):"
$url = Read-Host "Paste here"

Write-Host ""
Write-Host "2. Anon Key (from Settings -> API):"
$anon = Read-Host "Paste here"

Write-Host ""
Write-Host "3. Service Role Key (from Settings -> API):"
$service = Read-Host "Paste here"

Write-Host ""
Write-Host "4. Project ID (from Settings -> General):"
$projectId = Read-Host "Paste here"

Write-Host ""
Write-Host "5. Access Token (from account/tokens):"
$token = Read-Host "Paste here"

Write-Host ""
Write-Host "Adding secrets..." -ForegroundColor Yellow

# Add secrets
$url | gh secret set NEXT_PUBLIC_SUPABASE_URL --repo $repo
Write-Host "1/5 Added NEXT_PUBLIC_SUPABASE_URL" -ForegroundColor Green

$anon | gh secret set NEXT_PUBLIC_SUPABASE_ANON_KEY --repo $repo
Write-Host "2/5 Added NEXT_PUBLIC_SUPABASE_ANON_KEY" -ForegroundColor Green

$service | gh secret set SUPABASE_SERVICE_ROLE_KEY --repo $repo
Write-Host "3/5 Added SUPABASE_SERVICE_ROLE_KEY" -ForegroundColor Green

$projectId | gh secret set SUPABASE_PROJECT_REF --repo $repo
Write-Host "4/5 Added SUPABASE_PROJECT_REF" -ForegroundColor Green

$token | gh secret set SUPABASE_ACCESS_TOKEN --repo $repo
Write-Host "5/5 Added SUPABASE_ACCESS_TOKEN" -ForegroundColor Green

Write-Host ""
Write-Host "Success! All 5 secrets added." -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Enable GitHub Actions in repository settings"
Write-Host "2. Enable GitHub Copilot"
Write-Host "3. Create a test issue!"
Write-Host ""
pause
