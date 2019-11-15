# Executed when the LDXE loads up (Will have to change this at somepoint)
echo "starting Obex Server to allow file transfer to /bluetooth directory..." 
python /home/pi/Desktop/scripts/python/gsm/gsm_on.py
sleep 60
sudo obexpushd -B23 -o /bluetooth

python /home/pi/Desktop/scripts/python/bt_ready.py


echo "call penbt.sh script to listen for new files received in /bluetooth directory"
sudo /home/pi/Desktop/scripts/penbt.sh > /home/pi/Desktop/scripts/logs/main.txt



