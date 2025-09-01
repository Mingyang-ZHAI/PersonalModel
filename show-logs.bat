@echo off
chcp 65001 >nul
echo ========================================
echo    Personalized LLM Assistant - View Logs
echo ========================================
echo.

echo 📋 Showing service logs...
echo.

docker-compose logs -f