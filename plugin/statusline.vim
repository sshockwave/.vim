" A simple vim statusline with mode display
" Maintainer:	sshockwave <i_sukai@live.com>

let s:activewindow=winnr()
set statusline=%*\ %{GetLocalMode()}\ %1*\ %f\ %2*%m%r%1*%<%=%*[%{&ff}]%y

hi clear StatusLine | hi StatusLine ctermfg=Black guifg=Black
hi clear StatusLineNC | hi StatusLineNC ctermfg=LightGray ctermbg=DarkGray guifg=LightGray guibg=DarkGray
hi clear StatusLineTerm | hi link StatusLineTerm StatusLine
hi clear StatusLineTermNC | hi link StatusLineTermNC StatusLineNC
hi clear User1 | hi User1 term=Bold cterm=Bold ctermfg=White guifg=White ctermbg=Black guibg=Black
hi clear User2 | hi User2 term=Underline cterm=Underline gui=Underline ctermfg=White guifg=White ctermbg=Black guibg=Black

function ApplyModeColor()
	let color={
		\"Normal": "Yellow",
		\"Visual": "DarkMagenta",
		\"Select": "DarkMagenta",
		\"Insert": "DarkCyan",
		\"Replace": "Red",
		\"Terminal": "Brown",
		\"Command": "White",
		\"Prompt": "Green",
		\"Shell": "DarkBlue",
	\}[s:activemode]
	exe "hi StatusLine ctermbg=".color." guibg=".color
endfunction

function GetGlobalMode()
	let curmode={
		\"n": "Normal",
		\"v": "Visual",
		\"V": "Visual",
		\"\<c-v>": "Visual",
		\"s": "Select",
		\"S": "Select",
		\"\<c-s>": "Select",
		\"i": "Insert",
		\"R": "Replace",
		\"c": "Command",
		\"cv": "Command",
		\"ce": "Command",
		\"r": "Prompt",
		\"!": "Shell",
		\"t": "Terminal"
	\}[mode()]
	if !exists("s:activemode") || s:activemode !=# curmode
		let s:activemode=curmode
		call ApplyModeColor()
	endif
	return curmode
endfunction

function GetLocalMode()
	if !exists('w:mode') || winnr() ==# s:activewindow
		let w:mode=GetGlobalMode()
	endif
	return w:mode
endfunction

augroup GetActiveWindow
	au WinEnter * let s:activewindow=winnr() | call GetGlobalMode()
augroup END

call GetGlobalMode()
