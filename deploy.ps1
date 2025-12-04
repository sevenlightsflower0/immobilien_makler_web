# deploy.ps1
Write-Host "=== FLUTTER WEB DEPLOYMENT ===" -ForegroundColor Cyan

# 1. Очистка и сборка
Write-Host "1. Building Flutter Web..." -ForegroundColor Yellow
flutter clean
flutter build web --release --base-href "/immobilien_makler_web/"

# 2. Подготовка папки docs
Write-Host "2. Preparing docs folder..." -ForegroundColor Yellow
if (Test-Path "docs") {
    Remove-Item -Recurse -Force "docs"
    Write-Host "   Old docs folder removed" -ForegroundColor Gray
}
Copy-Item -Recurse -Path "build/web" -Destination "docs"

# 3. Создание обязательных файлов
Write-Host "3. Creating required files..." -ForegroundColor Yellow
New-Item -Path "docs/.nojekyll" -ItemType File
Copy-Item -Path "docs/index.html" -Destination "docs/404.html" -Force
Write-Host "   .nojekyll and 404.html created" -ForegroundColor Gray

# 4. Проверка base href
Write-Host "4. Verifying configuration..." -ForegroundColor Yellow
$baseHref = Select-String -Path "docs/index.html" -Pattern 'base href="([^"]*)"'
Write-Host "   Base href: $($baseHref.Matches.Groups[1].Value)" -ForegroundColor Gray

# 5. Деплой на GitHub
Write-Host "5. Deploying to GitHub..." -ForegroundColor Green
git add docs/
git commit -m "Deploy Flutter Web: $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
git push origin main

Write-Host ""
Write-Host "✅ DEPLOYMENT COMPLETE!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "🌐 Your site will be available at:" -ForegroundColor White
Write-Host "   https://sevenlightsflower0.github.io/immobilien_makler_web/" -ForegroundColor Yellow
Write-Host ""
Write-Host "⚙️  Final configuration required:" -ForegroundColor White
Write-Host "   1. Open: https://github.com/sevenlightsflower0/immobilien_makler_web/settings/pages" -ForegroundColor Gray
Write-Host "   2. Set: Source = Deploy from a branch" -ForegroundColor Gray
Write-Host "   3. Set: Branch = main, Folder = /docs" -ForegroundColor Gray
Write-Host "   4. Click Save" -ForegroundColor Gray
Write-Host ""
Write-Host "⏳ Wait 2-3 minutes after saving" -ForegroundColor Magenta
Read-Host "Press Enter to open GitHub Pages settings..."
Start-Process "https://github.com/sevenlightsflower0/immobilien_makler_web/settings/pages"