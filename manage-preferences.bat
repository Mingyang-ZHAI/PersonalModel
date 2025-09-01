@echo off
chcp 65001 >nul
echo 🤖 Personalized LLM Assistant - Preference Manager
echo ================================================
echo.

REM Check if Python is available
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Python is not installed or not in PATH
    echo 💡 Please install Python from https://python.org
    pause
    exit /b 1
)

REM Check if update-preference.py exists
if not exist "update-preference.py" (
    echo ❌ update-preference.py not found!
    echo 💡 Please ensure you're running this from the project directory
    pause
    exit /b 1
)

REM Run the preference management script
echo 🚀 Starting preference manager...
python update-preference.py

echo.
echo 👋 Preference manager closed.
pause
