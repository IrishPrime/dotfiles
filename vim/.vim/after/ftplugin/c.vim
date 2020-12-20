augroup c
	autocmd BufNewFile *.c 0r $HOME/Templates/C.c
augroup end

" Cscope {{{
if has('cscope')
	if has('quickfix')
		set cscopequickfix=s-,c-,d-,i-,t-,e-
	endif

	cnoreabbrev <expr> csa
		\ ((getcmdtype() == ":" && getcmdpos() <= 4)? "cs add"  : "csa")
	cnoreabbrev <expr> csf
		\ ((getcmdtype() == ":" && getcmdpos() <= 4)? "cs find" : "csf")
	cnoreabbrev <expr> csk
		\ ((getcmdtype() == ":" && getcmdpos() <= 4)? "cs kill" : "csk")
	cnoreabbrev <expr> csr
		\ ((getcmdtype() == ":" && getcmdpos() <= 4)? "cs reset" : "csr")
	cnoreabbrev <expr> css
		\ ((getcmdtype() == ":" && getcmdpos() <= 4)? "cs show" : "css")
	cnoreabbrev <expr> csh
		\ ((getcmdtype() == ":" && getcmdpos() <= 4)? "cs help" : "csh")

	"command -nargs=0 CScope cs add $VIMSRC/src/cscope.out $VIMSRC/src

	" Automatically load CScope
	function! LoadCscope()
		" Use full paths
		let db = fnamemodify(findfile('cscope.out', '.;'), ':p')
		if (!empty(db))
			let path = strpart(db, 0, match(db, '/cscope.out$'))
			set nocscopeverbose " suppress 'duplicate connection' error
			exe 'cs add ' . db . ' ' . path
			set cscopeverbose
			set cscopetag
		endif
	endfunction
	au BufEnter /* call LoadCscope()
endif
" }}}
