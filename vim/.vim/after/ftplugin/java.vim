augroup Java
	autocmd!
	autocmd BufNewFile *.java  0r $HOME/Templates/Java.java
	autocmd BufNewFile *.java  exe "8,10s/TMP/".expand("%<")
	autocmd FileType java set makeprg=javac\ *.java
augroup END
