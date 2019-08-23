" General {{{
" ========================================================
" ========================================================
" ========================================================

  filetype plugin on

  if &compatible
    set nocompatible
  endif

  " Enable project .vimrc files
  set exrc

" }}}

" Layout {{{
" ========================================================
" ========================================================
" ========================================================

  augroup resize_handling
  autocmd!
  autocmd VimResized * wincmd =
  augroup END

  " Window resizing
  nnoremap <silent> <Space>h 5<C-W><
  nnoremap <silent> <Space>l 5<C-W>>
  nnoremap <silent> <Space>j 5<C-W>+
  nnoremap <silent> <Space>k 5<C-W>-

  " Changing layout -> vertical/horizontal
  nnoremap <silent> <leader>lh <C-w>t<C-w>K<CR>
  nnoremap <silent> <leader>lv <C-w>t<C-w>H<CR>

" }}}

" Folding {{{
" ========================================================
" ========================================================
" ========================================================

  augroup Foldmethod
    autocmd!
    autocmd Syntax vim setlocal foldmethod=marker
    autocmd Syntax scss.css,javascript,javascript.jsx,typescript setlocal foldmethod=indent
  augroup END

  augroup Foldbehavior
    autocmd!
    autocmd Syntax scss.css,javascript,javascript.jsx,typescript setlocal nofoldenable " use `zi` to toggle
  augroup END

" }}}

" Key mapping {{{
" ========================================================
" ========================================================
" ========================================================

  "* Key mapping -> General {{{
  "* ========================================================

  " leader key
  let mapleader = ","
  inoremap jk <Esc>
  inoremap <Esc> <Nop>

  " leave vim
  nnoremap <leader>a :call Wout() <bar> :qa<Enter>

  function! Wout()
    let l:buffers = range(1, bufnr('$'))

    if len(l:buffers)
      execute 'bwipeout' join(l:buffers)
    endif
  endfunction

  "* }}}

  "* Key mapping -> Line handling {{{
  "* ========================================================

  " Moves lines
  nnoremap <M-j> :move +1<CR>
  nnoremap <M-k> :move -2<CR>
  vnoremap <M-j> :m '>+1<CR>gv=gv
  vnoremap <M-k> :m '<-2<CR>gv=gv

  " duplicate line
  nnoremap <leader>d :t.<enter>

  " Append semicolon to EOL
  nnoremap <leader>; :execute "normal! mqA;\<lt>esc>`q"<enter>

  " Copy into current line
  nnoremap <leader>p pkdd

  " Insert new line and stay in normal mode
  nnoremap nl o<esc>
  nnoremap Nl O<esc>

  "* }}}

  "* Key mapping -> Splits & buffers {{{
  "* ========================================================

  set splitbelow
  set splitright

  " Split navigation
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>

  " New splits
  nnoremap <silent> <Space>s :new<Enter>
  nnoremap <silent> <Space>v :vnew<Enter>
  nnoremap <Space>nh :split %:h/
  nnoremap <Space>nv :vsplit %:h/

  " Closing buffers
  nnoremap <BS> :close<Enter>
  nnoremap <leader><BS> :bd<Enter>

  "* }}}

  "* Key mapping -> Search {{{
  "* ========================================================

  " toggle highlight search
  nnoremap <leader>hs :set hlsearch!<Enter>

  " }}}

  "* Key mapping -> Sorting {{{
  "* ========================================================

  " Sort by alphaebet
  vnoremap <leader>sa :sort<CR>

  "" Sort by line length
  vnoremap <leader>sl : ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<CR>

  "* }}}

  "* Key mapping -> Importing {{{
  "* ========================================================

  " Tsuquyoki
  nnoremap <A-Enter> :TsuImport<Enter>

  :" }}}

  "* Key mapping -> surround handlers {{{
  "* ========================================================

  " Delete surrounding html tag
  nnoremap <Space>dt yitvatp

  :" }}}

  "* Key mapping -> Resizing {{{
  "* ========================================================

  " Delete surrounding html tag
  nnoremap <M-S-j> :res +5<CR>
  nnoremap <M-S-k> :res -5<CR>
  nnoremap <M-S-h> :vertical resize -5<CR>
  nnoremap <M-S-l> :vertical resize +5<CR>

  :" }}}

