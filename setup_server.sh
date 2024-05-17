#!/bin/bash

# 1. Set timezone to Asia/Jakarta
echo "Setting timezone to Asia/Jakarta..."
sudo timedatectl set-timezone Asia/Jakarta

# 2. Update and upgrade the system
echo "Updating and upgrading the system..."
sudo apt-get update -y && sudo apt-get upgrade -y

# 3. Install Git, Curl, ZIP, Python3, and Python3-pip
echo "Installing Git, Curl, ZIP, Python3, and Python3-pip..."
sudo apt-get install -y git curl zip python3 python3-pip

# 4. Install Docker
echo "Installing Docker..."
sudo apt-get remove docker docker-engine docker.io containerd runc -y
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Add current user to the docker group
sudo usermod -aG docker $USER

echo "Setup completed. Please log out and log back in for Docker group changes to take effect."

# Optional: Enable and start Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Confirm installation
echo "Confirming installations..."
echo "Timezone: $(timedatectl | grep 'Time zone')"
echo "Git version: $(git --version)"
echo "Curl version: $(curl --version | head -n 1)"
echo "ZIP version: $(zip -v | head -n 1)"
echo "Python3 version: $(python3 --version)"
echo "Pip3 version: $(pip3 --version)"
echo "Docker version: $(docker --version)"
