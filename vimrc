syntax on
colo slate

" Options
set noautoindent
set   backspace=start,indent,eol
set nobackup
set   cindent
set   cmdheight=1
set   complete=.,w,b,u,t
set nocursorcolumn
set nocursorline
set   encoding=utf-8
set noerrorbells
set nohlsearch
set noincsearch
set   laststatus=2
set   lazyredraw
set   number
set noruler
set   scrolloff=0
set   showcmd
set noshowmatch
set   showmode
set   shiftwidth=4
set   tabstop=4
set   title
set   updatecount=200
set   updatetime=1000
set   wildignore=*.swp
set   wildmenu

" Compilation
function Compile()
	w
	if &filetype ==# "cpp"
		if search("^#define WITH_MODERN_CPP$","n")
			!g++ % -o %< -std=c++14
		el
			!g++ % -o %< -g -Wall -Wextra -std=c++98 -fsanitize=undefined -fsanitize-undefined-trap-on-error
		en
	en
endfunction
nnoremap <silent> \\ :call Compile()<cr>
imap <silent> \\ <esc>:call Compile()<cr>

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

" Switch line number flavor
nnoremap <silent> <tab> :set rnu!<cr>

" Allow saving of files as sudo
cnoremap w!! w !sudo tee > /dev/null %
