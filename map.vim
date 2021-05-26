" Key mapping
let mapleader = "\\"
nnoremap <silent> <leader>c :call Compile()<cr>
inoremap <silent> <leader>c <esc>:call Compile()<cr>
nnoremap <silent> <tab> :set rnu!<cr>
nnoremap <silent> <leader>w :w<cr>
inoremap <silent> <leader>w <esc>:w<cr>
vnoremap <silent> <c-c> "+y
inoremap <silent> <c-v> <esc>"+pa
nmap <silent> <c-a> v<c-a>
vnoremap <silent> <c-a> <esc>:call ExtendSelection()<cr>

" Abbreviations
cnoreabbrev w!! w !sudo tee > /dev/null %
cnoreabbrev Vert vert
