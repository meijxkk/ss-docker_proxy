# ss-docker_proxy
国内docker 拉取国外镜像时需要用到的代理方法


# 1.搭建ss服务器

yum install -y epel-release


yum install -y python-pip 

pip install shadowsocks

vim /etc/shadowsocks.json

	{

	"server":"0.0.0.0",

	"server_port":端口,

	"local_address":"127.0.0.1",

	"password":"密码",

	"timeout":300,

	"method":"aes-256-cfb",

	"fast_open":false,

	"workers":1

	}

ssserver -c /etc/shadowsocks.json -d start 

# 2.在本机搭建ss客户端

yum install -y epel-release

yum install -y python-pip 

pip install shadowsocks

vim /etc/shadowsocks.json

	{
	  "server":"SS服务端IP",
	  
	  
	  "local_address": "127.0.0.1",
	  
	  "local_port":1080,
	  
	  "server_port":SS服务端port,
	  
	  "password":"SS服务端密码",
	  
	  "timeout":300,
	  
	  "method":"aes-256-cfb"
	}

sslocal -c /etc/shadowsocks.json -d start

# 3.在本机配置代理

yum install -y privoxy

vim /etc/privoxy/config

	forward-socks5t   /               127.0.0.1:1080 . #加上

systemctl start privoxy

# 4.改环境变量
运行

	source fanqiang.sh start



# 5.改docker环境变量
运行

	./dockersetproxy.sh on



# 关闭
########################################################################################

关闭时运行

	source fanqiang.sh stop

	./dockersetproxy.sh off 

即可