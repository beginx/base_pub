# @(#)Cshrc 1.6 91/09/05 SMI
#################################################################
#
#         .cshrc file
#
#         initial setup file for both interactive and noninteractive
#         C-Shells
#
#################################################################

# 	\!:1	1st argv
# 	\!:2	2nd argv
# 	\!:-2	~2nd argv
# 	\!:2-4	2~4th argv
# 	\!:2-*	2~ argv
# 	\!:$ 	last argv
# 	\!:* 	all argv (== \!:-$)
# 	\!:1-	all except the last argv
# 	\!:-	all except the last argv
setenv LANG "ko_KR.eucKR"
setenv UNIX95 "ps -e -o vsz,pid,ruser,args | sort -rn | more"
setenv SYSTYPE HPUX
setenv ACE_ROOT /usr/local/ACE_wrappers
#setenv PINE_HOME /data2/ktmsp/pine

#setenv LPATH /usr/lib:/opt/langtools/lib
#setenv SHLIB_PATH /usr/lib:/opt/langtools/lib

setenv LD_LIBRARY_PATH $HOME/HOME/lib:/usr/local/lib:/usr/lib:$HOME/script:/home/sktoam/UALIB/src/ualib/lib
setenv TZ KST-9

set path = (.  ~/ ~/bin ~/script /sbin /usr/sbin /usr/local/bin /usr/bin /usr/sbin /bin /usr/ccs/lbin /usr/atria/bin /opt/aCC/bin ~/script )
set path = ($path /opt/sfw/bin /usr/ccs/bin /opt/langtools/bin/ /opt/aCC/bin/ /opt/perl/bin /usr/contrib/bin)
set path = ($path $HOME/UALIB/include $HOME/OAM/local )


	
limit coredumpsize unlimited

source ~/uaoss/uaoam/env/uaoam_env.csh
source ~/uaoss/uaoam/env/uaoam_dev.csh
#source ~/srgpkg/usrg/etc/usrg_dev.csh
#source ~/srgpkg/usrg/etc/usrg_env.csh

source ~/.cshrc.coam

	if ( $?prompt ) then # interactive shell
		setenv LS_COLORS "ln=01;34:di=01;33:*.gz=01;35:*.Z=01;35:*.tar=01;31:*.c=01;33:*.h=01;33:*.cc=01;33:*.hh=01;33:"
		#setenv LS_COLORS "ln=01;01:di=01;33:*.gz=01;35:*.Z=01;35:*.tar=01;31:*.c=01;33:*.h=01;33:*.cc=01;33:*.hh=01;33:"
		#setenv TERM vt100
		#setenv TERM vt100
		setenv TERM linux
		setenv EDITOR vi

		# cd path
		set lcd = ( )  #  add parents of frequently used directories
		set cdpath = (.. ~ ~/bin )
		set noclobber

		stty erase 
		stty intr 
		stty -istrip


		# aliases for all shells
		alias cd            'cd \!*;echo $cwd'
		alias cp            'cp -i'
		alias mv            'mv -i'
		alias rm            'rm -i'
#		alias vi			'vim'
		alias pwd           'echo $cwd'
		alias hostid        'echo `uname -i` 16op | dc'

		set filec
		set fignore =(.o .bak .old)
		set history=40
		set ignoreeof
		set savehist=40
		set prompt="`hostname` [ $LOGNAME {\!} `dirs`] "

		alias la            'ls -a'
		alias ll            'ls -la'
		alias ls           'ls -F --show-control-chars --color=auto'
#alias ls			'gnuls --color=always'

		alias so	'source ~/.cshrc'

		alias cd 	'cd \!*; set prompt="`hostname` [ $LOGNAME {\!} `dirs`] "'
		alias gr	'find . \( -name "\!:2" \) -exec grep \!:1 {} \; -print '
		alias rmr	'find . \( -name "\!:1" \) -exec rm {} \; -print '
		alias rg	'find . -type f \( -name "\!:2" \) -print |xargs grep -F -n \!:1'
		alias src_wc	'find . \( -name "\!:2" \) -exec wc \!:1 {} \; -print '
		
		alias go2l 'cd ~/OAM/src/TOOL'
		alias gobin 'cd ~/HOME/bin'
		#source /opt/rational/purifyplus_setup.csh
		alias so    'source $HOME/.cshrc'
		alias mktag	'ctags -R OAM UALIB uaoam ualib ~/uaoss/project/SKTSCP/HASMP/* /usr/include/* ~/sysstat-9.1.7/*'

		unset autologout
	endif
