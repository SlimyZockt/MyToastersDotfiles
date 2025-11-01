#!/usr/bin/env bash


BASE_PACKAGES=(
    git
    curl
    unzip
    wget
    fish
    brave-bin
    btop
    ghostty
    hyprpicker
    hyprpaper
    fuzzel
    nautilus
    spotify
    grim
    slurp
    tesseract
    wl-clipboard
    wl-clip-persist
    bemoji
    blueman
    networkmanager
    network-manager-applet
    pavucontrol
    starship
    fzf
    carapace
    fastfetch
    legcord-bin
    libadwaita-without-adwaita
    ttf-jetbrains-mono-nerd
    ttf-ms-win11-auto
)

GAMING_PACKAGES=(
    cachyos-gaming-meta
    cachyos/umu-launcher
    protonup-qt
)

PROGRAMMING_PACKAGES=(
    neovim
    tmux
    tmux-sessionizer-bin
    ripgrep
    rust
    go
    gopls
    odin
    ols
    clang
    clion-cmake
    clion-jre
    clion-lldb
    gcc
    llvm
    make
    nodejs
    npm
    bun-bin 
    typst
    sqlite
    clion
    python
    intellij-idea-ultimate-edition
    rstudio-desktop-bin
    r-languageserver
    zig
    zls
)


echo -e "[MYT] Updating system...${NC}"
paru -Syu --noconfirm 

echo -e "[MYT] Installing base packages...${NC}"
paru -S --needed --noconfirm "${SYSTEM_PACKAGES[@]}"

echo -e "[MYT] Installing programming packages...${NC}"
paru -S --needed --noconfirm "${PROGRAMMING_PACKAGES[@]}"

echo -e "[MYT] Installing gaming packages...${NC}"
paru -S --needed --noconfirm "${GAMING_PACKAGES[@]}"
