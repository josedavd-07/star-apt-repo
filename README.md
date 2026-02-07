# <img src="star-logo.png" width="48" height="48" align="center" /> Star Language APT Repository 🌟

Official Debian/Ubuntu repository for the **Star Language** compiler and tools.

## 🚀 Installation

### 🐧 Linux (Debian/Ubuntu)
```bash
curl -fsSL https://josedavd-07.github.io/star-apt-repo/install.sh | sudo bash
```

### 🪟 Windows (PowerShell)
```powershell
iwr https://josedavd-07.github.io/star-apt-repo/install-windows.ps1 -useb | iex
```

### 🍎 macOS (Homebrew)
```bash
brew tap josedavd-07/star-apt-repo
brew install star
```

### 🍎 macOS (Manual)
```bash
curl -fsSL https://josedavd-07.github.io/star-apt-repo/install-mac.sh | sudo bash
```

---

## 🛠 Repository Management (For Maintainers)

This repository is managed using `reprepro`.

### Initialize / Update
To add a new `.deb` package to the stable distribution:
```bash
./update-repo.sh path/to/your-package.deb
```

### Structure
- `conf/`: Configuration files for the repository.
- `dists/`: Distribution indices (generated).
- `pool/`: Actual package files (generated).
- `key.gpg`: Support public key (generated).

---

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

*Reach for the Stars.* 🌌
