syntax on
colo slate

" Options
set noai "autoindent
set bs=start,indent,eol "backspace
set nobk "backup
set cin "cindent
set ch=1 "cmdheight
set cul "cursorline
set enc=utf-8 "encoding
set noeb "errorbells
set nohls "hlsearch
set nois "incsearch
set lz "lazyredraw
set nu "number
set noru "ruler
set so=0 "scrolloff
set sc "showcmd
set sw=4 "shiftwidth
set ts=4 "tabstop
set title "title
set uc=200 "updatecount
set ut=1000 "updatetime
set wig=*.swp "wildignore
set wmnu "wildmenu

" Compilation
nnoremap <silent> <F7> :w<cr>:!g++ % -o %< -g -Wall -Wextra -std=c++98 -fsanitize=undefined -fsanitize-undefined-trap-on-error<cr>
nnoremap <silent> <F3> :w<cr>:!g++ % -o %< -std=c++14<cr>
inoremap <silent> <F7> <esc><F7>
inoremap <silent> <F3> <esc><F3>

" Movement
nnoremap <c-j> <c-e>
nnoremap <c-k> <c-y>
nnoremap <c-h> <c-u>
nnoremap <c-l> <c-d>

" Clipboard
if has('clipboard')
	nnoremap <F12> mpgg"+yG`p
else
	nnoremap <silent> <F12>
		\ :call system('cat '.expand('%').' \| /mnt/c/Windows/System32/clip.exe')<cr>
		\ :echomsg "File copied on ".strftime('%H:%M:%S')<cr>
endif

" Line Number
nnoremap <silent> e :set rnu!<cr>
vnoremap <silent> e :set rnu!<cr>
