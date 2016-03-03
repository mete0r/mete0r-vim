set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
let g:vundle_default_git_proto = 'git'

Bundle 'gmarik/vundle'

" Git
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'

" syntax files
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-git'
Bundle 'vim-scripts/vim-javascript'
Bundle 'vim-scripts/vim-json-bundle'
Bundle 'guns/vim-clojure-static'
Bundle 'mxw/vim-jsx'
Bundle 'Rykka/riv.vim'

Bundle 'scrooloose/syntastic'
Bundle 'vim-flake8'
Bundle 'py-coverage'

" Experimental stuffs
"
" Unlink, etc.
Bundle 'tpope/vim-eunuch'
" Automatic adjust shiftwidth and expandtab
Bundle 'tpope/vim-sleuth'
" make tables. try \tt
Bundle 'Stormherz/tablify'
" :help gitlog
Bundle 'vim-scripts/git-log'

Bundle 'bling/vim-airline'
Bundle 'editorconfig/editorconfig-vim'

set nocompatible
set exrc
set secure
filetype off

filetype plugin indent on
syntax on
colorscheme night

"
" syntastic
"
let g:syntastic_rst_checkers = ['rstcheck']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_python_checkers = ['pylama']
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

nmap <F1> <nop>
imap <F1> <nop>
nmap <C-A> GV1G
vmap <C-C> :!xsel -ib<ENTER>u
nmap <C-V> :r!xsel -ob<ENTER>
nmap <C-X> :bd<ENTER>

if has("multi_byte")
	set fileencodings=utf-8,ucs-bom,cp949
endif

au FileType xml set sw=2 sts=2 et
au FileType html set sw=2 sts=2 et
au FileType vim set sw=8 sts=8 noet
au FileType vim map <buffer> <F5> :source %<ENTER>
au FileType rst map <buffer> <F5> :!restview %<ENTER>

cabbrev help tab help

let g:netrw_browse_split = 3
let g:netrw_winsize = -28
let g:netrw_liststype = 3
" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
	if exists("g:expl_buf_num")
		call CloseVExplorer()
	else
		Vexplore
		let g:expl_buf_num = bufnr("%")
	endif
endfunction
function! CloseVExplorer()
	if exists("g:expl_buf_num")
		if bufloaded(g:expl_buf_num)
			exec 'bd ' . g:expl_buf_num
		endif
		unlet g:expl_buf_num
	endif
endfunction
au TabEnter * call CloseVExplorer()
map <silent> <C-E> :call ToggleVExplorer()<CR>
