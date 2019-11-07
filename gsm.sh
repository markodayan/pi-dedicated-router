#Try to connect to Internet using GSM via PPP Stack
sudo poff rnet
echo "sleeping for 20 seconds"
sleep 20
echo "execute rnet script"
sudo pon rnet
echo "turning ppp on..."
sleep 15
ifconfig
echo "there should be ppp,thereafter upload the file to server"


