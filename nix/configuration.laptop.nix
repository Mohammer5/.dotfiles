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
    kernel.sysctl."net.ipv6.conf.eth0.disable_ipv6" = true;

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
 
  # nixpkgs.overlays = [(self: super: {
  #   # ### EXAMPLE {{{
  #   # google-chrome = super.google-chrome.override {
  #   #   commandLineArgs =
  #   #     "--proxy-server='https=127.0.0.1:3128;http=127.0.0.1:3128'";
  #   # };
  #   # ### }}}

  #   neo4j = super.neo4j.overrideAttrs (old: rec {
  #     version = "4.2.3";

  #     src = pkgs.fetchurl {
  #       url = "https://neo4j.com/artifact.php?name=neo4j-community-${version}-unix.tar.gz";
  #       sha256 = "1kk54xhhdakix20sjip5zh8bs35v5kgr2x5jac74n2gddqfxr7ii";
  #     };

  #     installPhase = ''
  #       mkdir -p "$out/share/neo4j"
  #       cp -R * "$out/share/neo4j"
  #       mkdir -p "$out/bin"
  #       ls -als $out/share/neo4j/bin
  #       for NEO4J_SCRIPT in neo4j neo4j-admin neo4j-import cypher-shell
  #       do
  #         makeWrapper "$out/share/neo4j/bin/$NEO4J_SCRIPT" \
  #             "$out/bin/$NEO4J_SCRIPT" \
  #             --prefix PATH : "${pkgs.lib.makeBinPath [ pkgs.jre8 pkgs.which pkgs.gawk ]}" \
  #             --set JAVA_HOME "$jre8"
  #       done
  #     '';
  #   });
  # })];

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

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
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

  environment.etc.openvpn.source = "${pkgs.update-resolv-conf}/libexec/openvpn";

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

    # openvpn.servers = {
    #   frankfurt1 = { config = '' /home/gerkules/.dotfiles/nix/opvn-files/my_expressvpn_germany_-_frankfurt_-_1_udp.ovpn ''; };
    #   philippines = { config = '' /home/gerkules/.dotfiles/nix/opvn-files/my_expressvpn_philippines_udp.ovpn ''; };
    #   usa-nj3 = { config = '' /home/gerkules/.dotfiles/nix/opvn-files/my_expressvpn_usa_-_new_jersey_-_3_udp.ovpn ''; };
    #   vietnm = { config = '' /home/gerkules/.dotfiles/nix/opvn-files/my_expressvpn_vietnam_udp.ovpn ''; };
    # };
  };

  programs.fish.enable = true;

  environment.variables = {
    CYPRESS_INSTALL_BINARY = "0";
    CYPRESS_RUN_BINARY = "/home/gerkules/.dotfiles/nix/built-derivations/cypress-4.7.0/bin/Cypress";
    NIXOS_CONFIG = "/home/gerkules/.dotfiles/nix/configuration.laptop.nix";
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

  hardware.ledger.enable = true;

  # Required for Ledger Live to detect Ledger Nano S via USB
  # services.udev.extraRules = ''
  #   # firmware 1.6.0+
  #   SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="1b7c", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
  #   SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="2b7c", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
  #   SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="3b7c", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
  #   SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="4b7c", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
  #   SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="1807", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
  #   SUBSYSTEMS=="usb", ATTRS{idVendor}=="2581", ATTRS{idProduct}=="1808", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
  #   SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0000", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
  #   SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0001", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
  #   SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="0004", MODE="0660", TAG+="uaccess", TAG+="udev-acl"
  #   SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="1011", MODE="0660", GROUP="plugdev"
  #   SUBSYSTEMS=="usb", ATTRS{idVendor}=="2c97", ATTRS{idProduct}=="1015", MODE="0660", GROUP="plugdev"

  #   # Rule for all ZSA keyboards
  #   SUBSYSTEM=="usb", ATTR{idVendor}=="3297", GROUP="plugdev"
  #   # Rule for the Moonlander
  #   SUBSYSTEM=="usb", ATTR{idVendor}=="3297", ATTR{idProduct}=="1969", GROUP="plugdev"
  # '';

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [
    pkgs.gutenprint
    pkgs.gutenprintBin
    pkgs.brlaser
    pkgs.brgenml1lpr
    pkgs.brgenml1cupswrapper
  ];
  services.avahi.enable = true;
  services.avahi.nssmdns = true;

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
