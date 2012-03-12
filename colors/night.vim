set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "night"

hi Normal ctermfg=gray
hi SignColumn ctermfg=none ctermbg=none
hi Search ctermfg=cyan ctermbg=blue
hi Folded ctermfg=darkgray ctermbg=none
hi TabLineFill cterm=none ctermfg=gray ctermbg=black
hi TabLine cterm=none ctermfg=gray ctermbg=black
hi TabLineSel cterm=none ctermfg=white ctermbg=darkblue
hi StatusLine cterm=none ctermfg=white ctermbg=black
hi StatusLineNC cterm=none ctermfg=gray ctermbg=black
hi StatusLineError ctermfg=red ctermbg=black
hi DiffAdd cterm=bold
hi DiffChange cterm=bold
hi DiffDelete ctermfg=0 ctermbg=0
hi NoCoverage cterm=none ctermfg=darkyellow ctermbg=black
hi Statement ctermfg=darkblue
hi Identifier ctermfg=white
hi Constant ctermfg=darkgreen
hi Comment ctermfg=darkblue
