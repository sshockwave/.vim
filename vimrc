" Appearance
syntax on
colo slate
hi StatusLine term=NONE cterm=NONE ctermfg=Black guifg=Black ctermbg=Yellow guibg=Yellow
hi StatusLineNC term=NONE cterm=NONE ctermfg=LightGray guifg=LightGray ctermbg=DarkGray guifg=DarkGray
hi clear StatusLineTerm | hi link StatusLineTerm StatusLine
hi clear StatusLineTermNC | hi link StatusLineTermNC StatusLineNC
hi User1 term=Bold cterm=Bold ctermfg=White guifg=White ctermbg=Black guibg=Black

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
set   signcolumn=auto
set nosmartcase
set   smartindent
set nosmarttab
set nospell
set   startofline
set   statusline=%*\ %{GetModeStatus()}\ %1*\ %f%=%*%m%r%<%y
set   tabstop=4
set   timeoutlen=200
set   ttimeoutlen=-1
set   title
set   updatecount=200
set   updatetime=1000
set   wildignore=*.swp
set   wildmenu
if &filetype ==# "cpp"
	set cindent
en

" Functions
function Compile()
	w
	if &filetype ==# "cpp"
		if search("^#define WITH_MODERN_CPP$","n")
			!g++ %
				\ -o %<
				\ -std=c++14
		el
			!g++ %
				\ -o %<
				\ -g
				\ -Wall
				\ -Wextra
				\ -std=c++98
				\ -fsanitize=undefined
				\ -fsanitize-undefined-trap-on-error
		en
	en
endfunction
let s:activewindow=winnr()
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
		hi StatusLine ctermbg=DarkYellow guibg=DarkYellow
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

" Mappings
nnoremap [ ,
nnoremap ] ;
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

augroup GetActiveWindow
	au WinEnter * call SetActiveWindow()
augroup END
