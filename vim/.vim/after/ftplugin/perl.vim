set keywordprg=perldoc.sh

augroup perl
	autocmd BufNewFile *.pl     0r $HOME/Templates/Perl.pl
	autocmd BufNewFile *.pm     0r $HOME/Templates/Perl.pm
	" autocmd BufNewFile,BufRead {*.pl,*.pm,*.t} setlocal foldexpr=getline(v:lnum)=~'^=cut'?'<1':getline(v:lnum)=~'^='?'1':'=' |
	" autocmd BufNewFile,BufRead {*.pl,*.pm,*.t} setlocal foldmethod=expr
augroup end
