#!/usr/bin/env bash
#PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
#export PATH

#Update OS
#apt-get update
#yum update

#apt install apt-get -y
apt-get install wget -y
yum install wget -y

wget --no-check-certificate -O snell.zip https://dl.nssurge.com/snell/snell-server-v4.0.0-linux-amd64.zip
wget --no-check-certificate -O snell.service https://raw.githubusercontent.com/NinjaOSX/snl/main/systemd-example

apt-get install unzip -y
yum install unzip -y 

unzip -o -q snell.zip
rm -f snell.zip

echo "y" > snell.yes #写入y
chmod +x snell-server
./snell-server < snell.yes 
rm -f snell.yes 

mv -f snell-server /usr/local/bin/
mv -f snell-server.conf /etc/
mv -f snell.service /lib/systemd/system/

systemctl daemon-reload
systemctl enable snell.service
systemctl start snell.service

#关闭防火墙
#sudo ufw disable
#sudo systemctl stop firewalld.service
#sudo systemctl disable firewalld.service

clear
echo "Snell 安装完毕，下面是账号信息"
echo ""
cat /etc/snell-server.conf
echo ""

echo "检查 Snell 状态可执行命令："
echo "systemctl status snell.service"
echo "按 ctrl+c 返回终端界面"
