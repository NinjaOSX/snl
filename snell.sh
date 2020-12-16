apt install apt-get -y
apt-get install wget -y

yum install wget -y

wget --no-check-certificate -O snell.zip https://github.com/surge-networks/snell/releases/download/v2.0.3/snell-server-v2.0.3-linux-amd64.zip
wget --no-check-certificate -O snell.service https://github.com/surge-networks/snell/raw/master/systemd-example

#wget --no-check-certificate -O snell.service https://raw.githubusercontent.com/NinjaOSX/snl/main/systemd-example

apt-get install unzip -y
yum install unzip -y 

unzip -o -q snell.zip
rm -f snell.zip

echo "y" > snell.new.config #写入y
chmod +x snell-server
./snell-server < snell.new.config 
rm -f snell.new.config 

mv -f snell-server /usr/local/bin/
mv -f snell-server.conf /etc/
mv -f snell.service /lib/systemd/system/

sudo systemctl daemon-reload
sudo systemctl enable snell.service
sudo systemctl start snell.service

clear
cat /etc/snell-server.conf
