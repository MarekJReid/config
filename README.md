#!/bin/bash
# This is a setup config file to install most common applications I use - Arch edition

echo "Starting installation of Node.js..."
######################### NODE #################################################
sudo pacman -S nvm
source /usr/share/nvm/init-nvm.sh
nvm install node
nvm use node
echo "Node.js installation completed."

echo "Starting installation of Go..."
######################### GO #################################################
sudo pacman -Syu
sudo pacman -S go
go version
echo "Go installation completed."

echo "Starting installation of GoLand..."
######################### GOLAND #################################################

# Define the download URL for the specific version of GoLand
DOWNLOAD_URL="https://download.jetbrains.com/go/goland-2023.2.4.tar.gz"

# Define the installation directory
INSTALL_DIR="/opt/goland"

# Download GoLand
wget -O goland.tar.gz "$DOWNLOAD_URL"

# Extract the downloaded archive to the installation directory
sudo tar -xzf goland.tar.gz -C "$INSTALL_DIR"

# Clean up the downloaded archive
rm goland.tar.gz

# Create a symbolic link for easier execution
sudo ln -s "$INSTALL_DIR/goland.sh" /usr/local/bin/goland

echo "GoLand installation completed. You can run it by typing 'goland' in the terminal."

echo "Starting installation of WebStorm..."
######################### WEBSTORM #################################################

# Define the download URL for the specific version of WebStorm
DOWNLOAD_URL="https://download.jetbrains.com/webstorm/WebStorm-2021.3.4.tar.gz"

# Define the installation directory
INSTALL_DIR="/opt/webstorm"

# Download WebStorm
wget -O webstorm.tar.gz "$DOWNLOAD_URL"

# Extract the downloaded archive to the installation directory
sudo tar -xzf webstorm.tar.gz -C "$INSTALL_DIR"

# Clean up the downloaded archive
rm webstorm.tar.gz

# Create a symbolic link for easier execution
sudo ln -s "$INSTALL_DIR/WebStorm.sh" /usr/local/bin/webstorm

echo "WebStorm installation completed. You can run it by typing 'webstorm' in the terminal."

echo "Starting installation of Plank..."
######################### PLANK #################################################

# Install Plank
sudo pacman -S plank --noconfirm

# Start Plank
plank &

echo "Starting installation of Brave browser..."
######################### BRAVE BROWSER #################################################

# Install Brave browser
yay -S brave-bin --noconfirm

echo "Brave browser installation completed."

######################### XFCE THEME #################################################

# Download the XFCE theme from the GitHub repository
curl -LO https://github.com/MarekJReid/config/raw/main/Nordic-darker.tar.xz

# Extract the XFCE theme
tar -xvf Nordic-darker.tar.xz

# Move the theme to the appropriate XFCE themes directory
mkdir -p ~/.local/share/themes
mv Nordic-darker ~/.local/share/themes/

# Apply the XFCE theme using xfconf-query
xfconf-query -c xfwm4 -p /general/theme -s Nordic-darker

echo "XFCE theme installation completed."


echo "Installation process has completed."



