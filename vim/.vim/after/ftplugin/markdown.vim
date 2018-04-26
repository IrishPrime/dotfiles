" markdown.vim
" Custom markdown commands and/or settings.

" Maintainer: Michael O'Neill <irish.dot@gmail.com>
" Version:    2018.02.28

" Convert CSV formatted data to a Markdown table
function! s:csv_to_table()
	" Save cursor position
	let l:save_cursor = getpos(".")

	" Replace comma separated values with pipes
	s/,\s*/|/ge

	" Remove single quotes
	s/'//ge

	" Place pipes at the beginning and end of each line
	norm I|
	norm A|

	" Restore cursor position
	call setpos('.', l:save_cursor)
endfunction

" Convert a normal table row to a table header
function! s:row_to_header()
	s/|/||/ge
endfunction

" Commands
command! -range=% MDCSVToTable silent <line1>,<line2> call <SID>csv_to_table()
command! MDRowToHeader silent call <SID>row_to_header()
