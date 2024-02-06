{ config, pkgs, ... }:
let
  # neovim = pkgs.callPackage ./vim/neovim.nix {};
  vimrc = pkgs.callPackage ./vim/vimrc.nix {};
  plugins = pkgs.callPackage ./vim/plugins.nix {};
  homeDirectory = "/home/gerkules";
  configDirectory = builtins.toString ./.;
in {
  nixpkgs.config.allowUnfree = true;

  programs = {
    home-manager.enable = true;
    bash.shellAliases = import ./modules/shell-aliases.nix;
    git = {
      enable = true;
      ignores = import ./git/gitignore_global.nix;
    };
  };

  home = {
    username = "gerkules";
    homeDirectory = homeDirectory;

    pointerCursor = {
      x11.enable = true;
      name = "DMZ-White";
      package = pkgs.vanilla-dmz;
      size = 40;
      gtk.enable = true;
    };

    file = {
      ".config/i3/config".source = config.lib.file.mkOutOfStoreSymlink "${configDirectory}/i3wm/config";
      ".config/kitty/kitty.conf".source = config.lib.file.mkOutOfStoreSymlink "${configDirectory}/kitty/kitty.conf";
      ".gitconfig".source = config.lib.file.mkOutOfStoreSymlink "${configDirectory}/git/.gitconfig";
      ".config/fish/config.fish".source = config.lib.file.mkOutOfStoreSymlink "${configDirectory}/fish/config.fish";
      ".config/kitty/pass_keys.py".text = builtins.readFile(builtins.fetchurl {
        url = "https://raw.githubusercontent.com/knubie/vim-kitty-navigator/20abf8613aa228a5def1ae02cd9da0f2d210352a/pass_keys.py";
      });
      ".config/kitty/get_layout.py".text = builtins.readFile(builtins.fetchurl {
        url = "https://raw.githubusercontent.com/knubie/vim-kitty-navigator/20abf8613aa228a5def1ae02cd9da0f2d210352a/get_layout.py";
      });
    };

    packages = with pkgs; [
      brave
      kanshi
      chromium
      firefox
      tdesktop
      kitty
      unzip
      slack
      # teams
      logseq
      ledger-live-desktop
      google-chrome
      peek
      silver-searcher
      flameshot
      feh
      libnotify
      zoom-us
      spotify
      vlc
      zip
      transmission
    ];

    stateVersion = "23.11";
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  
    extraConfig = vimrc;
  
    plugins = with pkgs.vimPlugins // plugins; [
    # plugins = with pkgs.vimPlugins; [
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
      vim-kitty-navigator
      conjure
  
      # cypher-vim-syntax
      # # vim-prettier
      # vim-import-js
      # vim-javascript
      # vim-windowswap
      # # nerdtree-clip
      # nerdtree-git-plugin
      # scss-syntax
      # # vim-jsx
      # # vim-jest-snippets
      # # vim-styled-jsx
      # php-vim
      # vim-kitty-navigator-custom
    ];
  };

  wayland.windowManager.sway = {
    enable = true;
    config.modifier = "Mod4";
    config.output."eDP-1".mode = "3072x1920@60Hz";
    config.output."DP-1".mode = "1920x1080@60Hz";
    extraConfig = ''
      output eDP-2 resolution 3072x1920 position 0 0
      output DP-1 resolution 1920x1080 position -1920 0
    '';
  };

}
#; { config, lib, pkgs, ... }:
#; 
#; let
#; 
#;   # kaktree = pkgs.kakouneUtils.buildKakounePluginFrom2Nix {
#;   #   pname = "kaktree";
#;   #   version = "2023-05-03";
#;   #   src = pkgs.fetchFromGitHub {
#;   #     owner = "andreyorst";
#;   #     repo = "kaktree";
#;   #     rev = "acd47e0c8549afe1634a79a5bbd6d883daa8ba0a";
#;   #     sha256 = "9wiJFVxm+xZndUUpqrQ9eld/Df3wcp7gFDZTdInGPQQ=";
#;   #   };
#;   #   meta.homepage = "https://github.com/andreyorst/kaktree/";
#;   # };
#; 
#;   # kakouneConfig = builtins.readFile "${config.home.homeDirectory}/.dotfiles/kakoune/kakrc";
#; in {
#;   # Let Home Manager install and manage itself.
#;   programs.home-manager.enable = true;
#;   manual.manpages.enable = false;
#; 
#;   home = {
#;     username = "gerkules";
#;     homeDirectory = "/home/gerkules";
#; 
#;     file = {
#;       # ".config/i3/config".source = config.lib.file.mkOutOfStoreSymlink "${configDirectory}/configs/i3wm";
#;       # ".bashrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/bashrc/bashrc";
#;       # # ".config/kak/autoload/config.kak".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/kakoune/config.kak";
#;     };
#; 
#;     packages = with pkgs; [
#;       # system stuff
#;       #; rofi
#;       #; silver-searcher
#;       #; flameshot
#;       #; ranger
#;       #; feh
#;       #; ffmpeg
#;       #; lf
#;       #; ripgrep
#;       #; audacity
#;       #; wirelesstools
#;       #; rpi-imager
#;       #; pcmanfm
#;       #; #libnotify
#; 
#;       #; veracrypt
#;       #; logseq
#;       #; calibre
#;       #; brave
#;       #; skypeforlinux
#;       #; ledger-live-desktop
#;       #; google-chrome
#;       #; unzip
#;       #; peek
#;       #; cryptsetup
#;       #; tor-browser-bundle-bin
#; 
#;       # messengers & online conference
#;       #; tdesktop
#;       #; slack
#;       #; zoom-us
#;       #; teams
#;       #; anbox
#; 
#;       #; music
#;       #; (spotify.override { version = "1.1.46.916.g416cacf1"; })
#;       #; spotify
#; 
#;       #; # node development
#;       #; sublime3
#;       #; nodejs
#;       #; yarn
#;       #; # nodejs-16_x
#;       #; # https://github.com/NixOS/nixpkgs/issues/53820
#;       #; # (yarn.override { nodejs = nodejs-16_x; })
#;       #; # For remotedev-server for node redux scripts
#;       #; # gcc-wrapper
#;       #; pkgsCypressOld.cypress
#;       #; # vscode
#; 
#;       #; transmission
#;       #; vlc
#;       #; zip
#;       #; #texlive
#;       #; steam-run
#; 
#;       #; # appimage-run
#;       #; # avahi
#;       #; binutils
#;       #; # clojure
#;       #; # cypress
#;       #; # dpkg
#;       #; # exfat
#;       #; # gcc-wrapper
#;       #; # gconf
#;       #; # geoclue
#;       #; # gparted
#;       #; # # gtk+
#;       #; # heroku
#;       #; # home-manager-path
#;       #; # leiningen
#;       #; # nmap
#;       #; # nss
#;       #; # octave
#;       #; # patchelf
#;       #; # playonlinux
#;       #; # system-config-printer
#;       #; # woeusb
#;     ];
#; 
#;     # This value determines the Home Manager release that your
#;     # configuration is compatible with. This helps avoid breakage
#;     # when a new Home Manager release introduces backwards
#;     # incompatible changes.
#;     #
#;     # You can update Home Manager without changing this value. See
#;     # the Home Manager release notes for a list of state version
#;     # changes in each release.
#;     stateVersion = "20.09";
#;   };
#; 
#;   ####################################
#;   #
#;   # Kakoune
#;   #
#;   ####################################
#;   # programs = {
#;   #   kakoune = {
#;   #     enable = true;
#;   #     extraConfig = kakouneConfig;
#;   #     plugins = [kaktree];
#;   #   };
#;   # };
#; 
#;   ####################################
#;   #
#;   # Other programs
#;   #
#;   ####################################
#;   programs = {
#;     # vscode = {
#;     #   enable = true;
#;     #   package = pkgs.vscodium;
#;     #   extensions = with pkgs.vscode-extensions; [
#;     #     dracula-theme.theme-dracula
#;     #     vscodevim.vim
#;     #     yzhang.markdown-all-in-one
#;     #     betterthantomorrow.calva
#;     #     ms-vsliveshare.vsliveshare
#;     #   ];
#;     # };
#; 
#;     neovim = {
#;       enable = true;
#;       viAlias = true;
#;       vimAlias = true;
#; 
#;       # extraConfig = vimrc;
#; 
#;       # plugins = with pkgs.vimPlugins // plugins; [
#;       # plugins = with pkgs.vimPlugins; [
#;       #   vimproc
#;       #   deoplete-nvim
#;       #   YouCompleteMe
#;       #   emmet-vim
#;       #   undotree
#;       #   nerdtree
#;       #   vim-fugitive
#;       #   vim-indent-guides
#;       #   ferret
#;       #   fzf-vim
#;       #   vim-airline-themes
#;       #   vim-devicons
#;       #   awesome-vim-colorschemes
#;       #   # indentLine
#;       #   ultisnips
#;       #   ale
#;       #   vim-snippets
#;       #   vim-expand-region
#;       #   vim-surround
#;       #   auto-pairs
#;       #   nerdcommenter
#;       #   editorconfig-vim
#;       #   vim-css-color
#;       #   vim-jsx-pretty
#;       #   coc-snippets
#;       #   # tern_for_vim
#;       #   vim-sexp
#;       #   vim-nix
#;       #   vim-tmux-navigator
#;       #   typescript-vim
#;       #   tsuquyomi
#;       #   vim-graphql
#; 
#;       #   # cypher-vim-syntax
#;       #   # # vim-prettier
#;       #   # vim-import-js
#;       #   # vim-javascript
#;       #   # vim-windowswap
#;       #   # # nerdtree-clip
#;       #   # nerdtree-git-plugin
#;       #   # scss-syntax
#;       #   # # vim-jsx
#;       #   # # vim-jest-snippets
#;       #   # # vim-styled-jsx
#;       #   # php-vim
#;       #   # vim-kitty-navigator-custom
#;       #   # conjure
#;       # ];
#;     };
#;   };
#; }
