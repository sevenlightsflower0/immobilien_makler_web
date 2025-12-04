@echo off
echo Running Flutter Web Deployer...
echo.
powershell -ExecutionPolicy Bypass -File "%~dp0deploy.ps1"
pause