
#!/bin/bash
set -e
set -o pipefail

INSTALL_DEV=1
INSTALL_ARM=1
INSTALL_LIBS=1
INSTALL_CLI=1
INSTALL_DESKTOP=1
INSTALL_GRAPHICS=1
INSTALL_SOUND=1

LOGFILE="install.log"
exec > >(tee -i $LOGFILE) 2>&1

echo "Updating package lists..."
apt update && apt upgrade -y

if [ "$INSTALL_DEV" -eq 1 ]; then
  echo "Installing essential C/C++ development tools..."
  apt install -y build-essential clang clangd llvm gcc g++ gdb cmake git lazygit \
    pkg-config ccache valgrind
fi

if [ "$INSTALL_ARM" -eq 1 ]; then
  echo "Installing ARM toolchain..."
  apt install -y gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf \
    binutils-arm-linux-gnueabihf qemu-user-static qemu-system-arm
fi

if [ "$INSTALL_LIBS" -eq 1 ]; then
  echo "Installing essential libraries..."
  apt install -y libx11-dev libfontconfig1-dev libasound2-dev libjack-jackd2-dev \
    libcurl4-openssl-dev libxrandr-dev libxinerama-dev libxcursor-dev libfreetype-dev \
    libxcomposite-dev libxext-dev libxrender-dev libglu1-mesa-dev mesa-common-dev \
    libdrm-dev libgbm-dev libpixman-1-dev
fi

if [ "$INSTALL_CLI" -eq 1 ]; then
  echo "Installing CLI tools..."
  apt install -y fzf moc tmux alacritty btop htop rtorrent mit-scheme micro \
    lua5.4 luarocks python3 python3-pip starship flatpak meld fuse-zip brightnessctl \
    curl fuseiso archivemount unrar unzip ripgrep fd-find
  # Optional: add Flathub remote
  # flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

if [ "$INSTALL_DESKTOP" -eq 1 ]; then
  echo "Setting up Desktop tools..."
  apt install -y hyprland hyprland-guiutils hyprlock hypridle hyprpaper hyprpicker \
    hyprqt6engine wayland-protocols waybar tofi pipewire wireplumber \
    xdg-desktop-portal-hyprland xwaylandvideobridge qt6-wayland nemo \
    nemo-font-manager wlogout grim slurp wl-clipboard dunst grimshot
fi

if [ "$INSTALL_GRAPHICS" -eq 1 ]; then
  echo "Installing Graphic tools..."
  apt install -y mtpaint inkscape blender gpick vlc zathura qimgv krita \
    vulkan-tools wayland-utils xcompmgr
fi

if [ "$INSTALL_SOUND" -eq 1 ]; then
  echo "Setting up Sound system..."
  apt install -y pipewire-alsa alsa-utils qpwgraph pipewire-jack \
    pipewire-audio-client-libraries libspa-0.2-jack
fi

echo "Cleaning up..."
apt autoremove -y && apt clean

echo "Installation complete!"

