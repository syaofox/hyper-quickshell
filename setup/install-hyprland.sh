#!/bin/bash
set -euo pipefail
source "$(dirname "${BASH_SOURCE[0]}")/utils.sh"

log_step "Installing hyprland..."

PACMAN_packages=(  
    quickshell
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
    sddm
    hyprlauncher
    wl-clipboard
    hyprpicker
    libnotify
    copyq
    
    wireplumber brightnessctl

)

log_info "Creating screenshots directory..."

mkdir -p ~/Pictures/Shots/

log_info "Installing official packages..."
if ! sudo pacman -S --needed --noconfirm "${PACMAN_packages[@]}"; then
    log_error "Failed to install some official packages"
    exit 1
fi

log_info "Enabling SDDM display manager..."
if ! sudo systemctl enable sddm.service; then
    log_error "Failed to enable SDDM service"

log_info "Hyprland installation complete"
exit 0