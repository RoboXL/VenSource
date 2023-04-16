@echo off

echo This script will install Vencord from source.
echo Before proceeding, please make sure you have Git and pnpm installed on your system.

rem Check if Git is installed
where git > nul
if %errorlevel% neq 0 (
  echo Error: Git is not installed on this system.
  echo Please install Git before running this script.
  pause
  exit /b
)

rem Check if pnpm is installed
where pnpm > nul
if %errorlevel% neq 0 (
  echo Error: pnpm is not installed on this system.
  echo Please install pnpm before running this script.
  pause
  exit /b
)

rem Prompt the user to continue with the installation
set /p confirm=Do you want to install Vencord from source? (y/n)
if /i "%confirm%" neq "y" (
  echo Vencord installation cancelled.
  pause
  exit /b
)

rem Clone Vencord repository
git clone https://github.com/Vendicated/Vencord
cd Vencord

rem Install dependencies
pnpm install --frozen-lockfile

rem Build Vencord
pnpm build

rem Inject Vencord into client
pnpm inject

echo Vencord installation complete.
echo Now install Vencord into your client as you would normally using the GUI.
pause
