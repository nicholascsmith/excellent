# Nicholas's Excellent Configuration

An excellent configuration for Fedora Sway Spin.

## Connect to Network

```bash
nmcli device wifi connect "[SSID]" password "[PASSWORD]"
```

## Run Script

```bash
curl -o ~/excellent.sh https://raw.githubusercontent.com/nicholascsmith/excellent/master/excellent.sh
chmod +x ~/excellent.sh
~/excellent.sh
```

## Next Steps

### System Configuration

#### SDDM Auto-Login

```bash
sudo nano /etc/sddm.conf
```

**In the `[AutoLogin]` section, update:**

- `#Relogin=` → **`Relogin=sway`**
- `#Session=` → **`Session=sway`**
- `#User=` → **`User=ncarters`**

#### Remove Waybar

```bash
sudo dnf remove -y waybar
```

### Application Installation

#### Brave Browser

[Install Brave Browser](https://brave.com/linux/)

#### Zed Editor

[Install Zed Editor](https://zed.dev/download)

#### Claude Code

[Install Claude Code](https://code.claude.com/docs/en/setup)

#### NextDNS

[Install NextDNS](https://github.com/nextdns/nextdns/wiki#supported-platforms)

#### Proton VPN

[Install Proton VPN](https://protonvpn.com/support/official-linux-vpn-fedora/)

#### Heroic Games Launcher

[Install Heroic Games Launcher](https://flathub.org/en/apps/com.heroicgameslauncher.hgl)

#### Kopia

[Install Kopia](https://kopia.io/docs/installation/#linux-installation-using-rpm-redhat-centos-fedora)

## Configuration

### Git SSH

```bash
ssh-keygen -t ed25519 -C "[EMAIL]"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
```

**Add the output to GitHub → Settings → SSH and GPG keys → New SSH key**

### Brave Browser

**Extensions:**

- Proton Pass
- Dark Reader
- SponsorBlock for YouTube

**Toolbar:**

- Add Bookmark
- Bookmarks Panel
- Downloads
- Delete browsing data

**Cookie Deletion Whitelist:**

- https://dash.cloudflare.com
- https://github.com
- https://x.com
- https://my.nextdns.io
- https://www.icloud.com
- https://music.apple.com
- https://proton.me
- https://tuta.com
- https://codeberg.org

## Keybindings

- `Super+Arrow` - Focus window
- `Super+Shift+Arrow` - Move window
- `Super+Tab` - Cycle workspaces
- `Super+Escape` - Reload Sway
- `Super+Space` - Terminal
- `Super+Shift+Space` - Toggle floating window
- `Super+Return` - Games
- `Super+Slash` - AI
- `Super+A` - Archives
- `Super+B` - Browser
- `Super+C` - Code (text editor)
- `Super+D` - Disks
- `Super+E` - Email #1
- `Super+Shift+E` - Email #2
- `Super+F` - Files
- `Super+G` - Git Repositories #1
- `Super+Shift+G` - Git Repositories #2
- `Super+I` - iCloud Notes
- `Super+Shift+I` - iCloud Drive
- `Super+L` - Lock
- `Super+M` - Music
- `Super+N` - Network (VPN)
- `Super+Shift+N` - Network (Bluetooth)
- `Super+P` - Printers
- `Super+Q` - Quit
- `Super+R` - Record
- `Print` - Screenshot
- `Super+T` - Torrent
- `Super+V` - Volume
- `Super+W` - Websites
- `Super+X` - X
- `Super+Y` - YouTube
