#!/bin/bash

echo "🗑️ Removing Star Language Repository..."

# Check for root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (sudo)"
  exit 1
fi

# 1. Remove sources list
rm -f /etc/apt/sources.list.d/star-language.list

# 2. Remove keyring
rm -f /usr/share/keyrings/star-language-archive-keyring.gpg

# 3. Update
apt update

echo "✅ Star Language repository removed."
