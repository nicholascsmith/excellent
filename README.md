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

**Action:** In the `[AutoLogin]` section, update:

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

## Configuration

### Git SSH

```bash
ssh-keygen -t ed25519 -C "[EMAIL]"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
```

**Action:** Add the output to GitHub → Settings → SSH and GPG keys → New SSH key

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

- https://dash.cloudflare.com/login
- https://github.com/login
- https://x.com
- https://my.nextdns.io/login
- https://www.icloud.com
- https://music.apple.com

**Bookmarks:**

- NextDNS
- Reddit

### Nautilus

**Action:** Bookmark folders

## Keybindings

### Application Shortcuts

- `Super+t` - Terminal
- `Super+b` - Browser
- `Super+c` - Code (text editor)
- `Super+n` - Network (VPN)
- `Super+Shift+n` - Network (Bluetooth)
- `Super+v` - Volume
- `Super+f` - Files
- `Super+r` - Record

### Web Apps

- `Super+Return` - Proton apps
- `Super+Shift+Return` - Tutanota mail
- `Super+slash` - AI #1
- `Super+Shift+slash` - AI #2
- `Super+y` - YouTube
- `Super+a` - Archives
- `Super+g` - Games
- `Super+x` - X
- `Super+m` - Music
- `Super+i` - iCloud Notes
- `Super+Shift+i` - iCloud Drive
- `Super+d` - Development (repositories)
- `Super+Shift+d` - Development (web services)

### Utilities

- `Super+s` - Storage
- `Super+p` - Printers
- `Super+q` - Quit window
- `Super+Shift+q` - Lock screen
- `Super+Escape` - Reload sway config
- `Super+space` - Toggle floating window
- `Super+arrow` - Focus window
- `Super+Shift+arrow` - Move window

### Workspaces

- `Super+Tab` - Cycle workspaces

### Media Keys

- `Print` - Screenshot

## License

This project is released under the [MIT](LICENSE).