" }}}

" Clipboard {{{
" ========================================================
" ========================================================
" ========================================================

  set clipboard=unnamed

  " paste to clipboard
  vnoremap <leader>y "+y
  nnoremap <leader>Y "+yg
  nnoremap <leader>y "+y

  " paste to clipboard
  nnoremap <leader>p "+p
  nnoremap <leader>P "+P
  vnoremap <leader>p "+p
  vnoremap <leader>P "+P

  " Paste newest buffer in input mode
  inoremap <silent> <C-v> <C-R>*

" }}}

" Indentation {{{
" ========================================================
" ========================================================
" ========================================================

  set autoindent
  set expandtab
  set tabstop=2
  set shiftwidth=2
  set softtabstop=-1
  set nowrap

  " filetype specific rules
  autocmd Filetype sh setlocal ts=2 sw=2 expandtab smarttab
  autocmd Filetype html setlocal ts=2 sw=2 expandtab smarttab
  autocmd Filetype css setlocal ts=2 sw=2 sts=0 expandtab smarttab
  autocmd Filetype scss setlocal ts=2 sw=2 sts=0 expandtab smarttab
  autocmd Filetype jsx setlocal ts=2 sw=2 sts=0 expandtab smarttab
  autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab smarttab
  autocmd Filetype typescript setlocal ts=2 sw=2 sts=0 expandtab smarttab

" }}}

" File types {{{
" ========================================================
" ========================================================
" ========================================================

  augroup file_types
    autocmd!
    autocmd BufNewFile *.vimrc set filetype=vim
  augroup END

" }}}

" Cursor line & Line numbers {{{
" ========================================================
" ========================================================
" ========================================================

  "set cursorcolumn
  "set statusline+=%-10.3n\
  highlight LineNr ctermfg=white

  "* Cursor line {{{
    " Enable CursorLine
    " set cursorline

    " Default Colors for CursorLine
    highlight CursorLine ctermbg=None ctermfg=None

    " Change Color when entering Insert Mode
    autocmd InsertEnter * highlight  CursorLine ctermbg=Black ctermfg=None

    " Revert Color to default when leaving Insert Mode
    autocmd InsertLeave * highlight  CursorLine ctermbg=None ctermfg=None
  "}}}

  "* Line numbers {{{
    set number relativenumber
    nnoremap ln :setlocal relativenumber!<enter>
    augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
    augroup END
  "}}}

" }}}

" Syntax highlighting {{{
" ========================================================
" ========================================================
" ========================================================

  " Matching parentheses
  hi MatchParen cterm=none ctermbg=white ctermfg=black

  syntax enable
  " set background=light
  " colorscheme monokai

" }}}

" File saving {{{
" ========================================================
" ========================================================
" ========================================================

  let g:auto_save = 0
  nnoremap <silent> <Enter> :w<CR>
  nnoremap <silent> <Space><Enter> :Prettier<CR>:w<CR>
  nnoremap <leader><C-s> :call ToggleAutoSave()<CR>

  function! ToggleAutoSave()
    if g:auto_save
      let g:auto_save = 0
    else
      let g:auto_save = 1
    endif
  endfunction

" }}}

" Buffer/Tab line {{{
" ========================================================
" ========================================================
" ========================================================

  set guitablabel=\ %t\ %M

  " Line overlength
  " highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  " match OverLength /\%81v.\+/

" }}}

" Auto-completion {{{
" ========================================================
" ========================================================
" ========================================================

  filetype plugin on
  set omnifunc=syntaxcomplete#Complete

" }}}

