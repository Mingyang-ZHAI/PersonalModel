@echo off
chcp 65001 >nul
echo ========================================
echo    Personalized LLM Assistant - Start Service
echo ========================================
echo.

:: Check if Docker is installed
docker --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Docker is not installed! Please install Docker Desktop first
    echo Download: https://www.docker.com/products/docker-desktop/
    pause
    exit /b 1
)

:: Check if Docker is running
docker info >nul 2>&1
if errorlevel 1 (
    echo ⚠️  Docker is not running, starting Docker Desktop...
    start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe"
    echo Waiting for Docker to start...
    timeout /t 30 /nobreak >nul
)

:: Get local IP address
for /f "tokens=2 delims=:" %%i in ('ipconfig ^| findstr /c:"IPv4"') do (
    for /f "tokens=1" %%j in ("%%i") do set LOCAL_IP=%%j
)

echo 🚀 Starting Personalized LLM Assistant service...
echo.

:: Start services
docker-compose up -d

if errorlevel 1 (
    echo ❌ Service startup failed!
    pause
    exit /b 1
)

echo.
echo ✅ Service started successfully!
echo.
echo 📍 Access URLs:
echo    Local access: http://localhost:8080
echo    LAN access: http://%LOCAL_IP%:8080
echo.
echo 🔧 Management commands:
echo    Stop service: stop-service.bat
echo    View logs: show-logs.bat  
echo    Restart service: restart-service.bat
echo.
echo ⏳ First startup requires model download, please wait about 5-10 minutes...
echo 
echo 💡 Tip: Set System Prompt in Open WebUI to your preference content
echo.

:: Auto-open browser (delay 30 seconds for service to fully start)
echo Opening browser in 30 seconds...
timeout /t 30 /nobreak >nul
start http://localhost:8080

pause