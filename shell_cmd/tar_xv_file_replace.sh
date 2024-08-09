#!/bin/bash

DATE=`date +%Y%m%d_%H%M`

if [ -z "$1" ]
  then
    echo "use example : "
    echo "${0} 20160831_0513_tros3.tar"
    exit;
fi



#sed 's/58\.102\.122\.166\:8090\"\,API_PATH\:\"\/tros\"/218\.39\.67\.234\:20030\"\,API_PATH\:\"\"/g' ./tros3/scripts/app.min.js > app.min.js

if [ "$2" = "0" ]; then 
	mv ./tros0 ./tros0_${DATE}
	tar xf ./$1 -C ./tmp
	sed 's/58\.102\.122\.166\:8090\"\,API_PATH\:\"\/tros\"/58\.102\.122\.57\:10019\"\,API_PATH\:\"\"/g' ./tmp/tros3/scripts/app.min.js > app.tmp.js
	#tros0 58.102.122.57:10019  API_PATH:""
	sed 's/\/tros3/\/tros0/g' ./tmp/tros3/default.html > default.html
	sed 's/\/tros3/\/tros0/g' ./tmp/tros3/index.html > index.html 
	sed 's/\/tros3/\/tros0/g' app.tmp.js > app.tmp0.js
	mv ./tmp/tros3 ./tmp/tros0
	mv app.tmp0.js ./tmp/tros0/scripts/app.min.js
	mv index.html ./tmp/tros0/index.html	
	mv default.html ./tmp/tros0/default.html	
	rm app.tmp.js
	mv ./tmp/tros0 ./
	
else 
	mv ./tros3 ./tros3_${DATE}
	tar xf ./$1  -C ./tmp
	#tros3 10.40.100.82:8080  API_PATH:""
	sed 's/58\.102\.122\.166\:8090\"\,API_PATH\:\"\/tros\"/10\.40\.100\.82\:8080\"\,API_PATH\:\"\"/g' ./tmp/tros3/scripts/app.min.js > app.tmp.js
	mv app.tmp.js ./tmp/tros3/scripts/app.min.js
	mv ./tmp/tros3 ./
fi 



echo "process done."
