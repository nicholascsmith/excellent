# Nicholas's Excellent Configuration

An excellent configuration for Fedora Sway Spin.

## Table of Contents

- [Getting Started](#getting-started)
- [Install Applications](#install-applications)
- [Configuration](#configuration)
- [Keybindings](#keybindings)

## Getting Started

### Connect to Network

Replace **`<SSID>`** and **`<PASSWORD>`** with **your network credentials.**

```bash
nmcli device wifi connect "<SSID>" password "<PASSWORD>"
```

### Run Script

```bash
curl -o ~/excellent.sh https://codeberg.org/ncarters/excellent/raw/branch/master/excellent.sh
chmod +x ~/excellent.sh
~/excellent.sh
```

> [!NOTE]
> To update the dotfiles later, copy the modified dotfiles from `~/.config/` to `~/excellent/dots/` and push changes to your repository.

## Install Applications

- [Brave Browser](https://brave.com/linux/)
- [Claude Code](https://code.claude.com/docs/en/setup)
- [Heroic Games Launcher](https://flathub.org/en/apps/com.heroicgameslauncher.hgl)
- [Kopia](https://kopia.io/docs/installation/#linux-installation-using-rpm-redhat-centos-fedora)
- [NextDNS](https://github.com/nextdns/nextdns/wiki#supported-platforms)
- [Proton VPN](https://protonvpn.com/support/official-linux-vpn-fedora/)
- [Zed Editor](https://zed.dev/download)

## Configuration

### SDDM

```bash
sudo nano /etc/sddm.conf
```

Update **`[AutoLogin]`.** Replace **`<USERNAME>`** with **your username.**

- `#Relogin=` → **`Relogin=sway`**
- `#Session=` → **`Session=sway`**
- `#User=` → **`User=<USERNAME>`**

### Brave Browser

**Extensions:**

- Dark Reader
- Proton Pass
- SponsorBlock for YouTube

**Toolbar:**

- Add Bookmark
- Bookmarks Panel
- Downloads
- Delete browsing data

**Cookie Deletion Whitelist:**

- https://codeberg.org
- https://dash.cloudflare.com
- https://github.com
- https://www.icloud.com
- https://music.apple.com
- https://my.nextdns.io
- https://proton.me
- https://tuta.com
- https://x.com

### Git

Replace **`<EMAIL>`** with **your email.**

```bash
ssh-keygen -t ed25519 -C "<EMAIL>"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
```

Add the output to your **[Codeberg SSH Keys](https://codeberg.org/user/settings/keys).**

Replace **`<TOKEN>`** with **your Codeberg token.**

```bash
echo 'export CODEBERG="<TOKEN>"' >> ~/.bashrc
```

**To create a new tory,** replace **`<USERNAME>`** with **your username** and **`<REPO>`** with **your tory name:**

```bash
git init
curl -X POST https://codeberg.org/api/v1/user/repos \
  -H "Authorization: token $CODEBERG" \
  -H "Content-Type: application/json" \
  -d '{"name": "<REPO>", "private": false}'
git remote add origin https://codeberg.org/<USERNAME>/<REPO>.git
```

### Zoxide

```bash
echo 'eval "$(zoxide init bash)"' >> ~/.bashrc
```

### Remove Waybar (Optional)

```bash
sudo dnf remove -y waybar
```

## Keybindings

- **`Super+Arrow`** - Focus window
- **`Super+Shift+Arrow`** - Move window
- **`Super+Tab`** - Cycle workspaces
- **`Super+Escape`** - Reload Sway
- **`Super+Space`** - Terminal
- **`Super+Shift+Space`** - Toggle floating window
- **`Super+Return`** - Games
- **`Super+Shift+Return`** - GeoGuessr
- **`Super+Slash`** - AI
- **`Super+A`** - Archives
- **`Super+B`** - Browser
- **`Super+C`** - Code (text editor)
- **`Super+D`** - Disks
- **`Super+E`** - Email #1
- **`Super+Shift+E`** - Email #2
- **`Super+F`** - Files
- **`Super+G`** - Git tories #1
- **`Super+Shift+G`** - Git tories #2
- **`Super+I`** - iCloud Notes
- **`Super+Shift+I`** - iCloud Drive
- **`Super+L`** - Lock
- **`Super+M`** - Music
- **`Super+N`** - Network (VPN)
- **`Super+Shift+N`** - Network (Bluetooth)
- **`Super+P`** - Printers
- **`Super+Q`** - Quit
- **`Super+R`** - Record
- **`Print`** - Screenshot
- **`Super+T`** - Torrent
- **`Super+V`** - Volume
- **`Super+W`** - Websites
- **`Super+X`** - X
- **`Super+Y`** - YouTube
