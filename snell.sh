#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin

SYSTEMD="/lib/systemd/system/snell.service"

debug()
{
echo $*
echo "Press Enter  to continue or Ctrl+C to exit ..."
read anything
}

clear
#debug READY!

#apt-get update
#yum update

#debug apt install apt-get -y
#apt install apt-get -y

#debug apt-get install wget -y
apt install wget -y

#debug yum install wget -y
yum install wget -y

#dubug wget --no-check-certificate -O snell.zip https://github.com/surge-networks/snell/releases/download/v2.0.3/snell-server-v2.0.3-linux-amd64.zip
wget --no-check-certificate -O snell.zip https://github.com/surge-networks/snell/releases/download/v2.0.3/snell-server-v2.0.3-linux-amd64.zip

#debug wget --no-check-certificate -O snell.service https://github.com/surge-networks/snell/raw/master/systemd-example
# wget --no-check-certificate -O snell.service https://github.com/surge-networks/snell/raw/master/systemd-example



####wget --no-check-certificate -O snell.service https://raw.githubusercontent.com/NinjaOSX/snl/main/systemd-example

#debug apt-get install unzip -y
apt install unzip -y

#debug yum install unzip -y 
yum install unzip -y 

#debug unzip -o -q snell.zip
unzip -o -q snell.zip

#debug rm -f snell.zip
rm -f snell.zip

#debug systemctl stop snell.service
####systemctl stop snell.service

echo "y" > snell.wizard #写入y
chmod +x snell-server
./snell-server < snell.wizard 
rm -f snell.wizard 


#debug mv -f snell-server /usr/local/bin/
mv -f snell-server /usr/local/bin/
mv -f snell-server.conf /etc/
# mv -f snell.service /lib/systemd/system/

echo "[Unit]" >>${SYSTEMD}
echo "Description=Snell Proxy Service" >>${SYSTEMD}
echo "After=network.target" >>${SYSTEMD}
echo "" >>${SYSTEMD}
echo "[Service]" >>${SYSTEMD}
echo "Type=simple" >>${SYSTEMD}
echo "LimitNOFILE=32768" >>${SYSTEMD}
echo "ExecStart=/usr/local/bin/snell-server -c /etc/snell-server.conf" >>${SYSTEMD}
echo "" >>${SYSTEMD}
echo "[Install]" >>${SYSTEMD}
echo "WantedBy=multi-user.target" >>${SYSTEMD}

#debug sudo systemctl daemon-reload
sudo systemctl daemon-reload
sudo systemctl enable snell.service
sudo systemctl start snell.service

sudo ufw disable
sudo systemctl stop firewalld.service
sudo systemctl disable firewalld.service

#clear

####debug cat /etc/snell-server.conf
cat /etc/snell-server.conf
