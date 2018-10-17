" Global States
let did_install_default_menus = 1
let did_install_syntax_menu = 1
let s:activewindow=winnr()
let g:hasWSL=!empty(glob("c:\\Windows\\System32\\wsl.exe"))

" Appearance
syntax on
colo slate
hi StatusLine term=NONE cterm=NONE ctermfg=Black guifg=Black
hi StatusLineNC term=NONE cterm=NONE ctermfg=LightGray ctermbg=DarkGray guifg=LightGray guibg=DarkGray
hi clear StatusLineTerm | hi link StatusLineTerm StatusLine
hi clear StatusLineTermNC | hi link StatusLineTermNC StatusLineNC
hi User1 term=Bold cterm=Bold ctermfg=White guifg=White ctermbg=Black guibg=Black
hi User2 term=Underline cterm=Underline ctermfg=White guifg=White ctermbg=Black guibg=Black

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
set   statusline=%*\ %{GetModeStatus()}\ %1*\ %f%<\ %2*%m%r%1*%=%*[%{&ff}]%y
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
function DrawMode()
	if w:mode =~# "Normal"
		hi StatusLine ctermbg=Yellow guibg=Yellow
	elseif w:mode =~# "Visual" || w:mode=~#"Select"
		hi StatusLine ctermbg=DarkMagenta guibg=DarkMagenta
	elseif w:mode =~# "Insert"
		hi StatusLine ctermbg=DarkCyan guibg=DarkCyan
	elseif w:mode =~# "Replace"
		hi StatusLine ctermbg=Red guibg=Red
	elseif w:mode =~# "Terminal"
		hi StatusLine ctermbg=Brown guibg=Brown
	else
		hi StatusLine ctermbg=White guibg=White
	endif
endfunction
function GetMode()
	return {
		\"n": "Normal",
		\"no": "Normal",
		\"v": "Visual",
		\"V": "Visual",
		\"\<c-v>": "Visual",
		\"s": "Select",
		\"S": "Select",
		\"\<c-s>": "Select",
		\"i": "Insert",
		\"ic": "Insert",
		\"ix": "Insert",
		\"R": "Replace",
		\"Rc": "Replace",
		\"Rv": "Replace",
		\"Rx": "Replace",
		\"c": "Command",
		\"cv": "Command",
		\"ce": "Command",
		\"r": "Prompt",
		\"rm": "More",
		\"r?": "Confirm",
		\"!": "Shell",
		\"t": "Terminal"
	\}[mode(1)]
endfunction
function GetModeStatus()
	if !exists('w:mode')
		let w:mode=""
	endif
	if winnr() !=# s:activewindow
		return w:mode
	endif
	let curmode=GetMode()
	if w:mode !=# curmode
		let w:mode=curmode
		call DrawMode()
	endif
	return w:mode
endfunction
function SetActiveWindow()
	let s:activewindow=winnr()
	if !exists('w:mode')
		let w:mode=GetMode()
	endif
	call DrawMode()
endfunction

call GetModeStatus()

" Mappings
let mapleader = ","
nnoremap [ ,
nnoremap ] ;
vnoremap [ ,
vnoremap ] ;
nnoremap <silent> \\ :call Compile()<cr>
inoremap <silent> \\ <esc>:call Compile()<cr>
nnoremap <silent> <tab> :set rnu!<cr>
nnoremap <silent> <cr> :w<cr>
nnoremap <silent> <F12>
\ :call system("cat ".expand("%")." \| /mnt/c/Windows/System32/clip.exe")<cr>
\ :echomsg "File copied on ".strftime("%H:%M:%S")<cr>

" Abbreviations
cnoreabbrev w!! w !sudo tee > /dev/null %
cnoreabbrev Vert vert

" Auto Commands
augroup GetActiveWindow
	au WinEnter * call SetActiveWindow()
augroup END
augroup SetIndent
	au BufRead * if &filetype==#"cpp" | setlocal cin | endif
augroup END
