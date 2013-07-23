" Irish's Color Scheme
"
" Author:  Michael O'Neill <irish.dot@gmail.com>
" Version: 0.6

set background=dark

hi clear
if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "irish"

" Default Colors
hi Normal       guifg=#FFFFFF guibg=#000000 ctermfg=15
hi NonText      guifg=#444444 guibg=#000000 ctermfg=238
hi Cursor       guibg=#AAAAAA ctermbg=248
hi lCursor      guibg=#FFFFFF ctermbg=15
hi ModeMsg      guifg=#336699 ctermfg=68
hi DiffAdd      guibg=#002B36
hi DiffChange   guibg=#0F0F0F
hi DiffDelete   guibg=#586E75
hi DiffText     guibg=#112233

" Search
hi Search       guifg=#000000 guibg=#FF8900 gui=none ctermfg=202 ctermbg=0
hi IncSearch    guifg=#000000 guibg=#FF8900 gui=none ctermfg=202 ctermbg=0

" Window Elements
hi CursorLine   guibg=#181818 gui=none cterm=none ctermbg=234
hi Directory    guifg=#6699CC ctermfg=68
hi Folded       guifg=#AAAAAA guibg=#000000 gui=none ctermfg=248 ctermbg=0
hi LineNr       guifg=#AAAAAA gui=none ctermfg=248
hi Pmenu        guifg=#FFFFFF guibg=#111111 gui=none ctermfg=15 ctermbg=233
hi PmenuSel     guifg=#FFFFFF guibg=#336699 gui=none ctermfg=15 ctermbg=68
hi FoldColumn   guifg=#336699 guibg=#000000 ctermfg=68 ctermbg=none
hi SignColumn   guibg=#111111 gui=none ctermbg=233
hi StatusLine   guifg=#30FF30 guibg=#0A0A0A gui=bold ctermfg=83
hi StatusLineNC guifg=#108810 guibg=#0A0A0A gui=none ctermfg=28
hi TabLine      ctermfg=245 ctermbg=235 cterm=none
hi TabLineSel   ctermfg=231 ctermbg=70 cterm=bold
hi TabLineFill  ctermfg=0
hi VertSplit    guifg=#FFFFFF guibg=#000000 gui=none cterm=none

" Specials
hi Special      guifg=#FF8900 guibg=#000000 gui=bold ctermfg=208
hi SpecialKey   guifg=#808080
hi Title        guifg=#FFF569 gui=bold ctermfg=227 cterm=bold
hi Todo         guifg=#FF4400 guibg=#000000 gui=bold ctermfg=202 ctermbg=0

" Syntax Elements
hi Comment      guifg=#AAAAAA gui=italic ctermfg=248
hi Constant     guifg=#FF5500 gui=bold ctermfg=202
hi Error        guifg=#FFFFFF guibg=#FF0000 gui=bold ctermfg=15
hi Number       guifg=#3366CC ctermfg=62
hi String       guifg=#6699CC ctermfg=68
hi Function     guifg=#99CCFF gui=bold ctermfg=117
hi PreProc      guifg=#904CA8 gui=bold ctermfg=97
hi Type         guifg=#FFF569 gui=bold ctermfg=227
hi Statement    guifg=#30FF30 gui=bold ctermfg=83
hi Identifier   guifg=#C41F3B gui=bold ctermfg=161
hi Label        guifg=#30BB30 ctermfg=71

" JavaScript Highlighting
hi javaScript              guifg=#FFFFFF ctermfg=15
hi javaScriptRegexpString  guifg=#AA6600 ctermfg=130
hi javaScriptDocComment    guifg=#AAAAAA ctermfg=248
hi javaScriptCssStyles     guifg=#DD7700 ctermfg=172
hi javaScriptDomElemFuncs  guifg=#66CD66 ctermfg=77
hi javaScriptHtmlElemFuncs guifg=#DD7700 ctermfg=172
hi javaScriptLabel         guifg=#00BDEC ctermfg=39 gui=italic
hi javaScriptPrototype     guifg=#00BDEC ctermfg=39
hi javaScriptConditional   guifg=#FF0007 ctermfg=9 gui=bold
hi javaScriptRepeat        guifg=#FF0007 ctermfg=9 gui=bold
hi javaScriptFunction      guifg=#FF0086 ctermfg=198 gui=bold

" CSS Highlighting
hi cssIdentifier guifg=#66CD66 ctermfg=77 gui=bold
hi cssBraces     guifg=#00BDEC ctermfg=39 gui=bold

" XML Highlighting
hi xmlTag         guifg=#00BDEC ctermfg=39
hi xmlTagName     guifg=#00BDEC ctermfg=39
hi xmlEndTag      guifg=#00BDEC ctermfg=39
hi xmlNamespace   guifg=#00BDEC ctermfg=39 gui=underline
hi xmlAttribPunct guifg=#CCCAA9 ctermfg=187 gui=bold
hi xmlEqual       guifg=#CCCAA9 ctermfg=187 gui=bold
hi xmlCdata       guifg=#BF0945 ctermfg=125 gui=bold
hi xmlCdataCdata  guifg=#AC1446 ctermfg=125 guibg=#23010C ctermbg=233 gui=none
hi xmlCdataStart  guifg=#BF0945 ctermfg=125 gui=bold
hi xmlCdataEnd    guifg=#BF0945 ctermfg=125 gui=bold

" HTML Highlighting
hi htmlTag            guifg=#00BDEC ctermfg=39 gui=bold
hi htmlEndTag         guifg=#00BDEC ctermfg=39 gui=bold
hi htmlSpecialTagName guifg=#66CD66 ctermfg=77
hi htmlTagName        guifg=#66CD66 ctermfg=77
hi htmlTagN           guifg=#66CD66 ctermfg=77
hi htmlTitle          guifg=#FFFFFF gui=bold
hi link htmlEvent htmlArg
hi link htmlEventDQ String

" Vim Highlighting
hi link vimGroupName vimHiGroup
hi link vimGroup vimHiGroup

" Taglist
hi link TagListFileName Directory
