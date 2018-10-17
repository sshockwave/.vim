" A simple vim statusline with mode display
" Maintainer:	sshockwave <i_sukai@live.com>

let s:activewindow=winnr()
set   statusline=%*\ %{GetModeStatus()}\ %1*\ %f%<\ %2*%m%r%1*%=%*[%{&ff}]%y

hi StatusLine term=NONE cterm=NONE ctermfg=Black guifg=Black
hi StatusLineNC term=NONE cterm=NONE ctermfg=LightGray ctermbg=DarkGray guifg=LightGray guibg=DarkGray
hi clear StatusLineTerm | hi link StatusLineTerm StatusLine
hi clear StatusLineTermNC | hi link StatusLineTermNC StatusLineNC
hi User1 term=Bold cterm=Bold ctermfg=White guifg=White ctermbg=Black guibg=Black
hi User2 term=Underline cterm=Underline ctermfg=White guifg=White ctermbg=Black guibg=Black

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

augroup GetActiveWindow
	au WinEnter * call SetActiveWindow()
augroup END
