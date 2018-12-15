" Key mapping
let mapleader = "\\"
nnoremap <silent> <leader><leader> :call Compile()<cr>
inoremap <silent> <leader><leader> <esc>:call Compile()<cr>
nnoremap <silent> <tab> :set rnu!<cr>
nnoremap <silent> <space> :w<cr>

" Abbreviations
cnoreabbrev w!! w !sudo tee > /dev/null %
cnoreabbrev Vert vert
