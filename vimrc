syntax on
colo slate
set nu ai cin sc sw=4 ts=4 bs=start,indent,eol

" Compilation
map <F7> :w<cr>:!g++ % -o %< -g -Wall -Wextra -std=c++98 -fsanitize=undefined -fsanitize-undefined-trap-on-error<cr>
map <F3> :w<cr>:!g++ % -o %< -std=c++14<cr>
map! <F7> <esc><F7>
map! <F3> <esc><F3>

" Movement
map <c-j> <c-e>
map <c-k> <c-y>
map <c-h> <c-u>
map <c-l> <c-d>

" WSL Clipboard
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
	autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, '\<cr>')).' | '.s:clip)
end
