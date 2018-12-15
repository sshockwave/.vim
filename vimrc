let did_install_default_menus = 1
let did_install_syntax_menu = 1
let g:useWSL=has("windows")&&!empty(glob("c:\\Windows\\System32\\bash.exe"))

run options.vim
run map.vim
run syntax.vim
run autocmd.vim
run filetype.vim
run eval.vim
