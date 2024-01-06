{ options, config, pkgs, ... }: {
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        efiSupport = true;
        enable = true;
        devices = [ "nodev" ];
        useOSProber = true;
      };
    };
  };

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  fonts.packages = with pkgs; [
    dejavu_fonts
  ];

  programs.bash.shellAliases = import ./modules/shell-aliases.nix;
  programs.fish.enable = true;
  programs.fish.shellAliases = import ./modules/shell-aliases.nix;

  users.users.gerkules = {
    isNormalUser = true;
    description = "Gerkules";
    extraGroups = [ "audio" "networkmanager" "wheel" "docker" "plugdev" "scanner" "lp" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };

  virtualisation.docker.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;
  hardware.bluetooth.enable = true;
  hardware.enableAllFirmware  = true;
  nixpkgs.config.permittedInsecurePackages = ["electron-13.6.9"];
}
