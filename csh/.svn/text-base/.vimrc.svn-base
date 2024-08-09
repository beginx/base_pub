set ai
set wrap
set cindent
set showmatch
set tabstop=4
set shiftwidth=4
set makeprg=jam
:command -nargs=? Jam :!jam <args> |& tee /tmp/jam
set bg=dark
syntax on

set tags=~/tags,$HOME/UAHLR/tags,$HOME/uaoss/tags,$HOME/setup/tags

set tagrelative
"set paste

"set ruler
"set paste
"set sm " show matched paranthesis
"set incsearch

"hi Comment ctermbg=black ctermfg=LightGray
"hi Search ctermbg=LightGray ctermfg=black

"syntax highligh

:if has("terminfo")
:  set t_Co=16
:  set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
:  set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
:else
:  set t_Co=16
:  set t_Sf=[3%dm
:  set t_Sb=[4%dm
:endif
syntax on
hi comment ctermfg=cyan
:colorscheme desert

: map <F1> K
: map <F3> [i
: map <F5> :25vs ./<CR>^ww
: map <F7> O

set ruler

if has("autocmd")
"Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")
