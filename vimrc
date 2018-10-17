" Global States
let did_install_default_menus = 1
let did_install_syntax_menu = 1
let g:hasWSL=!empty(glob("c:\\Windows\\System32\\wsl.exe"))

" Appearance
syntax on
colo slate

" Filtype
filetype on
filetype plugin on
filetype indent on

" Options
set noautoindent
set   backspace=start,indent,eol
set nobackup
set   cmdheight=1
set   complete=.,w,b,u,t
set   confirm
set nocursorcolumn
set nocursorline
set   encoding=utf-8
set noerrorbells
set noexpandtab
set   fileformat=unix
set   fileformats=unix,dos,mac
set nohlsearch
set noincsearch
set   laststatus=2
set nolazyredraw
set   number
set   report=1
set noruler
set   scrolloff=0
set   selection=inclusive
set   shiftwidth=4
set   showcmd
set noshowmatch
set noshowmode
set   showtabline=1
set nosmartcase
set   smartindent
set nosmarttab
set nospell
set   startofline
set   tabstop=4
set   timeoutlen=200
set   ttimeoutlen=-1
set   title
set   updatecount=200
set   updatetime=1000
set   viminfo=
set   wildignore=*.swp
set   wildmenu
if has("windows")
	if g:hasWSL
		set shell=wsl
		set shellpipe=|
		set shellredir=>
		set shellcmdflag=
	endif
endif

" Functions
function Compile()
	w
	let cmd=""
	if &filetype ==# "cpp"
		let cmd.="!g++"
		if g:hasWSL
			let cmd.=" `wslpath '%'`"
			let cmd.=" -o `wslpath '%<'`"
		else
			let cmd.=" %"
			let cmd.=" -o %<"
		endif
		if search("^#define WITH_MODERN_CPP$","n")
			let cmd.=" -std=c++14"
		el
			let cmd.=" -g"
			let cmd.=" -Wall"
			let cmd.=" -Wextra"
			let cmd.=" -std=c++98"
			let cmd.=" -fsanitize=undefined"
			let cmd.=" -fsanitize-undefined-trap-on-error"
		en
	en
	execute cmd
endfunction

" Mappings
let mapleader = ","
noremap [ ,
noremap ] ;
nnoremap <silent> \\ :call Compile()<cr>
inoremap <silent> \\ <esc>:call Compile()<cr>
nnoremap <silent> <tab> :set rnu!<cr>
nnoremap <silent> <cr> :w<cr>
if g:hasWSL
	nnoremap <silent> <F12>
	\ :call system("cat ".expand("%")." \| /mnt/c/Windows/System32/clip.exe")<cr>
	\ :echomsg "File copied on ".strftime("%H:%M:%S")<cr>
endif

" Abbreviations
cnoreabbrev w!! w !sudo tee > /dev/null %
cnoreabbrev Vert vert
