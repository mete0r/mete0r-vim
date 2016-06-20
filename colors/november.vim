set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "november"

hi Comment ctermfg=lightblue cterm=bold
hi Constant ctermfg=darkgreen
hi Identifier ctermfg=black cterm=bold,underline
hi LineNr cterm=bold ctermfg=gray
hi Normal cterm=none ctermfg=black
hi PreProc ctermfg=darkblue cterm=bold
hi Statement ctermfg=darkblue cterm=bold
hi SignColumn ctermfg=none ctermbg=none
hi Search ctermfg=cyan ctermbg=blue
hi Folded cterm=none ctermfg=gray ctermbg=none
hi TabLineFill cterm=none ctermfg=white ctermbg=darkblue
hi TabLine cterm=none ctermfg=white ctermbg=darkblue
hi TabLineSel cterm=bold ctermfg=cyan ctermbg=black
hi StatusLine cterm=none ctermfg=white ctermbg=darkblue
hi StatusLineNC cterm=none ctermfg=black ctermbg=gray
hi StatusLineError cterm=bold ctermfg=white ctermbg=red
hi Type cterm=bold ctermfg=5
hi Visual ctermbg=lightcyan
hi link pythonBuiltin Statement
hi pythonDecorator ctermfg=lightgreen
