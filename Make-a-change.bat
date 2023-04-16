@echo off

echo This script will watch for changes in your Vencord source code and automatically compile it.
echo Before proceeding, please make sure you have pnpm installed on your system.

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

rem Start watching for changes
pnpm watch

echo Vencord watch has ended. Press any key to exit.
pause > nul
