{ pkgs }:

let
  vimrc = pkgs.callPackage ./vimrc.nix {};
  plugins = pkgs.callPackage ./plugins.nix {};
in {
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
    tern_for_vim
    vim-sexp
    vim-nix
    vim-tmux-navigator
    typescript-vim
    tsuquyomi
    vim-prettier
    vim-import-js
  ];
}
