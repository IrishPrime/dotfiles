" Use bash instead of fish for portability
if &shell =~# 'fish$'
	set shell=bash
endif

" Plugin Management {{{
call plug#begin('~/.vim/bundle')

" GitHub repos
Plug 'baskerville/vim-sxhkdrc'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dag/vim-fish'
Plug 'gorodinskiy/vim-coloresque'
Plug 'lifepillar/vim-solarized8'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'IrishPrime/WhiteWash.vim'
" Vim-Scripts repos
Plug 'hexHighlight.vim'
Plug 'matchit.zip'
Plug 'netrw.vim'

call plug#end()
" }}}

" Options {{{
set autochdir
set autowrite
set background=dark
set backspace=indent,eol,start
set cursorline
set diffopt+=vertical
set encoding=utf-8
set fillchars+=vert:│,fold:-,diff:-
set foldmethod=indent
set guifont=DejaVu\ Sans\ Mono\ 12
set guioptions-=L
set guioptions-=m
set guioptions-=r
set guioptions-=T
set hidden
set history=50
set ignorecase
set incsearch
set laststatus=2
set linebreak
set listchars=tab:→\ ,eol:¬
set nohlsearch
set number relativenumber
set showcmd
set showmatch
set noshowmode
set smartcase
"set statusline=%F%m%r%h%w\ [%n]%=%y\ [%4l,%3v\ %p%%] " Disable with statusline plugins
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set tags=tags;/
set t_Co=256
set wildmenu
set wildignore=*.o,*.swp,*.class,*.pyc
set wildmode=list:longest,full
set wrap
filetype on
syntax on

" Mouse support, just in case
if has("mouse")
	set mouse=a
endif
" }}}

" Add more list styles {{{
set formatlistpat=^\\s*[\\[({]\\\?\\([0-9]\\+\\\|[iIvVxXlLcCdDmM]\\+\\\|[a-zA-Z]\\)[\\]:.)}]\\s\\+\\\|^\\s*[-+o*]\\s\\+
" }}}

" Auto commands {{{
if has("autocmd")
	filetype plugin indent on

	if exists("+omnifunc")
		autocmd Filetype *
			\if &omnifunc == "" |
			\	setlocal omnifunc=syntaxcomplete#Complete |
			\endif
	endif

	autocmd FileType vim setlocal keywordprg=:help
	augroup vimrcEx
		autocmd!
		autocmd FileType vim setlocal textwidth=78
		autocmd BufWritePost .vimrc nested :source $MYVIMRC
		autocmd BufReadPost *
			\if line("'\"") > 1 && line("'\"") <= line("$") |
			\	exe "normal! g`\"" |
			\endif
	augroup END

	augroup Java
		autocmd!
		autocmd BufNewFile *.java  0r $HOME/Templates/Java.java
		autocmd BufNewFile *.java  exe "8,10s/TMP/".expand("%<")
		autocmd FileType java set makeprg=javac\ *.java
	augroup END

	" Automatic spell-checking for *.txt buffers, annoying with help files
	"autocmd BufEnter,BufNew *.txt set spell spelllang=en_us

	autocmd BufNewFile *.c      0r $HOME/Templates/C.c
	autocmd BufNewFile *.php    0r $HOME/Templates/PHP.php
	autocmd BufNewFile *.pl     0r $HOME/Templates/Perl.pl
	autocmd BufNewFile *.py     0r $HOME/Templates/Python.py
	autocmd BufNewFile *.*htm*  0r $HOME/Templates/XHTML.xhtml
	autocmd BufNewFile Makefile 0r $HOME/Templates/Makefile
endif
" }}}

