
set nocompatible
syntax enable
set ts=4

filetype plugin on

set path+=**
set wildmenu

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

set wildignore+=app.min.js,.git,*.class

let g:Grep_Skip_Dirs='.git'
let Grep_Skip_Files = '*.class *.bak *~ app.min.js *.log' 
let Grep_Path = '/usr/local/bin/ggrep'
let Grep_OpenQuickfixWindow = 1
let Grep_Default_Options = '-i'

set tags=./tags
"set tags=./tags;~/.tag/jstags;~/.tag/javatags
set tags=./tags,~/.tag/javatags


let $USERCNF = $VIM.'/env/vim/user.vim'

if filereadable($USERCNF)
    source $USERCNF
endif
