" Appearance
syntax on
colo slate
hi StatusLine term=NONE cterm=NONE ctermfg=Black guifg=Black ctermbg=LightGray guibg=LightGray
hi StatusLineNC term=reverse cterm=reverse ctermfg=DarkGray guifg=DarkGray
hi StatusLineTerm term=NONE cterm=NONE ctermfg=Black guifg=Black ctermbg=LightGray guibg=LightGray
hi StatusLineTermNC term=reverse cterm=reverse ctermfg=DarkGray guifg=DarkGray ctermbg=Black guifg=Black
hi User1 ctermfg=Black guifg=Black ctermbg=White guibg=White
hi User7 ctermfg=Black guifg=Black ctermbg=DarkCyan guibg=DarkCyan
hi User8 ctermfg=Black guifg=Black ctermbg=DarkGreen guibg=DarkGreen
hi User9 ctermfg=Black guifg=Black ctermbg=DarkYellow guibg=DarkYellow

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
set   lazyredraw
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
set   statusline=%1*\ %{GetMode()}\ %*\ %f%=%7*%m%8*%r%<%9*%y
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
function GetMode()
	return {
		\"n": "Normal",
		\"no": "Normal",
		\"v": "Visual",
		\"V": "Visual > L",
		\"\<c-v>": "Visual > B",
		\"s": "Select",
		\"S": "Select > L",
		\"\<c-s>": "Select > B",
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
