# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  boot = {
    # Use the systemd-boot EFI boot loader.
    loader.grub = {
      efiSupport = true;
      enable = true;
      version = 2;
      devices = [ "nodev" ];
      useOSProber = true;
    };

    loader.efi.canTouchEfiVariables = true;

    # loader = {
    #   systemd-boot.enable = true;
    #   efi.canTouchEfiVariables = true;
    # };

    # support exfat filesystem
    # extraModulePackages = [ config.boot.kernelPackages.exfat-nofuse ];
  };

  fileSystems = {
    "/shared" = {
      device = "/dev/disk/by-uuid/95fabef7-c85a-408e-9fa7-9745d3d3c16b";
    };
  };

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s25.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;
  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;


  # Enable the GNOME 3 Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome3.enable = true;

  services.xserver = {
    enable = true;
    # videoDrivers = [ "nvidia" ];

    displayManager.defaultSession = "xfce+i3";
    displayManager.lightdm = {
      enable = true;
    };

    # desktopManager.gnome3.enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };

      gnome3.enable = true;
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
  };

  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
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

  programs.fish.enable = true;

  environment.variables = {
    CYPRESS_INSTALL_BINARY = "0";
    CYPRESS_RUN_BINARY = "/home/gerkules/.dotfiles/nix/built-derivations/cypress-4.7.0/bin/Cypress";
  };

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

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.jane = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  # };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   wget vim
  #   firefox
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}
