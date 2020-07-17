{ pkgs }:

let
  vimrc = pkgs.callPackage ./vimrc.nix {};
  plugins = pkgs.callPackage ./plugins.nix {};
in
{
  customRC = vimrc;
  vam = {
    knownPlugins = pkgs.vimPlugins // plugins;

    pluginDictionaries = [
      { name = "vimproc"; }
      { name = "deoplete-nvim"; }
      { name = "YouCompleteMe"; }
      { name = "emmet-vim"; }
      { name = "undotree"; }
      { name = "nerdtree"; }
      { name = "vim-fugitive"; }
      { name = "vim-indent-guides"; }
      { name = "ferret"; }
      { name = "fzf-vim"; }
      { name = "vim-airline-themes"; }
      { name = "vim-devicons"; }
      { name = "awesome-vim-colorschemes"; }
      { name = "indentLine"; }
      { name = "ultisnips"; }
      { name = "ale"; }
      { name = "vim-snippets"; }
      { name = "vim-expand-region"; }
      { name = "vim-surround"; }
      { name = "auto-pairs"; }
      { name = "nerdcommenter"; }
      { name = "editorconfig-vim"; }
      { name = "vim-css-color"; }
      { name = "vim-jsx-pretty"; }
      { name = "coc-snippets"; }
      { name = "tern_for_vim"; }
      { name = "vim-sexp"; }
      { name = "vim-nix"; }
      { name = "vim-tmux-navigator"; }
      { name = "typescript-vim"; }
      { name = "tsuquyomi"; }

      # CUSTOM BUILT
      { name = "vim-prettier"; }

      ##
      # MISSING IN pkgs.vimPlugins:
      ##

      # prettier/vim-prettier
      # wesQ3/vim-windowswap
      # mortonfox/nerdtree-clip
      # Xuyuanp/nerdtree-git-plugin
      # cakebaker/scss-syntax.vim
      # mxw/vim-jsx
      # jhkersul/vim-jest-snippets
      # pangloss/vim-javascript
      # alampros/vim-styled-jsx
      # Galooshi/vim-import-js
      # jparise/vim-graphql
      # StanAngeloff/php.vim
    ];
  };
}
