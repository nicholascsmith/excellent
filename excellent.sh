#!/usr/bin/env bash
#
# Nicholas's Excellent Configuration for Fedora Sway Spin
# https://codeberg.org/ncarters/excellent
#

set -euo pipefail

echo "=================================="
echo "Nicholas's Excellent Configuration"
echo "=================================="
echo ""

# Packages

echo "Installing packages..."
sudo dnf install -y \
    jetbrains-mono-fonts \
    git \
    ripgrep \
    fzf \
    zoxide \
    mako \
    NetworkManager-tui \
    npm \
    transmission \
    xfce-polkit

echo "Enabling RPM Fusion..."
sudo dnf install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "Installing multimedia codecs..."
sudo dnf group install -y multimedia
sudo dnf swap -y 'ffmpeg-free' 'ffmpeg' --allowerasing
sudo dnf upgrade -y @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf group install -y sound-and-video

echo "Installing additional packages..."
sudo dnf install -y intel-media-driver libva-utils
sudo dnf install -y openh264 gstreamer1-plugin-openh264 mozilla-openh264
sudo dnf swap -y mesa-va-drivers mesa-va-drivers-freeworld
sudo dnf swap -y mesa-vdpau-drivers mesa-vdpau-drivers-freeworld
sudo dnf install -y p7zip p7zip-plugins unrar

echo "Installing OBS..."
flatpak install -y --verbose flathub com.obsproject.Studio

# Configuration

echo "Creating directories..."
mkdir -pv ~/Videos/OBS ~/.config

echo "Configuring SSH agent..."
systemctl --user enable --now gcr-ssh-agent.socket
mkdir -pv ~/.config/environment.d
echo 'SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh' > ~/.config/environment.d/ssh-agent.conf

# Clone repositories

echo "Cloning dotfiles..."
git clone --verbose --recurse-submodules https://codeberg.org/ncarters/excellent.git ~/excellent

echo "Cloning wallpapers..."
git clone --verbose https://codeberg.org/ncarters/wallpapers.git ~/Pictures/wallpapers

# Install dotfiles

echo "Installing dotfiles..."
cp -v ~/excellent/.bashrc ~/
cp -v ~/excellent/.bash_profile ~/
cp -rv ~/excellent/dots/* ~/.config/

# Remove packages

echo "Removing packages..."
rm -rfv ~/excellent
killall -v dunst 2>/dev/null || true
sudo dnf remove -y firefox rofi dunst || true
rm -rfv ~/.mozilla || true

echo ""
echo "Done!"
echo ""

exit 0
