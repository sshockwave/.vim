"%% SiSU Vim color file
" Slate Maintainer: Ralph Amissah <ralph@amissah.com>
" (originally looked at desert Hans Fugal <hans@fugal.net> http://hans.fugal.net/vim/colors/desert.vim (2003/05/06)
set background=dark
highlight clear
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif
let colors_name = "slate"
hi Normal guifg=White guibg=grey15
hi Cursor guifg=slategrey guibg=khaki
hi VertSplit cterm=reverse gui=none guifg=grey40 guibg=#c2bfa5
hi Folded ctermfg=grey ctermbg=darkgrey guifg=grey40 guibg=black
hi FoldColumn ctermfg=darkred ctermbg=grey guibg=black guifg=grey20
hi IncSearch cterm=none ctermfg=yellow ctermbg=green guifg=green guibg=black
hi ModeMsg cterm=none ctermfg=brown guifg=goldenrod
hi MoreMsg ctermfg=darkgreen guifg=SeaGreen
hi NonText cterm=bold ctermfg=blue guifg=RoyalBlue guibg=grey15
hi Question ctermfg=green guifg=springgreen
hi Search cterm=none ctermfg=grey ctermbg=blue guifg=wheat guibg=peru
hi SpecialKey ctermfg=darkgreen guifg=yellowgreen
hi StatusLine cterm=bold,reverse gui=none guifg=black guibg=#c2bfa5
hi StatusLineNC cterm=reverse gui=none guifg=grey40 guibg=#c2bfa5
hi Title cterm=bold ctermfg=yellow gui=bold guifg=gold
hi Statement ctermfg=lightblue guifg=CornflowerBlue
hi Visual cterm=reverse gui=none guifg=khaki guibg=olivedrab
hi WarningMsg ctermfg=darkblue guifg=salmon
hi String ctermfg=darkcyan guifg=SkyBlue
hi Comment term=bold ctermfg=cyan guifg=grey40
hi Constant ctermfg=brown guifg=#ffa0a0
hi Special ctermfg=brown guifg=darkkhaki
hi Identifier ctermfg=red guifg=salmon
hi Include ctermfg=red guifg=red
hi PreProc ctermfg=red guifg=red
hi Operator ctermfg=Red guifg=Red
hi Define ctermfg=yellow gui=bold guifg=gold
hi Type ctermfg=darkgreen guifg=CornflowerBlue
hi Function ctermfg=brown guifg=navajowhite
hi Structure ctermfg=green guifg=green
hi LineNr ctermfg=darkcyan guifg=grey50
hi Ignore cterm=bold ctermfg=grey guifg=grey40
hi Todo guifg=orangered guibg=yellow2
hi Directory ctermfg=darkcyan
hi ErrorMsg cterm=bold ctermfg=grey ctermbg=darkblue guifg=White guibg=Red
hi VisualNOS cterm=bold,underline
hi WildMenu ctermfg=black ctermbg=darkcyan
hi DiffAdd ctermbg=darkred
hi DiffChange ctermbg=darkmagenta
hi DiffDelete cterm=bold ctermfg=darkred ctermbg=brown
hi DiffText cterm=bold ctermbg=darkblue
hi Underlined cterm=underline ctermfg=darkmagenta
hi Error cterm=bold ctermfg=grey ctermbg=darkblue guifg=White guibg=Red
hi SpellErrors cterm=bold ctermfg=grey ctermbg=darkblue guifg=White guibg=Red
