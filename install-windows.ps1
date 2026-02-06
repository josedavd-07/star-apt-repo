# Star Language Installer for Windows 🪟
$repo = "josedavd-07/Star"
$installDir = "$env:LOCALAPPDATA\StarLanguage"

echo "🌟 Installing Star Language..."

# 1. Get latest release
$release = Invoke-RestMethod -Uri "https://api.github.com/repos/$repo/releases/latest"
$tag = $release.tag_name
$asset = $release.assets | Where-Object { $_.name -like "*-windows.zip" } | Select-Object -First 1

if (-not $asset) {
    echo "❌ Error: Could not find Windows release asset for $tag"
    exit 1
}

# 2. Create directory
if (-not (Test-Path $installDir)) {
    New-Item -Path $installDir -ItemType Directory
}

# 3. Download and Unzip
$zipPath = "$installDir\star-$tag.zip"
echo "📥 Downloading $tag..."
Invoke-WebRequest -Uri $asset.browser_download_url -OutFile $zipPath
Expand-Archive -Path $zipPath -DestinationPath $installDir -Force
Remove-Item $zipPath

# 4. Add to PATH (User level)
echo "📝 Adding to PATH..."
$path = [Environment]::GetEnvironmentVariable("Path", "User")
if (-not $path.Contains($installDir)) {
    [Environment]::SetEnvironmentVariable("Path", $path + ";" + $installDir, "User")
    $env:Path += ";" + $installDir
}

echo "✅ Star Language $tag installed successfully!"
echo "🚀 Restart your terminal and run 'star --version' to confirm."
