function Compile()
	w
	let cmd=""
	if &filetype ==# "cpp"
		let cmd.="!g++"
		if g:hasWSL
			let cmd.=" `wslpath '%'`"
			let cmd.=" -o `wslpath '%<'`"
		el
			let cmd.=" %"
			let cmd.=" -o %<"
		en
		if search("^#define WITH_MODERN_CPP$","n")
			let cmd.=" -std=c++14"
		el
			let cmd.=" -g"
			let cmd.=" -Wall"
			let cmd.=" -Wextra"
			let cmd.=" -std=c++98"
			let cmd.=" -fsanitize=undefined"
			let cmd.=" -fsanitize-undefined-trap-on-error"
		en
	en
	execute cmd
endfunction
