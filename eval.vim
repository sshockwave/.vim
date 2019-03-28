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
