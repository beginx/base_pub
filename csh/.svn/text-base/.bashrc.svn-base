# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
export PATH=/sbin:/usr/sbin:/usr/local/bin:/usr/bin:/bin
export LD_LIBRARY_PATH=/usr/lib/hpux64:/usr/local/lib/hpux64:/usr/local/lib:/usr/lib
export LPATH=/usr/lib/hpux64:/usr/local/lib/hpux64:/usr/local/lib:/usr/lib 

source ~/uaoss/uaoam/env/uaoam_dev.sh
source ~/uaoss/uaoam/env/uaoam_env.sh
stty erase ^H
export TERM=vt100
export LANG=C
export LC_CTYPE=ko_KR.eucKR
export EDITOR="vim -X"
export PS1="\h [ \u{\!} \w ] "
function telnet { telnet -e ! $* ; }
function gr { arg1="$1"; arg2="$2"; find . -name $arg2 | xargs grep -n $arg1; }
alias   vi='vim -X'
