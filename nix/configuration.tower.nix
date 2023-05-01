# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  hostName = "NixOS-Tower";
in {
  imports = [/home/gerkules/.dotfiles/nix/shared.nix];

  networking = {
    hostName = hostName;
  };

  environment = {
    variables = {
      HOSTNAME = hostName;
    };
  };

  services.openssh.enable = true;
  services.openssh.settings.PermitRootLogin = "yes";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

  # services.nginx.enable = true;
  # services.nginx.virtualHosts."my_anki_sync" = {
  #   serverName = "localhost";

  #   listen = [{port = 4000;  addr="0.0.0.0"; ssl = false;}];

  #   locations."/" = {
  #     proxyPass = "http://127.0.0.1:3000";
  #     extraConfig = "proxy_http_version 1.0;"
  #                 + "client_max_body_size 222M;";
  #   };
  # };
}
