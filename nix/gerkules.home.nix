{ config, pkgs, ... }:

let
  #neovim = pkgs.callPackage ../vim/neovim.nix {};
  vimrc = pkgs.callPackage ../vim/vimrc.nix {};
  plugins = pkgs.callPackage ../vim/plugins.nix {};
in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

  manual.manpages.enable = false;

  home = {
    username = "gerkules";
    homeDirectory = "/home/gerkules";

    packages = with pkgs; [
      cryptsetup
      tor-browser-bundle-bin

      # system stuff
      rofi
      silver-searcher
      flameshot
      ranger
      feh

      # messengers & online conference
      tdesktop
      slack
      zoom-us

      # music
      # (spotify.override { version = "1.1.46.916.g416cacf1"; })
      spotify

      # node development
      nodejs-14_x
      # https://github.com/NixOS/nixpkgs/issues/53820
      (yarn.override { nodejs = nodejs-14_x; })
      # For remotedev-server for node redux scripts
      # gcc-wrapper

      transmission
      vlc
      zip
      #texlive
      steam-run
      #brave
      #wally-cli

      # appimage-run
      # avahi
      # binutils
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
      vim-nix
      vim-tmux-navigator
      typescript-vim
      tsuquyomi

      vim-prettier
      vim-windowswap
      nerdtree-clip
      #nerdtree-git-plugin
      scss-syntax
      #vim-jsx
      vim-jest-snippets
      vim-javascript
      vim-styled-jsx
      vim-import-js
      vim-graphql
      php-vim
    ];
  };
}
