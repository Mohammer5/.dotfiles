{ config, pkgs, ... }:

let
  # neovim = pkgs.callPackage ../vim/neovim.nix {};
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

    file = {
      ".bashrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/bashrc/bashrc";
      ".gitconfig".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/git/.gitconfig";
      ".config/fish/config.fish".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/fish/config.fish";
      ".config/i3/config".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/i3wm/config";
      ".config/kitty/kitty.conf".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/kitty/kitty.conf";
    };

    packages = with pkgs; [
      audacity
      calibre
      # brave
      skypeforlinux
      ledger-live-desktop
      google-chrome
      python2
      unzip
      peek
      cryptsetup
      tor-browser-bundle-bin
      openjdk11
      youtube-dl

      # system stuff
      rofi
      silver-searcher
      flameshot
      ranger
      feh
      ffmpeg

      # messengers & online conference
      teams
      tdesktop
      slack
      zoom-us

      # music
      # (spotify.override { version = "1.1.46.916.g416cacf1"; })
      spotify

      # node development
      sublime3
      nodejs-16_x
      # https://github.com/NixOS/nixpkgs/issues/53820
      (yarn.override { nodejs = nodejs-16_x; })
      # For remotedev-server for node redux scripts
      # gcc-wrapper
      cypress
      # vscode

      transmission
      vlc
      zip
      #texlive
      # steam-run

      # appimage-run
      # avahi
      binutils
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

  programs = {
    # fish = {
    #   enable = true;
    # };

    vscode = {
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        dracula-theme.theme-dracula
        vscodevim.vim
        yzhang.markdown-all-in-one
        betterthantomorrow.calva
        ms-vsliveshare.vsliveshare
      ];
    };

    neovim = {
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
        # indentLine
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
        vim-graphql

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
        vim-kitty-navigator-custom
      ];
    };
  };

}
