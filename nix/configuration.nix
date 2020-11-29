# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

    boot = {
      # Use the systemd-boot EFI boot loader.
      loader.grub = {
        efiSupport = true;
        enable = true;
        version = 2;
        devices = [ "nodev" ];
        useOSProber = true;
      };

      # support exfat filesystem
      extraModulePackages = [ config.boot.kernelPackages.exfat-nofuse ];
    };

  boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.systemd-boot.enable = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp2s0.useDHCP = true;

  hardware.sane.enable = true;

  virtualisation.docker.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    tree
    htop
    gnumake
    cmake
    python3
    wget
    # neovim needs extra libraries for system clipboard support
    (neovim.overrideAttrs (oldAttrs: {
      buildInputs = (oldAttrs.buildInputs ++ [ pkgs.xorg.libX11 pkgs.xorg.libXt ]);
    }))
    git
    kitty
    fzf
    curl
    firefox
    chromium
    yarn
    docker-compose

    # External HDD compatibility
    ntfs3g
    exfat-utils
    p7zip

    openvpn
    ledger-live-desktop

    simple-scan
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   pinentryFlavor = "gnome3";
  # };

  programs.fish.enable = true;
  # programs.bash.shellAliases = {
  #   cyopen = "CYPRESS_INSTALL_BINARY=0 CYPRESS_RUN_BINARY=/home/gerkules/.dotfiles/nix/built-derivations/cypress-4.7.0/bin/Cypress yarn cy:open";
  #   cyrun = "CYPRESS_INSTALL_BINARY=0 CYPRESS_RUN_BINARY=/home/gerkules/.dotfiles/nix/built-derivations/cypress-4.7.0/bin/Cypress yarn cy:run";
  # };

  environment.variables = {
    CYPRESS_INSTALL_BINARY = "0";
    CYPRESS_RUN_BINARY = "/home/gerkules/.dotfiles/nix/built-derivations/cypress-4.7.0/bin/Cypress";
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = with pkgs; [
    gutenprint
    brlaser
    brgenml1lpr
    brgenml1cupswrapper
  ];

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];

    displayManager.defaultSession = "xfce+i3";
    displayManager.lightdm = {
      enable = true;
    };

    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      extraPackages = with pkgs; [
        dmenu
        i3status
        # i3lock
        i3blocks
      ];
    };

    # config = 
    #   ''
    #     # Configure the Kensington trackball
    #     # http://yjpark.blogspot.fr/2010/04/using-trackball-on-linux.html
    #     Section "InputClass"
    #       Identifier "Trackball Wheel Emulation"
    #       MatchProduct "Kensington Kensington Slimblade Trackball"
    #       MatchDevicePath "/dev/input/event*"
    #       # Enable the mouse wheel emulation (similar to the navigation mode)
    #       Option "EmulateWheel" "true"
    #       # Upper-right button to trigger the navigation mode
    #       Option "EmulateWheelButton" "8"
    #       # Make it work for both vertical and horizontal scroll
    #       Option "XAxisMapping" "6 7"
    #       Option "YAxisMapping" "4 5"
    #       # Remap the buttons a little bit, since firefox will use
    #       # button 8 as back button and that's not what I want
    #       Option "ButtonMapping" "1 8 3 4 5 6 7 10 9 2 11 12"
    #     EndSection
    #   '';
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  location = {
    latitude = 49.0;
    longitude = 8.0;
  };

  services = {
    redshift = {
      enable = true;
    };

    geoclue2 = {
      enable = true;
    };

    localtime = {
      enable = true;
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    groups = {
      plugdev = {};
      docker = {};
    };

    users.gerkules = {
      isNormalUser = true;
      extraGroups = [ "sudo" "docker" "plugdev" "scanner" "lp" ];
      shell = pkgs.fish;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

  security.sudo.configFile = ''
    # Keep SSH_AUTH_SOCK so that pam_ssh_agent_auth.so can do its magic.
    Defaults env_keep+=SSH_AUTH_SOCK
    
    # "root" is allowed to do anything.
    root        ALL=(ALL:ALL) SETENV: ALL
    gerkules    ALL=(ALL:ALL) SETENV: ALL
    
    # extraRules
    %wheel  ALL=(ALL:ALL)   SETENV: ALL
    
    
    # Keep terminfo database for root and %wheel.
    Defaults:root,%wheel env_keep+=TERMINFO_DIRS
    Defaults:root,%wheel env_keep+=TERMINFO
  '';

  nix.allowedUsers = ["gerkules"];

  # Required for Ledger Live to detect Ledger Nano S via USB
  services.udev.extraRules = ''
    # firmware 1.6.0+
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="1b7c", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="2b7c", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="3b7c", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="4b7c", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="1807", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="1808", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0000", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0001", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0004", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="1011", MODE="0660", GROUP="plugdev"
    SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="1015", MODE="0660", GROUP="plugdev"

    # Rule for all ZSA keyboards
    SUBSYSTEM=="usb", ATTR{idVendor}=="3297", GROUP="plugdev"
    # Rule for the Moonlander
    SUBSYSTEM=="usb", ATTR{idVendor}=="3297", ATTR{idProduct}=="1969", GROUP="plugdev"
  '';
}

