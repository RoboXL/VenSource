#!/bin/bash

echo "This script will watch for changes in your Vencord source code and automatically compile it."
echo "Before proceeding, please make sure you have pnpm installed on your system."

# Check if pnpm is installed
if ! command -v pnpm > /dev/null; then
  echo "Error: pnpm is not installed on this system."
  echo "Please install pnpm before running this script."
  exit 1
fi

# Change to Vencord directory
cd Vencord

# Start watching for changes
pnpm watch

echo "Vencord watch has ended. Press any key to exit."
read -n1
