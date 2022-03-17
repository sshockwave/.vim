" Key mapping
let mapleader = "\\"
nnoremap <silent> <leader>c :call Compile()<cr>
inoremap <silent> <leader>c <esc>:call Compile()<cr>
nnoremap <silent> <tab> :set rnu!<cr>
nnoremap <silent> <leader>w :w<cr>
inoremap <silent> <leader>w <esc>:w<cr>

"""""""""""""""""""""""""
" Windows-like operations
" See mswin.vim
"""""""""""""""""""""""""
if has("clipboard")
    " CTRL-X is cut
    vnoremap <c-x> "+x
    " CTRL-C is copy
    vnoremap <c-c> "+y
    " CTRL-V is Paste
    cnoremap <c-v> <c-r>+
    exe 'inoremap <script> <c-v> <c-g>u' . paste#paste_cmd['i']
    exe 'vnoremap <script> <c-v> ' . paste#paste_cmd['v']
endif

" Use CTRL-S for saving, also in Insert mode 
noremap <c-s> :update<cr>
vnoremap <c-s> <c-c>:update<cr>
inoremap <c-s> <esc>:update<cr>gi

" Select all shortcuts
nmap <silent> <c-a> v<c-a>
vnoremap <silent> <c-a> <esc>:call ExtendSelection()<cr>
"""""""""""""""""""""""""

" Abbreviations
cnoreabbrev w!! w !sudo tee > /dev/null %
cnoreabbrev Vert vert
