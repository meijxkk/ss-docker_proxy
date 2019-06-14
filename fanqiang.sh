#!/bin/bash
start_ss(){
	sslocal -c /etc/shadowsocks.json -d start
	systemctl start privoxy
	export http_proxy=http://127.0.0.1:8118
	export https_proxy=http://127.0.0.1:8118
	export ftp_proxy=http://127.0.0.1:8118
	export no_proxy=127.0.0.1,localhost,10.20.0.47
}

stop_ss(){
	pid=`ps aux|grep -v grep|grep sslocal|awk '{print $2}'`
	systemctl stop privoxy
	export http_proxy=
        export https_proxy=
        export ftp_proxy=
	export no_proxy=
	kill $pid
}

case $1 in 
start)
	start_ss;;
stop)
	stop_ss;;
*)
	echo 'use (start|stop)'
esac
