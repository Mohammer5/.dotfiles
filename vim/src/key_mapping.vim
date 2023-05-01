" Key mapping {{{
" ========================================================
" ========================================================
" ========================================================

  "* Key mapping -> General {{{
  "* ========================================================

  " leader key
  let mapleader = ","
  let maplocalleader = "\\"
  imap jk <Esc>
  " inoremap <Esc> <Nop>

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

  "* Key mapping -> Clojure(script) helpers {{{
  "* ========================================================

  " Cypress cucumber
  nnoremap <leader>clj :ConjureShadowSelect app<CR>
      
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

  " nnoremap <leader>jf :%!python -m json.tool<Enter>
  nnoremap =j :set ft=json<CR>:%!python -m json.tool<CR>

" }}}

let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-d>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-d>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
