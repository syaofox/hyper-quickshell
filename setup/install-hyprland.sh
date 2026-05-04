#!/bin/bash
set -euo pipefail
source "$(dirname "${BASH_SOURCE[0]}")/utils.sh"

log_step "Installing hyprland..."

PACMAN_packages=(  
    hyprland
    swaync
    kitty
    # uwsm
    dolphin
    rofi
    xdg-desktop-portal-hyprland
    qt5-wayland
    qt6-wayland
    hyprpolkitagent
    hyprshot    
    grim
    slurp
    hyprlock
    hypridle
)
  

log_info "Installing official packages..."
if ! sudo pacman -S --needed --noconfirm "${PACMAN_packages[@]}"; then
    log_error "Failed to install some official packages"
    exit 1
fi


log_info "Hyprland installation complete"
exit 0