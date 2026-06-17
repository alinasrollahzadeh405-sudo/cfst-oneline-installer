#!/bin/bash

# Check if the 'cfst' folder exists
if [ ! -d "cfst" ]; then
    echo "First time setup... Installing requirements."
    pkg update && pkg upgrade -y
    pkg install wget tar -y
    mkdir cfst
    cd cfst
    # Download the latest version
    wget -N https://github.com/XIU2/CloudflareSpeedTest/releases/latest/download/cfst_linux_arm64.tar.gz
    tar -xzf cfst_linux_arm64.tar.gz
    chmod +x cfst
else
    cd cfst
    # Ask for update if already installed
    echo "Scanner is already installed. Do you want to update it? (y/n)"
    read answer
    if [ "$answer" == "y" ]; then
        echo "Updating to the latest version..."
        wget -N https://github.com/XIU2/CloudflareSpeedTest/releases/latest/download/cfst_linux_arm64.tar.gz
        tar -xzf cfst_linux_arm64.tar.gz
        chmod +x cfst
    else
        echo "Skipping update..."
    fi
fi

# Run the scanner
echo "Starting Cloudflare SpeedTest..."
./cfst -tl 200 -dn 20 -p 443

