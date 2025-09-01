@echo off
chcp 65001 >nul

:: Check administrator privileges
net session >nul 2>&1
if errorlevel 1 (
    echo ========================================
    echo      Administrator privileges required
    echo ========================================
    echo.
    echo Please right-click this file and select "Run as administrator"
    echo.
    pause
    exit /b 1
)

echo ========================================
echo    Personalized LLM Assistant - Network Configuration
echo ========================================
echo.

:: Get local IP address
echo 📡 Detecting network information...
for /f "tokens=2 delims=:" %%i in ('ipconfig ^| findstr /c:"IPv4"') do (
    for /f "tokens=1" %%j in ("%%i") do set LOCAL_IP=%%j
)

echo Local IP address: %LOCAL_IP%
echo.

:: Configure firewall rules
echo 🔧 Configuring Windows Firewall...

:: Add inbound rule for port 8080 (Open WebUI)
netsh advfirewall firewall delete rule name="PersonalizationLLM-WebUI" protocol=TCP localport=8080 >nul 2>&1
netsh advfirewall firewall add rule name="PersonalizationLLM-WebUI" dir=in action=allow protocol=TCP localport=8080 profile=any

:: Add inbound rule for port 11434 (Ollama API)
netsh advfirewall firewall delete rule name="PersonalizationLLM-API" protocol=TCP localport=11434 >nul 2>&1
netsh advfirewall firewall add rule name="PersonalizationLLM-API" dir=in action=allow protocol=TCP localport=11434 profile=any

echo ✅ Firewall rules configured successfully!
echo.

:: Display network information
echo ========================================
echo            Network Access Information
echo ========================================
echo.
echo 🌐 Service Access URLs:
echo    Local access: http://localhost:8080
echo    LAN access: http://%LOCAL_IP%:8080
echo.
echo 🔗 API URLs (for development):
echo    Local API: http://localhost:11434  
echo    LAN API: http://%LOCAL_IP%:11434
echo.
echo 📋 Steps for other devices to access:
echo    1. Ensure devices are on the same LAN
echo    2. Access in browser: http://%LOCAL_IP%:8080
echo    3. If still cannot access, check router firewall settings
echo.
echo ⚙️  Advanced settings:
echo    - Router port forwarding: 8080 → %LOCAL_IP%:8080
echo    - Internet access requires router configuration and public IP
echo.

pause