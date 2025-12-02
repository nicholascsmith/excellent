#!/usr/bin/env bash
#
# Nicholas's Excellent Configuration for Fedora Sway Spin
# https://github.com/nicholascsmith/excellent
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=================================="
echo "Nicholas's Excellent Configuration"
echo "=================================="
echo ""

# Packages

echo "Installing packages..."
sudo dnf install -y \
    nautilus \
    jetbrains-mono-fonts \
    git \
    ripgrep \
    fzf \
    zoxide \
    mako \
    NetworkManager-tui \
    npm \
    transmission

echo "Enabling RPM Fusion..."
sudo dnf install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo "Installing multimedia codecs..."
sudo dnf group install -y multimedia
sudo dnf swap -y 'ffmpeg-free' 'ffmpeg' --allowerasing
sudo dnf upgrade -y @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
sudo dnf group install -y sound-and-video

echo "Installing OBS..."
flatpak install -y flathub com.obsproject.Studio

# Configuration

echo "Creating directories..."
mkdir -pv ~/Videos/OBS ~/.config

# Clone repositories

echo "Cloning dotfiles..."
git clone --recurse-submodules https://github.com/nicholascsmith/excellent.git ~/excellent

echo "Cloning wallpapers..."
git clone https://github.com/nicholascsmith/wallpapers.git ~/Pictures/wallpapers

# Install dotfiles

echo "Installing dotfiles..."
cp ~/excellent/.bashrc ~/
cp ~/excellent/.bash_profile ~/
cp -r ~/excellent/dots/* ~/.config/

# Remove packages

echo "Removing packages..."
rm -rf ~/excellent
killall dunst 2>/dev/null || true
sudo dnf remove -y firefox thunar rofi dunst || true
rm -rf ~/.mozilla ~/.config/Thunar || true

echo ""
echo "Done!"
echo ""

exit 0
