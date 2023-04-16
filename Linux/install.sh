#!/bin/bash

echo "This script will install Vencord from source."
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

# Prompt the user to continue with the installation
read -p "Do you want to install Vencord from source? (y/n) " confirm
if [[ "$confirm" != [yY] ]]
then
    echo "Vencord installation cancelled."
    exit 0
fi

# Clone Vencord repository
git clone https://github.com/Vendicated/Vencord
cd Vencord

# Install dependencies
pnpm install --frozen-lockfile

# Build Vencord
pnpm build

# Inject Vencord into client
pnpm inject

echo "Vencord installation complete."
echo "Now install Vencord into your client as you would normally using the GUI."