" Plugins {{{
" ========================================================
" ========================================================
" ========================================================

  call plug#begin('~/.vim/plugged')

  "* General {{{
    Plug 'Shougo/vimproc.vim', { 'do': 'make' } " REQUIRED!
    Plug 'https://github.com/mhinz/vim-startify'
  "* }}}

  "* Git time tracking {{{
    Plug 'git-time-metric/gtm-vim-plugin'
  "* }}}

  "* Auto completion {{{
    Plug 'Shougo/deoplete.nvim' " Autocomplete + suggestions
    Plug 'Valloric/YouCompleteMe', { 'do': 'python install.py --all' }
    Plug 'mattn/emmet-vim'
  "* }}}

  "* Editor enhancement {{{
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tpope/vim-fugitive' " Git Wrapper
    Plug 'mbbill/undotree'
    Plug 'nathanaelkane/vim-indent-guides'
  "* }}}
        
  "* Editor behaviour {{{
    Plug 'vim-scripts/vim-auto-save'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'wesQ3/vim-windowswap'
  "* }}}
        
  "* File browsing {{{
    Plug 'scrooloose/nerdtree'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
  "* }}}

  "* Gui {{{
    Plug 'altercation/vim-colors-solarized'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'Yggdroot/indentLine'
  "* }}}

  "* Terminal emulations {{{
    Plug 'knubie/vim-kitty-navigator'
  "* }}}

  "* All languages {{{
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'jhkersul/vim-jest-snippets'
    Plug 'terryma/vim-expand-region'
    "Plug 'kien/rainbow_parentheses.vim'
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'scrooloose/nerdcommenter'
    Plug 'prettier/vim-prettier'
    Plug 'editorconfig/editorconfig-vim'
  "* }}}

  "* CSS {{{
    Plug 'ap/vim-css-color'
  "* }}}

  "* SCSS {{{
    Plug 'cakebaker/scss-syntax.vim'
  "* }}}

  "* JavaScript and TypeScript {{{
    Plug 'mxw/vim-jsx', { 'for': [ 'javascript', 'typescript' ] }
  "* }}}

  "* JavaScript {{{
    Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
    Plug 'ternjs/tern_for_vim', { 'do': 'cd ~/.vim/plugged/tern_for_vim/ && npm install', 'for': 'javascript' }
    Plug 'alampros/vim-styled-jsx'
    Plug 'Galooshi/vim-import-js', { 'for': 'javascript' }
  "* }}}

  "* TypeScript {{{
    Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
    Plug 'Quramy/tsuquyomi', { 'for': [ 'javascript', 'typescript' ] }
  "* }}}

  "* @TODO {{{
    " Plug 'vim-rooter'
    " Plug 'mkitt/tabline.vim'
  "* }}}

  call plug#end()

"" }}}

" Plugin config imports {{{
" ========================================================
" ========================================================
" ========================================================

  source $HOME/.dotfiles/vim/src/plugin_config/airline.vim
  source $HOME/.dotfiles/vim/src/plugin_config/ctrlp.vim
  source $HOME/.dotfiles/vim/src/plugin_config/deoplete.vim
  source $HOME/.dotfiles/vim/src/plugin_config/fzf.vim
  source $HOME/.dotfiles/vim/src/plugin_config/nerd_tree.vim
  "source $HOME/.dotfiles/vim/src/plugin_config/rainbow_parentheses.vim
  source $HOME/.dotfiles/vim/src/plugin_config/tsuquyomi.vim
  source $HOME/.dotfiles/vim/src/plugin_config/ultisnips.vim
  source $HOME/.dotfiles/vim/src/plugin_config/you_complete_me.vim
  source $HOME/.dotfiles/vim/src/plugin_config/prettier.vim
  source $HOME/.dotfiles/vim/src/plugin_config/startify.vim

" }}}

" Vim config {{{
" ========================================================
" ========================================================
" ========================================================

  " reload vim config
  nnoremap <leader>+ :so ~/.config/nvim/init.vim<enter>

" }}}

" Disable unsafe commands in project .vimrc files
set secure
