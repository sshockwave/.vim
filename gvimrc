" Options
set   guifont=Consolas:h12
set   guioptions=!cimg

if has('win32') || has('win64')
	if (v:version == 704 && has("patch393")) || v:version > 704
		set renderoptions=type:directx
			\,gamma:1.0
			\,contrast:0.5
			\,level:1
			\,geom:1
			\,renmode:4
			\,taamode:1
	endif
endif
