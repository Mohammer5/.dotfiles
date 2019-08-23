let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeNodeDelimiter = "\u00a0"

" Start NERDTree
" autocmd VimEnter * NERDTree

" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p

"""""""""""""""
"
" Custom mappings
"
"""""""""""""""

" Open NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

"open a nerdtree when vim starts
" autocmd vimenter * call s:CheckToOpenNERDTree()
" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p

function! s:CheckToOpenNERDTree() abort
    "don't open nerdtree for gitcommits
    if &ft == 'gitcommit' || &ft == 'gitrebase'
        return
    endif

		NERDTree
endfunction
