#!/bin/bash

CURL_INSTALL_CMD="sudo apt-get install -y curl"

if ! command -v curl &> /dev/null; then
    echo "curl is not installed. Installing curl..."
    sudo apt-get update
    if eval $CURL_INSTALL_CMD; then
        echo "curl has been successfully installed."
    else
        echo -e "\e[31mError occurred while installing curl. Please check the package sources and try again.\e[0m"
        exit 1
    fi
else
    echo "curl is already installed."
fi

echo "Installing Ollama."
if curl -fsSL https://ollama.com/install.sh | sh; then
    echo -e "\e[32mThe script from ollama.com was successfully executed.\e[0m"
else
    echo -e "\e[31mAn error occurred while running the script from ollama.com.\e[0m"
    exit 1
fi
