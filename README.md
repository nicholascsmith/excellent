# Nicholas's Excellent Configuration

An excellent configuration for Fedora Sway Spin.

## Table of Contents

- [Connect to Network](#connect-to-network)
- [Run Script](#run-script)
- [Next Steps](#next-steps)
- [Configuration](#configuration)
- [Keybindings](#keybindings)
- [License](#license)

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

#### Claude Code (via npm)

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
- `Super+a` - Archives
- `Super+b` - Browser
- `Super+c` - Code (text editor)
- `Super+d` - Disks
- `Super+e` - Email #1
- `Super+Shift+e` - Email #2
- `Super+f` - Files
- `Super+g` - Git Repositories #1
- `Super+Shift+g` - Git Repositories #2
- `Super+i` - iCloud Notes
- `Super+Shift+i` - iCloud Drive
- `Super+l` - Lock
- `Super+m` - Music
- `Super+n` - Network (VPN)
- `Super+Shift+n` - Network (Bluetooth)
- `Super+p` - Printers
- `Super+q` - Quit
- `Super+r` - Record
- `Print` - Screenshot
- `Super+t` - Torrent
- `Super+v` - Volume
- `Super+w` - Websites
- `Super+x` - X
- `Super+y` - YouTube

## License

This project is released under the [MIT](LICENSE).
