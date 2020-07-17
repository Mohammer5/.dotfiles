{ config, pkgs, ... }:

let
  #neovim = pkgs.callPackage ../vim/neovim.nix {};
  vimrc = pkgs.callPackage ../vim/vimrc.nix {};
  plugins = pkgs.callPackage ../vim/plugins.nix {};
in {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;

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
      spotify

      # node development
      nodejs-13_x
      yarn
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
      nerdtree-git-plugin
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
