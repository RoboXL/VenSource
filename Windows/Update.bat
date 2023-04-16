@echo off

echo This script will update your Vencord installation.
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

rem Change to Vencord directory
cd Vencord

rem Pull latest changes
git pull

rem Reset local changes if necessary
set /p reset=Do you want to reset local changes to Vencord? (y/n)
if /i "%reset%" eq "y" (
  git reset --hard
)

rem Build Vencord
pnpm build

rem Inject Vencord
pnpm inject

echo Vencord update complete.
echo Please refresh your client to see the changes.
pause
