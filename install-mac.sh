#!/bin/bash

# Star Language Installer for macOS 🍎
REPO="josedavd-07/Star"
INSTALL_DIR="/usr/local/bin"

echo "🌟 Installing Star Language for macOS..."

# 1. Get latest release
TAG=$(curl -s https://api.github.com/repos/$REPO/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')
ASSET_URL=$(curl -s https://api.github.com/repos/$REPO/releases/latest | grep '"browser_download_url":' | grep 'macos.tar.gz' | sed -E 's/.*"([^"]+)".*/\1/')

if [ -z "$ASSET_URL" ]; then
    echo "❌ Error: Could not find macOS release asset for $TAG"
    exit 1
fi

# 2. Download and Extract
echo "📥 Downloading $TAG..."
curl -L -o star-macos.tar.gz "$ASSET_URL"
tar -xzf star-macos.tar.gz

# 3. Install binary
echo "🚀 Installing to $INSTALL_DIR..."
sudo mv star "$INSTALL_DIR/star"
chmod +x "$INSTALL_DIR/star"

# Clean up
rm star-macos.tar.gz

echo "✅ Star Language $TAG installed successfully!"
echo "🌌 Run 'star --version' to confirm."
