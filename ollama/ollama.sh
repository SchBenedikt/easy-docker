#!/bin/bash

# Define color codes for output
COLOR_RESET="\e[0m"
COLOR_GREEN="\e[32m"
COLOR_RED="\e[31m"
COLOR_YELLOW="\e[33m"
COLOR_CYAN="\e[36m"
COLOR_BOLD="\e[1m"
COLOR_UNDERLINE="\e[4m"

# Define a decorative border
BORDER="##################################################"

# Print a styled header
echo -e "${COLOR_CYAN}${BORDER}${COLOR_RESET}"
echo -e "${COLOR_CYAN}${COLOR_BOLD}${COLOR_UNDERLINE}          CURL INSTALLATION SCRIPT          ${COLOR_RESET}"
echo -e "${COLOR_CYAN}${BORDER}${COLOR_RESET}"
echo

# Check if curl is already installed
if ! command -v curl &> /dev/null; then
    echo -e "${COLOR_YELLOW}=> ${COLOR_RESET}curl is not installed. Installing curl..."
    # Update package list and install curl
    sudo apt-get update
    if sudo apt-get install -y curl; then
        echo -e "${COLOR_GREEN}✔ ${COLOR_RESET}curl has been successfully installed."
    else
        echo -e "${COLOR_RED}✘ ${COLOR_RESET}An error occurred while installing curl. Please check the package sources and try again."
        exit 1
    fi
else
    echo -e "${COLOR_GREEN}✔ ${COLOR_RESET}curl is already installed."
fi

# Print a styled section header
echo
echo -e "${COLOR_CYAN}${BORDER}${COLOR_RESET}"
echo -e "${COLOR_CYAN}${COLOR_BOLD}${COLOR_UNDERLINE}   RUNNING SCRIPT FROM OLLAMA.COM   ${COLOR_RESET}"
echo -e "${COLOR_CYAN}${BORDER}${COLOR_RESET}"
echo

# Run the provided script from ollama.com
if curl -fsSL https://ollama.com/install.sh | sh; then
    echo -e "${COLOR_GREEN}✔ ${COLOR_RESET}The script from ollama.com was successfully executed."
else
    echo -e "${COLOR_RED}✘ ${COLOR_RESET}An error occurred while running the script from ollama.com."
    exit 1
fi
