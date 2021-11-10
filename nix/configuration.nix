# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  towerConfig = /home/gerkules/.dotfiles/nix/configuration.tower.nix;
  laptopConfig = /home/gerkules/.dotfiles/nix/configuration.laptop.nix;
in
  (
    if true
      then {
        imports = [
          ./hardware-configuration.nix
          towerConfig
        ];
      }
      else {
        imports = [
          ./hardware-configuration.nix
          laptopConfig
        ];
      }
  )
