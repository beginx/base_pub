echo 'read .profile'

alias ls='ls -altr --color=auto'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vi='nvim'

export ALOGIN_ROOT=~/env/alogin
source ~/env/alogin/alogin_env.sh

export PATH=$JAVA_HOME/bin:~/script:$PATH:
export DISPLAY=:0
export LIBGL_ALWAYS_INDIRECT=1
#export PULSE_SERVER=localhost

export LANG=ko_KR.UTF-8
export EDITOR=nvim

PS1='${debian_chroot:+($debian_chroot)}\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\W\[\033[m\]\$ '
