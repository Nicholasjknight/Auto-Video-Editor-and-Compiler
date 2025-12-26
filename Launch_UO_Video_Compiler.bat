@echo off
title B-Magic's Auto Video Compiler
cls
echo.
echo ========================================
echo   🎬 B-Magic's Auto Video Compiler 🎬
echo ========================================
echo.
echo 🚀 Starting GUI application...
echo.

REM Check if Python GUI exists in current directory
if exist "UOVidCompiler_GUI.py" (
    echo ✅ Found Python files in current directory
    goto :python_check
)

REM Check if there's a nested folder (common with ZIP extraction)
if exist "BMagic_AutoVidCompiler_v1.0_FINAL\UOVidCompiler_GUI.py" (
    echo ✅ Found Python files in nested directory
    cd "BMagic_AutoVidCompiler_v1.0_FINAL"
    goto :python_check
)

echo ❌ ERROR: UOVidCompiler_GUI.py not found!
echo Searched in:
echo - Current directory: %CD%
echo - Nested directory: %CD%\BMagic_AutoVidCompiler_v1.0_FINAL
echo.
echo Please make sure all files are properly extracted from the ZIP file.
echo.
pause
exit /b 1

:python_check

REM Check if system Python is available
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ Using system Python with bundled libraries
    set PYTHON_CMD=python
    goto :launch_app
)

REM Try pythonw
pythonw --version >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ Using system Python (pythonw) with bundled libraries  
    set PYTHON_CMD=pythonw
    goto :launch_app
)

REM Try py launcher
py --version >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ Using Python launcher with bundled libraries
    set PYTHON_CMD=py
    goto :launch_app
)

echo ❌ ERROR: No Python found!
echo.
echo This application requires Python 3.8 or higher.
echo Please install Python from: https://www.python.org/downloads/
echo.
echo IMPORTANT: During installation, check "Add Python to PATH"
echo.
pause
exit /b 1

:launch_app
echo ✅ Python found, launching B-Magic's Auto Video Compiler...
echo 📁 Working directory: %CD%
echo 📦 Using bundled Python libraries
echo ⏱️ GUI will open in a moment, this window will close automatically...
echo.

REM Wait a moment for user to read message
timeout /t 2 /nobreak >nul

REM Launch the GUI application without keeping CMD open
start "" "%PYTHON_CMD%" UOVidCompiler_GUI.py

REM Close this batch window immediately
exit
