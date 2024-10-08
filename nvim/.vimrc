set nocompatible
syntax enable
filetype plugin on

set path+=**
set wildmenu
set wildignore+=.git/**,*.pyc

command! MakeTags !ctags -R .
command! MakeJsTags !ctags --languages=JavaScript --exclude=".git" -f ~/.tag/jstags -R ~/tros/ui/app
command! MakeJavasTags !ctags --languages=Java --exclude=".git" -f ~/.tag/javatags -R ~/tros/core

"command! MakeJavasTags !ctags --languages=Java -f ~/.tag/javatags -R ~/tros/core $JAVA_HOME/src

let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=4
let g:netrw_liststyle=3
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'


nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

set noimd

set history=1000
set mouse=h
syntax sync minlines=200
set clipboard=unnamed

set noswapfile
set nobackup
set nowb

"colorscheme molokayo
"colorscheme grb256
"colorscheme molokai
"colorscheme CodeSchool3

set t_Co=256

imap <C-p> <Esc>:w<CR>:!python3 %<CR>

set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'scrooloose/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'leafgarland/typescript-vim'
call plug#end()

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

set grepprg=rg\ --vimgrep
