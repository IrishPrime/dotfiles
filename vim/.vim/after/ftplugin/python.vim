let g:python_recommended_style = 0
setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

augroup python
	autocmd BufNewFile *.py 0r $HOME/Templates/Python.py
augroup end
