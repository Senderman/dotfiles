## set http or socks proxy environment variables

```bash
# set http proxy
export http_proxy=http://PROXYHOST:PROXYPORT

# set http proxy with user and password
export http_proxy=http://USERNAME:PASSWORD@PROXYHOST:PROXYPORT

# set http proxy with user and password (with special characters)
export http_proxy=http://`urlencode 'USERNAME'`:`urlencode 'PASSWORD'`@PROXYHOST:PROXYPORT

# set socks proxy (local DNS)
export http_proxy=socks5://PROXYHOST:PROXYPORT

# set socks proxy (remote DNS)
export http_proxy=socks5h://PROXYHOST:PROXYPORT
```

```bash
# export other env variables
export https_proxy=$http_proxy \
ftp_proxy=$http_proxy \
rsync_proxy=$http_proxy \
all_proxy=$http_proxy

# export other env variables (another way)
export {https,ftp,rsync,all}_proxy=$http_proxy

export HTTP_PROXY=$http_proxy \
HTTPS_PROXY=$http_proxy \
FTP_PROXY=$http_proxy \ 
RSYNC_PROXY=$http_proxy \
ALL_PROXY=$http_proxy \
NO_PROXY=$no_proxy

export {HTTP,HTTPS,FTP,RSYNC,ALL}_PROXY=$http_proxy

# set git http(s) proxy
git config --global http.sslverify false
git config --global http.proxy $http_proxy
git config --global https.proxy $http_proxy

# only for 'github.com'
git config --global http.https://github.com.proxy $http_proxy
```

## set ssh proxy environment variables

```bash
# use 'nc'(openbsd-netcat) with http protocol
export ssh_proxy='ProxyCommand=nc -X connect -x PROXYHOST:PROXYPORT %h %p'
# use 'nc'(nmap-netcat) with http protocol
export ssh_proxy='ProxyCommand=nc --proxy PROXYHOST:PROXYPORT %h %p'

# use 'nc'(openbsd-netcat) with http protocol and proxy user
export ssh_proxy='ProxyCommand=nc -X connect -x PROXYHOST:PROXYPORT -P 'USERNAME' %h %p'
# use 'nc'(nmap-netcat) with http protocol and proxy auth
export ssh_proxy='ProxyCommand=nc --proxy PROXYHOST:PROXYPORT --proxy-auth USERNAME:PASSWORD %h %p'

# use 'nc'(openbsd-netcat) with socks5 protocol
export ssh_proxy='ProxyCommand=nc -X 5 -x PROXYHOST:PROXYPORT %h %p'
# use 'nc'(nmap-netcat) with socks5 protocol
export ssh_proxy='ProxyCommand=nc --proxy PROXYHOST:PROXYPORT --proxy-type socks5 %h %p'

# use 'connect' with http protocol
export ssh_proxy='ProxyCommand=connect -H PROXYHOST:PROXYPORT %h %p'

# use 'connect' with http protocol and proxy user
export ssh_proxy='ProxyCommand=connect -H USER@PROXYHOST:PROXYPORT %h %p'

# use 'connect' with HTTP_PROXY environment
export ssh_proxy='ProxyCommand=connect -h %h %p'

# use 'connect' with socks5 protocol
export ssh_proxy='ProxyCommand=connect -S PROXYHOST:PROXYPORT %h %p'

# use 'connect' with socks5 protocol and user
export ssh_proxy='ProxyCommand=connect -S USER@PROXYHOST:PROXYPORT %h %p'

# use 'connect' with SOCKS5_SERVER environment
export SOCKS5_SERVER='PROXYHOST:PROXYPORT'
export SOCKS5_USER='USERNAME'
export SOCKS5_PASSWD='PASSWORD'
export ssh_proxy='ProxyCommand=connect -s %h %p'

# connect to ssh server over proxy
ssh -o "$ssh_proxy" USER@FINAL_DEST

# set git ssh proxy
git config --global core.sshCommand "ssh -o $ssh_proxy"
```

## set no proxy to ignore private network address

```bash
no_proxy="127.0.0.1,localhost,.localdomain.com"
no_proxy=$no_proxy,`echo 10.{0..255}.{0..255}.{0..255}|tr ' ' ','`
no_proxy=$no_proxy,`echo 172.{16..31}.{0..255}.{0..255}|tr ' ' ','`
no_proxy=$no_proxy,`echo 192.168.{0..255}.{0..255}|tr ' ' ','`
export no_proxy

# for more private network addresses, check following url
# https://segmentfault.com/q/1010000010521593
# https://en.wikipedia.org/wiki/Private_network
```

## unset proxy environment variables

```bash
unset http_proxy https_proxy ftp_proxy rsync_proxy all_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY RSYNC_PROXY ALL_PROXY
unset {http,https,ftp,rsync,all}_proxy {HTTP,HTTPS,FTP,RSYNC,ALL}_PROXY

git config --global --unset http.proxy
git config --global --unset https.proxy
git config --global --unset core.sshCommand

git config --global --unset http.https://github.com.proxy

unset ssh_proxy
```

