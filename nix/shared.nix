{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  boot = {
    # Use the systemd-boot EFI boot loader.
    loader = {
      grub = {
        efiSupport = true;
        enable = true;
        version = 2;
        devices = [ "nodev" ];
        useOSProber = true;
      };

      efi.canTouchEfiVariables = true;
    };

    # support exfat filesystem
    # extraModulePackages = [ config.boot.kernelPackages.exfat-nofuse ];
  };

  networking = {
    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    # Per-interface useDHCP will be mandatory in the future, so this generated config
    # replicates the default behaviour.
    useDHCP = false;
    interfaces.enp2s0.useDHCP = true;
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  hardware = {
    bluetooth.enable = true;
    sane.enable = false;
    ledger.enable = true;
    pulseaudio.enable = true;

    opengl = {
      enable = true;
      driSupport32Bit = true;
    };
  };

  services = {
    redshift.enable = true;
    geoclue2.enable = true;
    localtime.enable = true;
    blueman.enable = true;

    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];

      displayManager.defaultSession = "xfce+i3";
      displayManager.lightdm = { enable = true; };

      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };

        gnome.enable = true;
      };

      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        extraPackages = with pkgs; [
          dmenu
          i3status
          i3blocks
        ];
      };
    };

    # Enable CUPS to print documents.
    printing = {
      enable = true;
      drivers = [
        pkgs.gutenprint
        pkgs.gutenprintBin
        pkgs.brlaser
        pkgs.brgenml1lpr
        pkgs.brgenml1cupswrapper
      ];
    };

    avahi = {
      enable = true;
      nssmdns = true;
    };

    # Required for Ledger Live to detect Ledger Nano S via USB
    udev.extraRules = ''
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
  };

  virtualisation.docker.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  nixpkgs.config.allowUnfree = true;

  environment = {
    systemPackages = with pkgs; [
      neo4j
      tree
      htop
      gnumake
      cmake
      python3
      wget
      # neovim needs extra libraries for system clipboard support
      # (neovim.overrideAttrs (oldAttrs: {
      #   buildInputs = (oldAttrs.buildInputs ++ [ pkgs.xorg.libX11 pkgs.xorg.libXt ]);
      # }))
      neovim
      git
      git-lfs
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
      update-resolv-conf
      ledger-live-desktop

      simple-scan
      xorg.xbacklight
      nyxt
    ];

    etc.openvpn.source = "${pkgs.update-resolv-conf}/libexec/openvpn";

    variables = {
      CYPRESS_INSTALL_BINARY = "0";
      CYPRESS_RUN_BINARY = "/home/gerkules/.dotfiles/nix/built-derivations/cypress-4.7.0/bin/Cypress";
    };
  };

  location = {
    latitude = 49.0;
    longitude = 8.0;
  };

  programs.fish.enable = true;

  users = {
    groups = {
      plugdev = {};
      docker = {};
    };

    users.gerkules = {
      isNormalUser = true;
      extraGroups = [ "sudo" "docker" "plugdev" "scanner" "lp" ];
      shell = pkgs.fish;
      initialPassword = "gerkules";
    };
  };

  nix.allowedUsers = ["gerkules"];

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

  # Enable sound.
  sound.enable = true;
}
