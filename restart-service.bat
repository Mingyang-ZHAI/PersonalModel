@echo off
chcp 65001 >nul
echo ========================================
echo    Personalized LLM Assistant - Restart Service
echo ========================================
echo.

echo 🔄 Restarting Personalized LLM Assistant service...
echo.

:: Stop services
echo Stopping services...
docker-compose down

:: Start services
echo Starting services...
docker-compose up -d

if errorlevel 1 (
    echo ❌ Service restart failed!
    pause
    exit /b 1
)

echo.
echo ✅ Service restarted successfully!
echo.
echo 📍 Access URL: http://localhost:8080
echo.

pause