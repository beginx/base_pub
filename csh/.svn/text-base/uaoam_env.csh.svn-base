#########################################################
# Environement for UANGEL OAM
#########################################################
setenv UASYS_HOME 		$HOME/HOME

#########################################################
# Environement for MySQL
#########################################################
#setenv MYSQL_HOME /usr/local/mysql
#setenv MYSQL_INCLUDE $MYSQL_HOME/include
#setenv MYSQL_LIB $MYSQL_HOME/lib
#setenv PATH 			${MYSQL_HOME}/bin:${PATH}

setenv PATH 			${UASYS_HOME}/bin:${PATH}
if ( $?LD_LIBRARY_PATH ) then
	setenv LD_LIBRARY_PATH  ${UASYS_HOME}/lib:${LD_LIBRARY_PATH}
else
	setenv LD_LIBRARY_PATH ${UASYS_HOME}/lib
endif
setenv SHLIB_PATH 		${LD_LIBRARY_PATH}

alias   cbin	'cd $UASYS_HOME/bin'
alias   clib	'cd $UASYS_HOME/lib'
alias   cdata	'cd $UASYS_HOME/data'
alias   clog	'cd $UASYS_HOME/log'
alias   run		'source ~/.cshrc'
