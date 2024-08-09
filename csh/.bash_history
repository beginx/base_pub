ls -altr
scp -p -P 30022 basie@192.168.1.17:/home/basie/a.aar
scp -p -P 30022 basie@192.168.1.17:/home/basie/a.tar .
tar xvf a.tar
ls
chsh -s /bin/tcsh
exit
