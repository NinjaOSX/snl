debug()
{
echo "Press any key to continue or Press ctrl+c to exit..."
read anything
}

debug

apt install apt-get -y
debug

apt-get install wget -y
debug

yum install wget -y
debug

wget --no-check-certificate -O snell.zip https://github.com/surge-networks/snell/releases/download/v2.0.3/snell-server-v2.0.3-linux-amd64.zip
debug

wget --no-check-certificate -O snell.service https://github.com/surge-networks/snell/raw/master/systemd-example
debug

#wget --no-check-certificate -O snell.service https://raw.githubusercontent.com/NinjaOSX/snl/main/systemd-example

apt-get install unzip -y
debug

yum install unzip -y 
debug

unzip -o -q snell.zip
debug

rm -f snell.zip
debug

# echo "y" > snell.new.config #写入y
# chmod +x snell-server
# ./snell-server < snell.new.config 
# rm -f snell.new.config 

systemctl stop snell.service
debug

chmod +x snell-server
debug

yes=“y”
debug

./snell-server < $yes
debug

mv -f snell-server /usr/local/bin/
mv -f snell-server.conf /etc/
mv -f snell.service /lib/systemd/system/
debug

sudo systemctl daemon-reload
sudo systemctl enable snell.service
sudo systemctl start snell.service
debug

#clear
cat /etc/snell-server.conf
