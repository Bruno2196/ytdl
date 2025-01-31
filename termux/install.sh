#!/bin/bash

# Check if the operating system is Windows
if [ "$OSTYPE" == "msys" ]; then
    # Windows OS detected
    python_cmd="python"
else
    # Assume non-Windows (Linux/Mac) OS
    python_cmd="python3"
fi

# Check if Python is installed
if ! command -v $python_cmd &>/dev/null; then
    echo "$python_cmd is not installed. Installing $python_cmd..."
    # Install Python based on the detected command (python or python3)
    if [ "$OSTYPE" == "msys" ]; then
        # Windows OS
        choco install python -y
    else
        # Linux/Mac OS
        apt-get update
        apt-get install $python_cmd -y
    fi
else
    echo "$python_cmd is already installed."
fi

# Install pytube Python package
echo "Installing pytube..."
$python_cmd -m pip install pytube

# Clear the terminal based on the OS
if [ "$OSTYPE" == "msys" ]; then
    # Windows OS
    echo "Clearing the terminal (Windows)..."
    cls
else
    # Linux/Mac OS
    echo "Clearing the terminal (Linux/Mac)..."
    clear
fi

# Install bot.py from the external link
echo "Downloading bot.py..."
curl -O https://raw.githubusercontent.com/Ptechgithub/ytdl/main/termux/ytdl_termux.py

# Run the bot.py script
echo "Running bot.py with $python_cmd..."
$python_cmd ytdl_termux.py
