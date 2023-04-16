#!/bin/bash

echo "This script will update your Vencord installation."
echo "Before proceeding, please make sure you have Git and pnpm installed on your system."

# Check if Git is installed
if ! command -v git &> /dev/null
then
    echo "Error: Git is not installed on this system."
    echo "Please install Git before running this script."
    exit 1
fi

# Check if pnpm is installed
if ! command -v pnpm &> /dev/null
then
    echo "Error: pnpm is not installed on this system."
    echo "Please install pnpm before running this script."
    exit 1
fi

# Change to Vencord directory
cd Vencord || exit

# Pull latest changes
git pull

# Reset local changes if necessary
read -p "Do you want to reset local changes to Vencord? (y/n) " reset
if [[ "$reset" =~ ^[Yy]$ ]]
then
    git reset --hard
fi

# Build Vencord
pnpm build

# Inject Vencord
pnpm inject

echo "Vencord update complete."
echo "Please refresh your client to see the changes."
