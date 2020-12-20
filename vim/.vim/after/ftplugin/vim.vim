autocmd FileType vim setlocal keywordprg=:help

augroup vimrcEx
	autocmd!
	autocmd FileType vim setlocal textwidth=78
	autocmd BufWritePost vimrc nested :source $MYVIMRC
	autocmd BufReadPost *
		\if line("'\"") > 1 && line("'\"") <= line("$") |
		\	exe "normal! g`\"" |
		\endif
augroup END
