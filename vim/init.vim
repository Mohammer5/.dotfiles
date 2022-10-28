" General {{{
" ========================================================
" ========================================================
" ========================================================

  filetype plugin indent on

  if &compatible
    set nocompatible
  endif

  " Enable project .vimrc files
  set exrc

" }}}

" Text behavior {{{
" ========================================================
" ========================================================
" ========================================================

  augroup TextWrapMarkdown
    autocmd!
    autocmd Syntax markdown setlocal wrap linebreak nolist
    autocmd Syntax markdown setlocal tw=79 fo+=t
  augroup END

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
  nnoremap <silent> <Space>lh <C-w>t<C-w>K<CR>
  nnoremap <silent> <Space>lv <C-w>t<C-w>H<CR>

" }}}

" Folding {{{
" ========================================================
" ========================================================
" ========================================================

  augroup Foldmethod
    autocmd!
    autocmd Syntax vim setlocal foldmethod=marker
    autocmd Syntax markdown setlocal foldmethod=marker
    autocmd Syntax scss.css setlocal foldmethod=indent
    autocmd Syntax javascript.jsx setlocal foldmethod=indent
    "autocmd Syntax scss.css,javascript,javascript.jsx,typescript setlocal foldmethod=indent
  augroup END

  augroup Foldbehavior
    autocmd!
    autocmd Syntax scss.css setlocal nofoldenable " use `zi` to toggle
    "autocmd Syntax scss.css,javascript,javascript.jsx,typescript setlocal nofoldenable " use `zi` to toggle
  augroup END

  augroup FoldJS
    autocmd!
    autocmd Syntax javascript,jsx,javascript.jsx,javascriptreact,typescript setlocal foldmethod=syntax
    autocmd Syntax javascript,jsx,javascript.jsx,javascriptreact,typescript setlocal foldcolumn=1 "defines 1 col at window left, to indicate folding
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

  "* Key mapping -> Text navigation {{{
  "* ========================================================

  " Jumping to start of line
  nnoremap <space>0 ^

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

  "* Key mapping -> Search & Replace {{{
  "* ========================================================

  " toggle highlight search
  nnoremap <leader>hs :set hlsearch!<Enter>

  function! RenamerNerdTree()
    :silent call NERDTreeClipPath()
    let reg = getreg()
    ":echo reg
    :execute "Renamer" reg
  endfunction

  " }}}

  "* Key mapping -> Sorting {{{
  "* ========================================================

  " Sort by alphaebet
  vnoremap <leader>sa :sort<CR>

  "" Sort by line length
  vnoremap <leader>sl : ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<CR>

  "* }}}

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

  "* Key mapping -> Copy and pasting {{{
  "* ========================================================

  " Delete surrounding html tag
  nnoremap <leader>v "_dP
  vnoremap <C-v> "_dP

  function! CopyCurrentBufferPath()
    :redir @+
    :silent echo expand("%")
    :redir END
  endfunction
  
  nnoremap <silent> <space>yp :call CopyCurrentBufferPath()<CR>

  :" }}}

  "* Key mapping -> Javascript helpers {{{
  "* ========================================================

  " Cypress cucumber
  nnoremap <space>given 0c$Given('', () => {})<esc>
  nnoremap <space>when 0c$When('', () => {})<esc>
  nnoremap <space>then 0c$Then('', () => {})<esc>
      
  :" }}}

  "* Key mapping -> DHIS2 helpers {{{
  "* ========================================================

  function! D2StyleApplyToCurrentBuffer()
    let bufferPath = expand("%")
    echo "npx" "d2-style" "js" "apply"  bufferPath

    ! "pwd"
    ! "npx" "d2-style" "js" "apply"  bufferPath
  endfunction
  
  :command! D2style call D2StyleApplyToCurrentBuffer()
      
  " }}}

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
  "* }}}

  "* Auto completion {{{
    "+ deoplete {{{
      Plug 'Shougo/deoplete.nvim' " Autocomplete + suggestions

      inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
      inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
    "}}}

    "+ YouCompleteMe {{{
      " Plug 'Valloric/YouCompleteMe', { 'do': 'python install.py --all' }

      " set completeopt-=preview
    "}}}

    Plug 'mattn/emmet-vim', { 'for': [ 'html', 'jsx', 'tsx' ] }
  "* }}}

  "* Editor enhancement {{{
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tpope/vim-fugitive' " Git Wrapper
    Plug 'mbbill/undotree'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'wincent/ferret' " Search & replace
    Plug 'mortonfox/nerdtree-clip'
  "* }}}
        
  "* Editor behaviour {{{
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'wesQ3/vim-windowswap'
  "* }}}
        
  "* File browsing {{{
    "+ nerdtree {{{
      Plug 'scrooloose/nerdtree'

      let NERDTreeShowHidden=1
      let NERDTreeMinimalUI = 1
      let NERDTreeDirArrows = 1
      let NERDTreeAutoDeleteBuffer = 1
      let g:NERDTreeNodeDelimiter = "\u00a0"

      """""""""""""""
      "
      " Custom mappings
      "
      """""""""""""""

      " Open NERDTree
      nnoremap <C-n> :NERDTreeToggle<CR>
      nnoremap <Space>ntf :NERDTreeFind<CR>

      "open a nerdtree when vim starts
      " autocmd vimenter * call s:CheckToOpenNERDTree()

      function! s:CheckToOpenNERDTree() abort
        "don't open nerdtree for gitcommits
        if &ft == 'gitcommit' || &ft == 'gitrebase'
          return
        endif

        NERDTree
      endfunction
    "}}}

    "+ fzf {{{
      Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
      Plug 'junegunn/fzf.vim'

      let g:fzf_buffers_jump = 1

      nnoremap <silent> <Space><Space> :Buffers<enter>
      nnoremap <silent> <Space>t :Ag<enter>
      nnoremap <silent> <Space>T :Agf<enter>
      nnoremap <silent> <Space>f :Files<enter>

      " Make :Ag search content only and ignore file names
      command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
      command! -bang -nargs=* Agf call fzf#vim#ag(<q-args>, {}, <bang>0)

      nnoremap <Space>s :call AgUnderCursor()<Enter>
      nnoremap <Space>S :call AgfUnderCursor()<Enter>

      fu! AgUnderCursor()
        let wordUnderCursor = expand("<cword>")

        if len(wordUnderCursor) > 0
          execute printf(':Ag %s', wordUnderCursor)
        else
          echo "No word under cursor"
        endif
      endfu

      fu! AgfUnderCursor()
        let wordUnderCursor = expand("<cword>")

        if len(wordUnderCursor) > 0
          execute printf(':Agf %s', wordUnderCursor)
        else
          echo "No word under cursor"
        endif
      endfu
    "}}}
  "* }}}

  "* Gui {{{
    "+ vim-airline {{{
      " Plug 'vim-airline/vim-airline'

      " let g:airline_theme='term'
      " let g:airline#extensions#tabline#enabled = 1
      " let g:airline#extensions#tabline#buffer_nr_show = 1
      " let g:airline#extensions#branch#enabled = 0
      " let g:airline#extensions#tabline#fnamemod = ':t'
      " let g:airline_powerline_fonts = 1
    "}}}

    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'rafi/awesome-vim-colorschemes'

    "+ indentLine {{{
      Plug 'Yggdroot/indentLine'

      "- config {{{
        let g:indentLine_char_list = ['2', '3', '4', '5', '6', '7', '8', '9', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
      "}}}
    "}}}

  "* }}}

  "* All languages {{{
    "+ ultisnips {{{
      Plug 'SirVer/ultisnips', { 'for': [ 'javascript', 'typescript' ] }

      "- config {{{
        " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
        let g:UltiSnipsExpandTrigger="<c-space>"
        let g:UltiSnipsJumpForwardTrigger="<c-b>"
        let g:UltiSnipsJumpBackwardTrigger="<c-z>"

        " If you want :UltiSnipsEdit to split your window.
        let g:UltiSnipsEditSplit="vertical"
      "}}}
    "}}}
    
    "+ ale {{{
      Plug 'w0rp/ale', { 'for': [ 'javascript', 'typescript' ] }

      "- config {{{
        let g:ale_fixers = {}
        let g:ale_fixers.javascript = ['eslint']
        let g:ale_fix_on_save = 1
      "}}}
    "}}}

    Plug 'honza/vim-snippets'
    Plug 'terryma/vim-expand-region'
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'scrooloose/nerdcommenter'

    "+ prettier {{{
      Plug 'prettier/vim-prettier'

      let g:prettier#autoformat = 0
      let g:prettier#config#single_quote = 'true'
      let g:prettier#config#config_precedence = 'file-override'
    "}}}

    Plug 'editorconfig/editorconfig-vim'
  "* }}}

  "* CSS {{{
    Plug 'ap/vim-css-color', { 'for': [ 'css' ] }
  "* }}}

  "* SCSS {{{
    Plug 'cakebaker/scss-syntax.vim', { 'for': [ 'scss' ] }
  "* }}}

  "* JavaScript and TypeScript {{{
    Plug 'mxw/vim-jsx', { 'for': [ 'javascript', 'typescript' ] }
    Plug 'jhkersul/vim-jest-snippets'
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

  "* Clojure {{{
    Plug 'guns/vim-sexp', { 'for': [ 'clojure' ] }
    Plug 'jparise/vim-graphql'
  "* }}}

  "* PHP {{{
    Plug 'StanAngeloff/php.vim'
  "* }}}

  "* Nix {{{
    Plug 'LnL7/vim-nix'
  "* }}}

  "* @TODO {{{
    " Plug 'vim-rooter'
    " Plug 'mkitt/tabline.vim'
  "* }}}

  call plug#end()

" }}}

" Vim config {{{
" ========================================================
" ========================================================
" ========================================================

  " reload vim config
  nnoremap <leader>+ :so ~/.config/nvim/init.vim<enter>

" }}}

" Syntax highlighting {{{
" ========================================================
" ========================================================
" ========================================================

  " Matching parentheses
  hi MatchParen cterm=none ctermbg=white ctermfg=black

  syntax enable
  # set termguicolors
  set background=dark

  "set background=light
  "colorscheme monokai
  "colorscheme solarized8
  colorscheme gruvbox

  "let ayucolor="dark"
  "colorscheme ayu

  " }}}

" Disable unsafe commands in project .vimrc files
set secure
