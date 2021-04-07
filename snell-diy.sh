#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
#export PATH

#apt-get update
#yum update

#apt install apt-get -y
apt-get install wget -y
yum install wget -y

wget --no-check-certificate -O snell.zip https://github.com/surge-networks/snell/releases/download/v2.0.4/snell-server-v2.0.4-linux-amd64.zip
#wget --no-check-certificate -O snell.service https://github.com/surge-networks/snell/raw/master/systemd-example

wget --no-check-certificate -O snell.service https://raw.githubusercontent.com/NinjaOSX/snl/main/systemd-example

apt-get install unzip -y
yum install unzip -y 

unzip -o -q snell.zip
rm -f snell.zip

echo "y" > snell_new.config #写入y
chmod +x snell-server
./snell-server < snell_new.config 
rm -f snell_new.config 

mv -f snell-server /usr/local/bin/
mv -f snell-server.conf /etc/
mv -f snell.service /lib/systemd/system/

systemctl daemon-reload
systemctl enable snell.service
systemctl start snell.service

sudo ufw disable
sudo systemctl stop firewalld.service
sudo systemctl disable firewalld.service

# clear
cat /etc/snell-server.conf

systemctl status snell.service
