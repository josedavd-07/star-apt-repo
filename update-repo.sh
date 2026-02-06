#!/bin/bash

# Check if reprepro is installed
if ! command -v reprepro &> /dev/null; then
    echo "❌ Error: 'reprepro' is not installed. Run 'sudo apt install reprepro' first."
    exit 1
fi

# Check if a file was provided
if [ -z "$1" ]; then
    echo "❓ Usage: ./update-repo.sh <path-to-deb-file>"
    exit 1
fi

DEB_FILE=$1

if [ ! -f "$DEB_FILE" ]; then
    echo "❌ Error: File '$DEB_FILE' not found."
    exit 1
fi

echo "📦 Adding $DEB_FILE to the stable repository..."

# Process the package
reprepro -b . includedeb stable "$DEB_FILE"

# Export public GPG key automatically (if available)
if gpg --list-keys "Star Language" > /dev/null 2>&1; then
    echo "🔑 Exporting public GPG key..."
    gpg --armor --export "Star Language" > key.gpg
fi

echo "✅ Repository updated! High five! ✋"
echo "👉 Now run: git add . && git commit -m 'Release update' && git push"
