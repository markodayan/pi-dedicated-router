while :
do

# -q flag to  remove console logging of unncessary info
# -e create /bluetooth (needed!) - specifies to watch for create event in /bluetooth
# -r recursive (needed!) - watches all directories or subdirectories
# --format quote%fquote (needed!) - this specifies that output will be replaced
#                         with the filename that triggered the event  

echo "watching /bluetooth directory for new files..."
FILENAME=$(sudo inotifywait -r -q --format '%f' -e create /bluetooth)
echo "Turning rnet on(10 sec wait)"
sudo pon rnet
sleep 10
echo "10 sec wait over" 

echo "$FILENAME"
curl -v -X POST -F 'file=@/bluetooth/'$FILENAME https://pls.xcallibre.com/dwpls2/indata2.aspx 

if [ $? -eq 0 ]
then
	echo "Upload Was Successful"
else
	echo "curl failed"
fi

ifconfig > /home/pi/Desktop/scripts/logs/config.txt
echo "Turning rnet off"
sudo poff rnet

done
