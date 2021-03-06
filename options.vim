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
set   list
set   listchars=tab:»\ ,trail:·
set   number
set   report=1
set noruler
set   scrolloff=0
set   selection=inclusive
set   shiftwidth=0
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
set   timeoutlen=1000
set   ttimeoutlen=-1
set   title
set   updatecount=200
set   updatetime=1000
set   viminfo=
set   wildignore=*.swp
set   wildmenu
set   wrap
if g:useWSL
	set shell=bash
	set shellpipe=2>&1\|\ tee
	set shellredir=>%s\ 2>&1
	set shellquote=
	set shellxquote=\"
	set shellcmdflag=-c
en
