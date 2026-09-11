@echo off
REM Build script for Mobile Military Force Game (Windows)
REM This script builds the game for Android, iOS, and Windows

echo.
echo ================================
echo Mobile Military Force - Build Script (Windows)
echo ================================
echo.

REM Check if Node.js is installed
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [X] Node.js is not installed. Please install Node.js first.
    echo Download from: https://nodejs.org/
    pause
    exit /b 1
)

REM Check if Cordova is installed
where cordova >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [*] Installing Cordova globally...
    call npm install -g cordova
)

echo [OK] Prerequisites check complete
echo.

REM Variables
set PROJECT_NAME=military-game
set PACKAGE_ID=com.militaryforce.game
set APP_NAME=Mobile Military Force

REM Create Cordova project
if not exist "%PROJECT_NAME%" (
    echo [*] Creating Cordova project: %PROJECT_NAME%
    call cordova create %PROJECT_NAME% %PACKAGE_ID% "%APP_NAME%"
    cd %PROJECT_NAME%
) else (
    cd %PROJECT_NAME%
)

REM Add platforms
echo [*] Adding Android platform...
call cordova platform add android

echo [*] Adding iOS platform...
call cordova platform add ios

echo [*] Adding Windows platform...
call cordova platform add windows

REM Copy app files
echo [*] Copying app files...
copy ..\index.html www\
copy ..\manifest.json www\
copy ..\config.xml .

REM Install plugins
echo [*] Installing plugins...
call cordova plugin add cordova-plugin-device
call cordova plugin add cordova-plugin-statusbar

REM Build Android
echo [*] Building Android APK...
call cordova build android --release

echo.
echo ================================
echo [OK] BUILD COMPLETE!
echo ================================
echo.
echo APK Location:
echo    platforms\android\app\build\outputs\apk\release\app-release-unsigned.apk
echo.
echo Next steps:
echo    1. Sign the APK
echo    2. Transfer to your phone
echo    3. Install on phone
echo.
echo For detailed instructions, see APP_STORE_GUIDE.md
echo.
pause
