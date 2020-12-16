debug()
{
echo $*
echo "Press Enter  to continue or Ctrl+C to exit ..."
read anything
}

clear
debug READY!

#debug apt install apt-get -y
apt install apt-get -y

#debug apt-get install wget -y
apt-get install wget -y

#debug yum install wget -y
yum install wget -y

#dubug wget --no-check-certificate -O snell.zip https://github.com/surge-networks/snell/releases/download/v2.0.3/snell-server-v2.0.3-linux-amd64.zip
wget --no-check-certificate -O snell.zip https://github.com/surge-networks/snell/releases/download/v2.0.3/snell-server-v2.0.3-linux-amd64.zip

#debug wget --no-check-certificate -O snell.service https://github.com/surge-networks/snell/raw/master/systemd-example
wget --no-check-certificate -O snell.service https://github.com/surge-networks/snell/raw/master/systemd-example


####wget --no-check-certificate -O snell.service https://raw.githubusercontent.com/NinjaOSX/snl/main/systemd-example

#debug apt-get install unzip -y
apt-get install unzip -y

#debug yum install unzip -y 
yum install unzip -y 

#debug unzip -o -q snell.zip
unzip -o -q snell.zip

#debug rm -f snell.zip
rm -f snell.zip

#debug systemctl stop snell.service
systemctl stop snell.service

echo "y" > snell_new.config #写入y
chmod +x snell-server
./snell-server < snell_new.config 
# rm -f snell_new.config 


#debug chmod +x snell-server
#chmod +x snell-server

###debug yes=“y”
###_yes=“y”

###debug "./snell-server < $yes"
###./snell-server --wizard < ${_yes}

#debug mv -f snell-server /usr/local/bin/
mv -f snell-server /usr/local/bin/
mv -f snell-server.conf /etc/
mv -f snell.service /lib/systemd/system/

#debug sudo systemctl daemon-reload
sudo systemctl daemon-reload
sudo systemctl enable snell.service
sudo systemctl start snell.service


#clear

debug cat /etc/snell-server.conf
cat /etc/snell-server.conf
