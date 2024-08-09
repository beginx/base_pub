###################################################
#
#  UANGEL OSS DEVELOPMENT ENVIRONMENT
#
###################################################

###################################################
# Environment for ualib uaoam
##################################################
#setenv UASYS_MODEL			`uname -m`
#setenv UASYS_64BIT			TRUE

setenv UAOSS_DEV_HOME		$HOME/uaoss
setenv UALIB_DEV_HOME		$UAOSS_DEV_HOME/ualib
setenv UAOAM_DEV_HOME		$UAOSS_DEV_HOME/uaoam
setenv UAOAM_PROJECT_HOME	$UAOSS_DEV_HOME/project
setenv UAOAM_PRODUCT_HOME	$UAOSS_DEV_HOME/product
setenv UAOAM_EXTLIB_HOME	$UAOSS_DEV_HOME/extlib

setenv UASYS_PRODUCT        OMP_SERVER
setenv UASYS_RELEASE        COMMON

setenv PATH                 ${PATH}:$UAOAM_DEV_HOME/tools

#########################################################
# Environement for MySQL
#########################################################
setenv MYSQL_HOME			/usr/local/mysql
setenv MYSQL_INCLUDE		$MYSQL_HOME/include
setenv MYSQL_LIB			$MYSQL_HOME/lib

setenv PATH					${MYSQL_HOME}/bin:${PATH}
#export LD_LIBRARY_PATH=${MYSQL_HOME}/lib:${LD_LIBRARY_PATH}


#########################################################
# alias for safetty & convenience
#########################################################

alias cualib		'cd $HOME/uaoss/ualib'
alias cuaoam		'cd $HOME/uaoss/uaoam'
alias cextlib		'cd $HOME/uaoss/extlib'
alias cextpkg		'cd $HOME/uaoss/extpkg'
alias ctselscp		'cd $HOME/uaoss/project/TSELSCP'

alias cualibs		'cd $UALIB_DEV_HOME/src/ualib'
alias cualibi		'cd $UALIB_DEV_HOME/include/ualib'
alias cuasock		'cd $UALIB_DEV_HOME/src/uasock'
alias cuasocki		'cd $UALIB_DEV_HOME/include/uasock'
alias cuammc		'cd $UALIB_DEV_HOME/src/uammc'
alias cuammci		'cd $UALIB_DEV_HOME/include/uammc'
alias cuaoamifs		'cd $UALIB_DEV_HOME/src/uaoamif'
alias cuaoamifi		'cd $UALIB_DEV_HOME/include/uaoamif'
alias ctools		'cd $UALIB_DEV_HOME/src/tools'

alias cuaoams		'cd $UAOAM_DEV_HOME/libsrc/uaoam'
alias cuaoami		'cd $UAOAM_DEV_HOME/include/uaoam'
alias cuaxml		'cd $UAOAM_DEV_HOME/libsrc/uaxml'
alias cuaxmli		'cd $UAOAM_DEV_HOME/include/uaxml'
alias cuastat		'cd $UAOAM_DEV_HOME/libsrc/uastat'
alias cuarts		'cd $UAOAM_DEV_HOME/libsrc/uarts'
alias cuartsi		'cd $UAOAM_DEV_HOME/include/uarts'
alias cuamysql		'cd $UAOAM_DEV_HOME/libsrc/uamysql'
alias cuamysqli		'cd $UAOAM_DEV_HOME/include/uamysql'
alias cuacalc		'cd $UAOAM_DEV_HOME/libsrc/uacalc'
alias cuacalci		'cd $UAOAM_DEV_HOME/include/uacalc'
alias cuamhand		'cd $UAOAM_DEV_HOME/libsrc/uamhand'
alias cuamhandi		'cd $UAOAM_DEV_HOME/include/uamhand'
alias cuampcid		'cd $UAOAM_DEV_HOME/libsrc/uampcid'
alias cuaomscid		'cd $UAOAM_DEV_HOME/libsrc/uaomscid'
alias cuaprn		'cd $UAOAM_DEV_HOME/libsrc/uaprn'
alias cuacrypt		'cd $UAOAM_DEV_HOME/libsrc/uacrypt'
alias cuacrypti		'cd $UAOAM_DEV_HOME/include/uacrypt'

alias cuasamd		'cd $UAOAM_DEV_HOME/src/uasamd'
alias comsib		'cd $UAOAM_DEV_HOME/src/omsib'
alias clogib		'cd $UAOAM_DEV_HOME/src/logib'
alias comsd			'cd $UAOAM_DEV_HOME/src/omsd'
alias comsproxy		'cd $UAOAM_DEV_HOME/src/omsproxy'
alias comc			'cd $UAOAM_DEV_HOME/src/omc'
alias cstsd			'cd $UAOAM_DEV_HOME/src/stsd'
alias clogmd		'cd $UAOAM_DEV_HOME/src/logmd'
alias csumd			'cd $UAOAM_DEV_HOME/src/sumd'
alias cmmcd			'cd $UAOAM_DEV_HOME/src/mmcd'
alias cmess			'cd $UAOAM_DEV_HOME/src/messhand'
alias cnmsib		'cd $UAOAM_DEV_HOME/src/nmsib'
alias crmi			'cd $UAOAM_DEV_HOME/src/mmcd/rmi'
alias cftrd			'cd $UAOAM_DEV_HOME/src/ftrd'
alias cschedd		'cd $UAOAM_DEV_HOME/src/schedd'
alias cnotiib		'cd $UAOAM_DEV_HOME/src/notiib'

alias csktscp		'cd $HOME/uaoss/project/SKTSCP'
alias csktsdp		'cd $HOME/uaoss/project/SKTSDP'
alias csktsmp		'cd $HOME/uaoss/project/SKTSMP'
alias cuasnmp		'cd $HOME/uaoss/product/UASNMP'
alias coms			'cd $HOME/uaoss/product/OMS'
alias cuaguard		'cd $HOME/uaoss/product/UAGUARD/src/uaguard'
alias chaguard		'cd $HOME/uaoss/product/HAGUARD/src/haguard'

alias csigmgt		'cd $HOME/uaoss/product/SIGTRAN/src/sigmgt'
alias cusrg			'cd $HOME/uaoss/product/USRG'
alias cusrgmgt		'cd $HOME/uaoss/product/USRG/src/usrgmgt'
alias cusnmpd		'cd $HOME/uaoss/product/UASNMP/src/usnmpd'
alias cuanmsd		'cd $HOME/uaoss/product/UANMSD/src/uanmsd'
alias csmppib		'cd $HOME/uaoss/product/SMPP/src/smppib'
