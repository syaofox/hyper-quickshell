#!/bin/bash
set -euo pipefail
source "$(dirname "${BASH_SOURCE[0]}")/utils.sh"

log_step "Installing system dependencies..."


PACMAN_packages=(  
    base-devel
    meson ninja 

    curl wget


    btrfs-progs
    rsync
    udisks2
    bash-completion

    git 

    xclip
    
    zenity
    dconf
    xsettingsd

    pavucontrol 

    gvfs
    mtools
    smbclient
    cifs-utils
    nfs-utils
    fuse3

  

)

log_info "Installing official packages..."
if ! sudo pacman -S --needed --noconfirm "${PACMAN_packages[@]}"; then
    log_error "Failed to install some official packages"
    exit 1
fi

log_info "Installing AUR packages via yay..."
AUR_PACKAGES=(
    
)
if command -v yay >/dev/null; then
    yay -S --needed --noconfirm "${AUR_PACKAGES[@]}" || log_warn "Some AUR packages failed to install"
fi


log_info "System dependencies installation complete"
exit 0