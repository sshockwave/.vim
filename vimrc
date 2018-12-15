let did_install_default_menus = 1
let did_install_syntax_menu = 1
let g:useWSL=has("windows")&&!empty(glob("c:\\Windows\\System32\\bash.exe"))

syntax on
colorscheme slate

filetype on
filetype plugin on
filetype indent on

run options.vim
run map.vim
run autocmd.vim
run eval.vim
