function Compile()
	w
	let cmd=""
	if &filetype ==# "cpp"
		let cmd.="!g++"
		if g:useWSL
			let cmd.=" `wslpath '%'`"
			let cmd.=" -o `wslpath '%<'`"
		el
			let cmd.=" %"
			let cmd.=" -o %<"
		en
		let cmd.=" -g"
		let cmd.=" -Wall"
		let cmd.=" -Wextra"
		let cmd.=" -std=c++11"
		let cmd.=" -fsanitize=undefined"
		let cmd.=" -fsanitize-undefined-trap-on-error"
	en
	execute cmd
endfunction

function ExtendSelection()
	" [bufnum, lnum, col, off]
	let l_pos=getpos("'<")
	let r_pos=getpos("'>")
	if l_pos[1]==r_pos[1]&&!(l_pos[2]<=1&&r_pos[2]>=strlen(getline(l_pos[1])))
		normal! V
	else
		normal! ggVG
	endif
endfunction
