#!/bin/bash
#hosts="192.168.1.11 192.168.12"
#hostUser="dongli"
#hostPem="/user/local/pem/dong.li.pem"
#paths="/user/local/*.log /user/share/*.log"
str="\."

function vaildate () {
	if [ "${hosts}" == "" ]; then
	     echo "please setup hosts"
	     exit 0
	elif [ "${hostUser}" == "" ]; then
	     echo "please setup hostUser"
	     exit 0
	elif [ "${hostPem}" == "" ]; then
	     echo "please setup hostPem"
	     exit 0
	elif [ "${paths}" == "" ]; then
	     echo "please setup paths"
	     exit 0
	else 
	     echo "params is ok!"
	fi
         
	for path in $paths
	do
	    echo $path
	    if [[ $path =~ $str ]]; then
	      echo 'path is ok'
	    else
	      echo "path must end with `.` filename. example: test.md"
	      exit 0
	    fi
	done
}

function deplay () {
	for host in $hosts
       	do
	     for path in $paths
		  do
	           # echo ${host}
		   # echo ${path}
		    count=$(find /home/dongli/test/dongli2/*.md | wc -l)
		    if [[ $count -lt  0 ]]; then
			 echo "not find files: ${count}"
			 exit 0
		    else
			 srm -vf /home/dongli/test/dongli2/*.md 
			 echo "files is count : ${count}"
	            fi
		  done
	done
}

vaildate
echo "params is: { hosts=[${hosts}] hostUser=${hostUser} hostPem=${hostPem} paths=[${paths}] } "
#deplay
