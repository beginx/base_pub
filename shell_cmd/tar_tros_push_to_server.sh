#!/bin/bash

DATE=`date +%Y%m%d_%H%M`
tar cvf ${DATE}_tros3.tar \
./tros3/guide/ \
./tros3/assets/ \
./tros3/tutorial/ \
./tros3/index.html \
./tros3/app/ \
./tros3/README \
./tros3/version.json \
./tros3/default.html \
./tros3/css/ \
./tros3/images/  \
./tros3/scripts/  \

if [ "$1" = "br" ]; then 
	echo "scp ./${DATE}_tros3.tar tros3@58.102.122.57:/home/tros3/"
	scp ./${DATE}_tros3.tar tros3@58.102.122.57:/home/tros3/
	
else 
	echo "scp -P 10022 ./${DATE}_tros3.tar root@218.39.67.234:/var/www/"
	scp -P 10022 ./${DATE}_tros3.tar root@218.39.67.234:/var/www/
fi 