" Cscope {{{
if has("cscope")
	set cscopetag cscopeverbose

	if has("quickfix")
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
		let db = fnamemodify(findfile("cscope.out", ".;"), ":p")
		if (!empty(db))
			let path = strpart(db, 0, match(db, "/cscope.out$"))
			set nocscopeverbose " suppress 'duplicate connection' error
			exe "cs add " . db . " " . path
			set cscopeverbose
		endif
	endfunction
	au BufEnter /* call LoadCscope()
endif
" }}}

" Functions {{{
function! NeatFoldText()
	let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
	let lines_count = v:foldend - v:foldstart + 1
	let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
	let foldchar = matchstr(&fillchars, 'fold:\zs.')
	let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
	let foldtextend = lines_count_text . repeat(foldchar, 8)
	let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
	return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()
" }}}

" Mappings {{{
" Mapping to edit vimrc
nmap <Leader>v :tabedit $MYVIMRC<CR>

" Mapping from sensible.vim. :nohlsearch and update diffs {{{
if maparg('<C-L>', 'n') ==# ''
	nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
" }}}

" Mappings to navigate my C style {{{
:map [[ ?{<CR>w99[{
:map ][ /}<CR>b99]}
:map ]] j0[[%/{<CR>
:map [] k$][%?}<CR>
" }}}

" Mappings to make the global register less annoying {{{
if has("clipboard")
	map <Leader>p :set paste<CR>"+]p<Esc>:set nopaste<CR>
	map <Leader>P :set paste<CR>"+]P<Esc>:set nopaste<CR>
	map <Leader>y "+y
	map <Leader>Y "+Y
else
	map <Leader>p :set paste<CR>:r !xsel -ob<Esc>:set nopaste<CR>
	map <Leader>P :set paste<CR>:-1r !xsel -ob<Esc>:set nopaste<CR>
	map <Leader>y :w !xsel -ib<CR><CR>
	map <Leader>Y <S-v>:w !xsel -ib<CR><CR>
endif
" }}}

" Mappings and commands for dates/times {{{
imap <Leader>ymd <C-R>=strftime("%Y.%m.%d")<CR>
imap <Leader>mdy <C-R>=strftime("%m.%d.%Y")<CR>
imap <Leader>ndy <C-R>=strftime("%b %d, %Y")<CR>
imap <Leader>hms <C-R>=strftime("%T")<CR>
imap <Leader>ynd <C-R>=strftime("%Y %b %d")<CR>
com! YMD :norm! i<C-R>=strftime("%Y.%m.%d")<CR>
com! MDY :norm! i<C-R>=strftime("%m.%d.%Y")<CR>
com! NDY :norm! i<C-R>=strftime("%b %d, %Y")<CR>
com! HMS :norm! i<C-R>=strftime("%T")<CR>
com! YND :norm! i<C-R>=strftime("%Y %b %d")<CR>
" }}}

" Mapping to open a Quickfix window for the last search
nnoremap <silent> <Leader>q :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" Mapping to add FIXME, TODO, XXX lines in the current buffer to the Quickfix list
nnoremap <Leader>f :vimgrep /FIXME\\|TODO\\|XXX/ %<CR>

" Mapping to play recordings on a visual range
nnoremap Q @q
vnoremap Q :norm @q<cr>

" Mapping to toggle the toolbar and menu in gVim {{{
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
	\set guioptions-=T <Bar>
	\set guioptions-=m <Bar>
\else <Bar>
	\set guioptions+=T <Bar>
	\set guioptions+=m <Bar>
\endif<CR>
" }}}

" Mapping to toggle Tagbar tag browser
map <F4> :TagbarToggle<CR>

" Mapping to switch between .c and .h files
map <F5> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>

" Mapping to toggle spell checking
map <F7> :set spell!<CR>

" Mapping to show syntax item under cursor {{{
map <F9> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }}}
" }}}

" Plugin Options {{{
" GetLatestVimScripts
let g:GetLatestVimScripts_allowautoinstall=1

" Airline {{{
let g:airline_powerline_fonts = 1
let g:airline_theme = "solarized"
let g:airline#extensions#whitespace#mixed_indent_algo = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" }}}

" CtrlP {{{
let g:ctrlp_root_markers = ['cscope.out']
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1
let g:ctrlp_open_multiple_files = '1rjv'
" }}}

" Notes.vim {{{
let g:notes_directories = ['~/Documents/Notes']
let g:notes_suffix = '.txt'
let g:notes_title_sync = 'rename_file'
" }}}

" The Silver Searcher {{{
if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor

	" Use ag in CtrlP
	let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

	" Skip caching since ag is so fast
	let g:ctrlp_use_caching = 0
endif
" }}}

" Startify {{{
let g:startify_bookmarks = [ {'r': '~/.vimrc'}, {'f': '~/.config/fish/config.fish'} ]
let g:ctrlp_reuse_window = 'startify'
let g:startify_custom_header = []
" }}}

" Syntastic {{{
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '»'
let g:syntastic_check_on_wq = 0
" }}}

" Colorscheme
if has('termguicolors') && ($STY != '')
	set termguicolors
endif

" set Vim-specific sequences for RGB colors
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:solarized_termtrans = 1
colorscheme solarized8_dark
" }}}

" vim: foldmethod=marker
