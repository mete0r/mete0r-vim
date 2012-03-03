set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "november"

hi Normal cterm=none ctermfg=black
hi SignColumn ctermfg=none ctermbg=none
hi Search ctermfg=cyan ctermbg=blue
hi Folded cterm=none ctermfg=gray ctermbg=none
hi TabLineFill cterm=none ctermfg=white ctermbg=darkblue
hi TabLine cterm=none ctermfg=white ctermbg=darkblue
hi TabLineSel cterm=bold ctermfg=cyan ctermbg=black
hi StatusLine cterm=none ctermfg=white ctermbg=darkblue
hi StatusLineNC cterm=none ctermfg=black ctermbg=gray
hi StatusLineError cterm=bold ctermfg=white ctermbg=red
hi Statement cterm=bold ctermfg=blue
hi Identifier cterm=bold ctermfg=9
hi Type cterm=bold ctermfg=5
hi PreProc cterm=bold ctermfg=5
hi Constant cterm=none ctermfg=darkyellow
hi Comment ctermfg=darkcyan
