#!/bin/bash

# Configuration
REPO_URL="https://josedavd-07.github.io/star-apt-repo"
GPG_KEY_URL="$REPO_URL/key.gpg"

echo "🌟 Installing Star Language Repository..."

# Check for root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (sudo)"
  exit 1
fi

# 1. Download and add GPG key
echo "📥 Downloading GPG key..."
wget -qO - "$GPG_KEY_URL" | gpg --dearmor -o /usr/share/keyrings/star-language-archive-keyring.gpg

# 2. Add repository to sources
echo "📝 Adding repository to sources..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/star-language-archive-keyring.gpg] $REPO_URL stable main" | tee /etc/apt/sources.list.d/star-language.list > /dev/null

# 3. Update and inform
apt update
echo "✅ Star Language repository added successfully!"
echo "🚀 Run 'sudo apt install star-language' to get started."
