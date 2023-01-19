curl -s -o snell.tar https://github.com/NinjaOSX/snl/releases/download/V4.0.0/snell-server-v4.0.0-linux-amd64.tar
curl -s -o snell.service https://raw.githubusercontent.com/NinjaOSX/snl/main/systemd-example

tar -xf snell.tar
rm -f snell.tar

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
echo "Snell 安装完毕，账号信息如下："
echo "=========="
cat /etc/snell-server.conf
echo "=========="
echo ""

echo "检查 Snell 状态可执行命令："
echo "systemctl status snell.service"
echo "按 ctrl+c 返回终端界面"
