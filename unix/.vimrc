
set nocompatible

syntax enable
filetype plugin on
filetype plugin indent on

set path+=**
set wildmenu
set et
set ts=4
set sw=4

command! MakeTags !ctags -R .

"let g:netrw_banner=0
"let g:netrw_browse_split=4
"let g:netrw_altv=4
"let g:netrw_liststyle=3
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

let g:Grep_Skip_Dirs='.git'
let Grep_Path = '/usr//local/bin/ggrep' 
let Grep_OpenQuickfixWindow = 1
let Grep_Default_Options = '-rn'

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
"Plugin 'flazz/vim-colorschemes'
"Plugin 'lokaltog/vim-powerline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'pangloss/vim-javascript'
"Plugin 'valloric/youcompleteme'
Plugin 'wincent/command-t'
Plugin 'tpope/vim-fugitive'
"Plugin 'FuzzyFinder'
Plugin 'godlygeek/csapprox'
call vundle#end()            " required


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"General  {{{
set mouse=a

set wildmenu
set wildignore=*.dll,*.o,*.pyc,*.png

set clipboard+=unnamed,unnamedplus,autoselect
set backup
set backupdir=~/.vim/tmp/backup
set directory=~/.vim/tmp/swap
set undodir=~/.vim/tmp/undo
set gdefault
set undofile 
set hidden
"}}}



"Mappings {{{
	nnoremap <space> za "fold
	inoremap <F1> <ESC>
	nnoremap <F1> <ESC>
	vnoremap <F1> <ESC>

	map <F5> :Run<CR>
"}}}

"Leader Mappings {{{
	let mapleader = ","
	nmap <leader><space> :noh<cr>
	nnoremap <leader>ev <C-w>
	nnoremap <leader>= ggVG=
	nnoremap <leader>p :set paste<cr> 
"}}}


"UI {{{
" for vim-airline
	let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
"	let g:airline_theme='molokai'
	let g:airline_theme='cool'
	set laststatus=2 " turn on bottom bar
	"colorscheme monokai
	"	colorscheme tir_black
	"	set background=dark
	language en_US.UTF-8
	let g:Powerline_symbols = 'fancy'
	set laststatus=2
	let t_Co=256
	set t_Co=256
	set linespace=0
	set report=0
	"	set list
	set ruler
	colorscheme kiwi
	"colorscheme glowfish
	"colorscheme legacy
"}}}
"
"
"


