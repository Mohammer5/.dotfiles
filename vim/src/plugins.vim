call plug#begin('~/.vim/plugged')

Plug 'Shougo/vimproc.vim', { 'do': 'make' } " REQUIRED!
Plug 'Shougo/deoplete.nvim' " Autocomplete + suggestions
Plug 'Valloric/YouCompleteMe', { 'do': 'python install.py --all' }
Plug 'mattn/emmet-vim', { 'for': [ 'html', 'jsx', 'tsx' ] }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive' " Git Wrapper
Plug 'mbbill/undotree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'wincent/ferret' " Search & replace
Plug 'mortonfox/nerdtree-clip'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wesQ3/vim-windowswap'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'Yggdroot/indentLine'
Plug 'SirVer/ultisnips', { 'for': [ 'javascript', 'typescript' ] }
Plug 'w0rp/ale', { 'for': [ 'javascript', 'typescript' ] }
Plug 'honza/vim-snippets'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'prettier/vim-prettier'
Plug 'editorconfig/editorconfig-vim'
Plug 'ap/vim-css-color', { 'for': [ 'css' ] }
Plug 'cakebaker/scss-syntax.vim', { 'for': [ 'scss' ] }
Plug 'mxw/vim-jsx', { 'for': [ 'javascript', 'typescript' ] }
Plug 'jhkersul/vim-jest-snippets'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'ternjs/tern_for_vim', { 'do': 'cd ~/.vim/plugged/tern_for_vim/ && npm install', 'for': 'javascript' }
Plug 'alampros/vim-styled-jsx'
Plug 'Galooshi/vim-import-js', { 'for': 'javascript' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'Quramy/tsuquyomi', { 'for': [ 'javascript', 'typescript' ] }
Plug 'guns/vim-sexp', { 'for': [ 'clojure' ] }
Plug 'jparise/vim-graphql'
Plug 'StanAngeloff/php.vim'
Plug 'LnL7/vim-nix'

"* @TODO {{{
" Plug 'vim-rooter'
" Plug 'mkitt/tabline.vim'
"* }}}

call plug#end()
