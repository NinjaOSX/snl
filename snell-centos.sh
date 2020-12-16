wget --no-check-certificate -O snell.zip https://github.com/surge-networks/snell/releases/download/v2.0.3/snell-server-v2.0.3-linux-amd64.zip
# wget --no-check-certificate -O snell.service https://github.com/surge-networks/snell/raw/master/systemd-example
wget --no-check-certificate -O snell.service https://raw.githubusercontent.com/NinjaOSX/snl/main/systemd-example
yum install unzip -y 
unzip -o -q snell.zip
rm -f snell.zip
echo "y" > snell.new.config
chmod +x snell-server
./snell-server < snell.new.config 
rm -f snell.new.config 
mv -f snell-server /usr/local/bin/
mv -f snell-server.conf /etc/
mv -f snell.service /lib/systemd/system/
sudo systemctl daemon-reload
systemctl enable snell.service
systemctl start snell.service
# systemctl status snell.service
cat /etc/snell-server.conf
