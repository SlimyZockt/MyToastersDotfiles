# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let
    unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  hardware.openrazer.enable = true;
  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "de_DE.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

   # Enable the KDE Plasma Desktop Environment.

  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
      extraPortals = [
        # pkgs.xdg-desktop-portal
        # pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-hyprland
      ];
    };
  };

  nix.settings.experimental-features = "nix-command flakes";

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
  
  services.ratbagd.enable = true;
 # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.myt = {
    isNormalUser = true;
    description = "My Toaster";
    extraGroups = [ "networkmanager" "wheel" "video" "openrazer" "ratbagd"];
      packages = with pkgs; [
        localsend
        tmux
        gcc
        nodejs_20
        go
        gopls
        typescript
        libgcc
        zig
        gnumake
        cargo
        air
        nil
        vscode
        libuchardet
        typescript
        discord
        obs-studio
      ];
  };

  # Install firefox.
  # programs.firefox.enable = true;
  # services.gnome.gnome-keyring.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  programs.git= {
    enable = true;
    package = pkgs.gitFull;
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  programs.fish.enable = true;
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    GIT_ASKPASS = "1";
  };

  programs.light.enable = true;
  programs.nix-ld.enable = true;
  programs.dconf.enable = true;
  programs.nix-ld.libraries = with pkgs; [

  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    unstable.neovim
    lxqt.lxqt-policykit
    brave
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
    vim
    piper
    # libnotify
    adwaita-icon-theme 
    alacritty
    wget
    dunst
    waybar
    iwgtk
    lxqt.lxqt-policykit
    swww
    slurp
    networkmanagerapplet
    grim
    polychromatic
    mako
    adapta-kde-theme
    adwaita-qt6
    xorg.xcursorthemes
    polkit_gnome
    wl-clipboard
    rofi-wayland
    starship
    unzip
    ripgrep
    nixd
    lf
    wezterm
    fastfetch

  ];
  
  environment.localBinInPath = true;

  # ADD FONTS
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" "FiraCode" "DroidSansMono" ]; })
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
   # programs.mtr.enable = true;
   # programs.gnupg.agent = {
   #   enable = true;
   #   enableSSHSupport = true;
   # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  # security.polkit.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 53317 ];
  # networking.firewall.allowedUDPPorts = [ 53317 ];

  # Or disable the firewall altogether.
  networking.firewall.enable = false;
  system.autoUpgrade = {
    enable = true;
  };

  environment.sessionVariables = {
    "$PATH" = [ 
      "$HOME/Dokumente/CodeStuff/DotTools/DotTools"
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  # Use GC
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

}
