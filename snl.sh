curl -s -o snell.zip -L https://dl.nssurge.com/snell/snell-server-v4.0.0-linux-amd64.zip
curl -s -o snell.service -L https://raw.githubusercontent.com/NinjaOSX/snl/main/systemd-example

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

clear
echo "Snell 安装完毕，配置如下："
echo "====================================="
cat /etc/snell-server.conf
echo "====================================="
echo ""
echo "检查 Snell 状态可执行命令："
echo "systemctl status snell.service"
echo ""
echo "按 ctrl+c 返回终端界面"
