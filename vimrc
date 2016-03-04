set nocompatible
set exrc
set secure
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" syntax files
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-git'
Plugin 'vim-scripts/vim-json-bundle'
Plugin 'guns/vim-clojure-static'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'Rykka/riv.vim'
Plugin 'elzr/vim-json'

Plugin 'scrooloose/syntastic'
Plugin 'vim-flake8'
Plugin 'py-coverage'

" Experimental stuffs
"
" Unlink, etc.
Plugin 'tpope/vim-eunuch'
" Automatic adjust shiftwidth and expandtab
Plugin 'tpope/vim-sleuth'
" make tables. try \tt
Plugin 'Stormherz/tablify'
" :help gitlog
Plugin 'vim-scripts/git-log'

Plugin 'bling/vim-airline'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'kovisoft/slimv'

call vundle#end()

filetype plugin indent on
syntax on
colorscheme night

"
" syntastic
"
let g:syntastic_rst_checkers = ['rstcheck']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list = 1
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
	nmap <ESC><ESC> :nohlsearch<CR>:SyntasticReset<CR>
else
	nmap <ESC><ESC> :SyntasticReset<CR>
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

"
" Riv settings
"
" Use folding
let g:riv_disable_folding = 0
" Fold sections only
let g:riv_fold_level = 1
" Do not map <Tab>, <S-Tab> in normal mode
let g:riv_ignored_nmaps = "<Tab>,<S-Tab>"
