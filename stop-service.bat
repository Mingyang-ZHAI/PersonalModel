@echo off
chcp 65001 >nul
echo ========================================
echo    Personalized LLM Assistant - Stop Service
echo ========================================
echo.

echo 🛑 Stopping Personalized LLM Assistant service...
echo.

:: Stop services
docker-compose down

if errorlevel 1 (
    echo ❌ Service stop failed!
    pause
    exit /b 1
)

echo.
echo ✅ Service stopped successfully!
echo.
echo 💡 To restart the service, run: restart-service.bat
echo.

pause