{ config, lib, pkgs, ... }:

let
  # neovim = pkgs.callPackage ../vim/neovim.nix {};
  vimrc = pkgs.callPackage ../vim/vimrc.nix {};
  plugins = pkgs.callPackage ../vim/plugins.nix {};
  pkgsCypressOld = import (builtins.fetchGit {
     # Descriptive name to make the store path easier to identify                
     name = "Cypress-9.6.0-pkgs";                                                 
     url = "https://github.com/NixOS/nixpkgs/";                       
     ref = "refs/heads/nixpkgs-unstable";                     
     rev = "bf972dc380f36a3bf83db052380e55f0eaa7dcb6";                                           
  }) {};
in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  manual.manpages.enable = false;

  home = {
    username = "gerkules";
    homeDirectory = "/home/gerkules";

    packages = with pkgs; [
      nmap
      wirelesstools
      rpi-imager
      pcmanfm
      teams
      veracrypt
      logseq
      calibre
      brave
      skypeforlinux
      ledger-live-desktop
      google-chrome
      python2
      unzip
      peek
      cryptsetup
      tor-browser-bundle-bin
      audacity

      # system stuff
      rofi
      silver-searcher
      flameshot
      ranger
      feh
      libnotify

      # messengers & online conference
      ## tdesktop
      slack
      zoom-us

      # music
      # (spotify.override { version = "1.1.46.916.g416cacf1"; })
      spotify

      # node development
      nodejs-16_x
      # https://github.com/NixOS/nixpkgs/issues/53820
      (yarn.override { nodejs = nodejs-16_x; })
      # For remotedev-server for node redux scripts
      # gcc-wrapper
      pkgsCypressOld.cypress
      # vscode

      transmission
      vlc
      zip
      #texlive
      steam-run
      #brave

      # appimage-run
      # avahi
      binutils
      # brave
      # clojure
      # cypress
      # dpkg
      # exfat
      # gcc-wrapper
      # gconf
      # geoclue
      # gparted
      # # gtk+
      # heroku
      # home-manager-path
      # leiningen
      # libnotify
      # nmap
      # nss
      # octave
      # patchelf
      # playonlinux
      # system-config-printer
      # woeusb
    ];

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "20.09";
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraConfig = vimrc;

    plugins = with pkgs.vimPlugins // plugins; [
      vimproc
      deoplete-nvim
      YouCompleteMe
      emmet-vim
      undotree
      nerdtree
      vim-fugitive
      vim-indent-guides
      ferret
      fzf-vim
      vim-airline-themes
      vim-devicons
      awesome-vim-colorschemes
      indentLine
      ultisnips
      ale
      vim-snippets
      vim-expand-region
      vim-surround
      auto-pairs
      nerdcommenter
      editorconfig-vim
      vim-css-color
      vim-jsx-pretty
      coc-snippets
      # tern_for_vim
      vim-sexp
      # vim-fireplace
      conjure
      vim-nix
      vim-tmux-navigator
      typescript-vim
      tsuquyomi
      vim-graphql
      vim-visual-multi

      cypher-vim-syntax
      # vim-prettier
      vim-import-js
      vim-javascript
      vim-windowswap
      # nerdtree-clip
      nerdtree-git-plugin
      scss-syntax
      # vim-jsx
      # vim-jest-snippets
      # vim-styled-jsx
      php-vim
    ];
  };
}
