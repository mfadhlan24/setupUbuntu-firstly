#!/bin/bash

# Update and upgrade packages
echo "Updating and upgrading packages..."
sudo apt update && sudo apt upgrade -y

# Install git
echo "Installing git..."
sudo apt install git -y

# Install pass
echo "Installing pass..."
sudo apt install pass -y

# Download Git Credential Manager Core
echo "Downloading Git Credential Manager Core..."
wget "https://github.com/microsoft/Git-Credential-Manager-Core/releases/download/v2.0.498/gcmcore-linux_amd64.2.0.498.54650.deb" -O /tmp/gcmcore.deb

# Install Git Credential Manager Core
echo "Installing Git Credential Manager Core..."
sudo dpkg -i /tmp/gcmcore.deb

# Configure Git Credential Manager Core
echo "Configuring Git Credential Manager Core..."
git-credential-manager-core configure

# Set git to use gpg for credential storage
echo "Setting Git to use GPG for credential storage..."
git config --global credential.credentialStore gpg

# Generate GPG key
echo "Generating GPG key..."
gpg --full-gen-key

# Prompt user to complete GPG key generation
echo "Please complete the GPG key generation process."
read -p "Press Enter to continue once you have completed the GPG key generation..." temp

# Prompt user to enter the fingerprint of the generated GPG key
read -p "Enter the fingerprint of your generated GPG key: " GPG_KEY

# Initialize pass with the specific GPG key
echo "Initializing pass with the GPG key..."
pass init $GPG_KEY

# Prompt user to enter GitHub credentials
echo "Please enter your GitHub credentials."
read -p "GitHub Username: " github_user
read -sp "GitHub Password: " github_password
echo

# Store GitHub credentials in pass
echo "Storing GitHub credentials in pass..."
pass insert github.com << EOF
$github_password
user:$github_user
protocol:https
host:github.com
EOF

# Install nvm
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Load nvm into the current shell session
echo "Loading nvm into the current shell session..."
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# List remote Node.js versions
echo "Listing remote Node.js versions..."
nvm list-remote

# Install the stable version of Node.js
echo "Installing the stable version of Node.js..."
nvm install stable

echo "Setup is complete!"
