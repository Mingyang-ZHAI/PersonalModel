@echo off
chcp 65001 >nul
echo ========================================
echo    Personalized LLM Assistant - Complete Cleanup
echo ========================================
echo.

echo ⚠️  WARNING: This will completely remove all data!
echo.
echo This operation will:
echo - Stop all services
echo - Remove all containers
echo - Delete all volumes (conversations, settings, models)
echo - Remove all images
echo.
echo Are you sure you want to continue? (y/N)
set /p confirm=

if /i not "%confirm%"=="y" (
    echo Operation cancelled.
    pause
    exit /b 0
)

echo.
echo 🗑️  Starting complete cleanup...
echo.

:: Stop and remove containers
echo Stopping and removing containers...
docker-compose down -v

:: Remove images
echo Removing images...
docker rmi ghcr.io/open-webui/open-webui:main ollama/ollama:latest 2>nul

:: Remove volumes
echo Removing volumes...
docker volume rm personalizationmodel_ollama-data personalizationmodel_webui-data 2>nul

:: Remove network
echo Removing network...
docker network rm personalization-network 2>nul

echo.
echo ✅ Cleanup completed successfully!
echo.
echo 💡 To start fresh, run: start-service.bat
echo.

pause