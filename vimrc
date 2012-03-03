runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

filetype plugin indent on

"
" syntax coloring
"
syntax on
hi Normal ctermfg=gray
hi SignColumn ctermfg=none ctermbg=none
hi Search ctermfg=cyan ctermbg=blue
hi Folded ctermfg=darkgray ctermbg=none
hi Statement ctermfg=darkblue
hi Identifier ctermfg=white
hi Constant ctermfg=darkgreen
hi Comment ctermfg=darkblue

"
" syntastic
"
let g:syntastic_python_checker = 'pyflakes'
let g:syntastic_check_on_open = 1
let g:syntastic_stl_format='%E{ Errors:%e}%W{ Warns:%w} at %F'

"
" StatusLine with syntastic
"
if has('statusline')
	hi StatusLine cterm=none ctermfg=white ctermbg=black
	hi StatusLineNC cterm=none ctermfg=gray ctermbg=black
	hi StatusLineError ctermfg=red ctermbg=black
	set statusline=
	set statusline+=%f:%l,%c
	set statusline+=%5r%4m
	set statusline+=%=
	set statusline+=%#StatusLineError#%{SyntasticStatuslineFlag()}%*
	set statusline+=%4p%%
	set laststatus=2
endif

if has("extra_search")
	set hlsearch
	" 노말모드에서 <ESC>로 하일라이팅 해제
	nmap <ESC> :nohlsearch<ENTER>
endif
