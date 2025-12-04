@echo off
echo Building Flutter Web...
flutter clean
flutter build web --release --base-href "/immobilien_makler_web/"

echo Preparing docs folder...
if exist docs rmdir /s /q docs
xcopy /E /I /Y build\web docs\

echo Creating required files...
cd docs
echo. > .nojekyll
copy index.html 404.html >nul
cd ..

echo Deploying to GitHub...
git add docs/
git commit -m "Deploy Flutter Web"
git push origin main

echo.
echo Done! Configure GitHub Pages:
echo 1. Go to repo Settings -> Pages
echo 2. Set: Branch=main, Folder=/docs
echo 3. Save
echo.
echo Your site: https://sevenlightsflower0.github.io/immobilien_makler_web/
pause