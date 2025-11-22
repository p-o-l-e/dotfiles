#!/bin/bash
set -e  # Exit immediately if a command fails
set -o pipefail  # Exit if any piped command fails

echo "Updating package lists..."
apt update && apt upgrade -y

echo "Installing essential C/C++ development tools..."
apt install -y build-essential clang clangd llvm gcc g++ gdb cmake git lazygit pkg-config ccache valgrind 

echo "Installing ARM toolchain..."
apt install -y gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf binutils-arm-linux-gnueabihf qemu-user-static

# https://wiki.debian.org/NvidiaGraphicsDrivers
# echo "Setting up Drivers..."
# apt install -y nvidia-tesla-470-driver

echo "Installing essential libraries..."
apt install -y libx11-dev libfontconfig1-dev libasound2-dev libjack-jackd2-dev libcurl4-openssl-dev \
libxrandr-dev libxinerama-dev libxcursor-dev libfreetype-dev \
libxcomposite-dev libxext-dev libxrender-dev libglu1-mesa-dev mesa-common-dev

echo "Installing additional software..."
apt install -y vifm fzf moc tmux alacritty btop htop rtorrent mit-scheme micro lua5.4 luarocks  python3 python3-pip 
apt install -y starship flatpak meld  fuse-zip brightnessctl curl
apt install -y fuseiso archivemount unrar unzip ripgrep fd-find 

echo "Setting up Desktop tools..."
apt install -y hyprland hyprland-guiutils hyprlock hypridle hyprpaper hyprpicker hyprqt6engine\
wayland-protocols waybar tofi pipewire wireplumber xdg-desktop-portal-hyprland \
xwaylandvideobridge qt6-wayland swaybg nemo nemo-font-manager wlogout grim slurp wl-clipboard dunst grimshot

echo "Setting up Graphic tools..."
apt install -y mtpaint inkscape blender gpick vlc zathura qimgv krita \
vulkan-tools wayland-utils xcompmgr

echo "Hyprland build dependencies..."
apt install -y libwayland-dev libxkbcommon-dev libcairo2-dev libjpeg-dev libgl1-mesa-dev


echo "Setting up Sound system..."
apt install -y pipewire-alsa alsa-utils qpwgraph pipewire-jack pipewire-audio-client-libraries libspa-0.2-jack

echo "Cleaning up..."
apt autoremove -y && apt clean

echo "Installation complete!"
