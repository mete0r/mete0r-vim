runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

filetype plugin indent on
syntax on
colorscheme night

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
	set statusline=
	set statusline+=%-5r%f
	set statusline+=\ %3(%#StatusLineError#%m%*%)
	set statusline+=\ %{fugitive#statusline()}
	set statusline+=%=
	set statusline+=%#StatusLineError#%{SyntasticStatuslineFlag()}%*
	set statusline+=\ %c%-3(%V%)\ %3p%%
	set laststatus=2
endif

if has("extra_search")
	set hlsearch
	" 노말모드에서 <ESC>로 하일라이팅 해제
	nmap <ESC> :nohlsearch<CR>
endif

if has("windows")
	nmap <TAB> :tabn<CR>
	nmap <S-TAB> :tabp<CR>
endif

if has("multi_byte")
	set fileencodings=utf-8,ucs-bom,cp949
endif
