
#########################################################
# Environement for UANGEL OAM
#########################################################
export UASYS_HOME=$HOME/HOME

#########################################################
# Environement for MySQL
#########################################################
#export MYSQL_HOME=
#export MYSQL_HOME=/usr/local/mysql
#export MYSQL_INCLUDE=$MYSQL_HOME/include
#export MYSQL_LIB=$MYSQL_HOME/lib
#export PATH=${MYSQL_HOME}/bin:${PATH}

export PATH=${UASYS_HOME}/bin:${PATH}
export LD_LIBRARY_PATH=${UASYS_HOME}/lib:${LD_LIBRARY_PATH}
export SHLIB_PATH=${LD_LIBRARY_PATH}

alias	cbin='cd $UASYS_HOME/bin'
alias	clib='cd $UASYS_HOME/lib'
alias	cdata='cd $UASYS_HOME/data'
alias	clog='cd $UASYS_HOME/log'
alias   run='source ~/.bashrc'

