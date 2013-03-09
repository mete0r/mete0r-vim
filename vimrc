set rtp+=~/.vim/vundle/
call vundle#rc()
let g:vundle_default_git_proto = 'git'

Bundle 'tpope/vim-pathogen'

" Git
Bundle 'tpope/vim-fugitive'

" syntax files
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-git'
Bundle 'vim-scripts/vim-javascript'
Bundle 'vim-scripts/vim-json-bundle'

Bundle 'scrooloose/syntastic'
Bundle 'vim-flake8'
Bundle 'py-coverage'

" Experimental stuffs
"
" Unlink, etc.
Bundle 'tpope/vim-eunuch'
" Seek: s<c1><c2> (like f<c1>)
Bundle 'vim-scripts/vim-seek'
" Automatic adjust shiftwidth and expandtab
Bundle 'tpope/vim-sleuth'
" make tables. try \tt
Bundle 'Stormherz/tablify'
" :help gitlog
Bundle 'vim-scripts/git-log'

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set nocompatible
filetype off

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
	" 노말모드에서 <ESC> 두 번으로 하일라이팅 해제
	" (두 번으로 한 이유: <ESC> 한번으로 하면 터미널에서 특수키 시작코드와
	" 충돌한다)
	nmap <ESC><ESC> :nohlsearch<CR>
endif

if has("windows")
	nmap <TAB> :tabn<CR>
	nmap <S-TAB> :tabp<CR>

	" fugitive shortcuts
	nmap <F1><F1> :Gstatus<CR>
	nmap <F1><F2> :Git diff<CR>
	nmap <F1><F3> :Git diff %<CR>
	nmap <F1><F3><F3> :Gdiff HEAD<CR>
endif

if has("quickfix")
	nmap <C-n> :cn<CR>
	nmap <C-p> :cp<CR>
endif

if has("multi_byte")
	set fileencodings=utf-8,ucs-bom,cp949
endif
