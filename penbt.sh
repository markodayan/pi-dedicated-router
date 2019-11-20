get_time()
{
        timestamp=$(date '+[Date: %d/%m/%Y, Time: %H:%M:%S]: ')
}

post_file()
{
	FILENAME=$1
	curl -v -X POST -F 'file=@/bluetooth/'$FILENAME https://pls.xcallibre.com/dwpls2/indata2.aspx 
	if [ $? -eq 0 ]
	then
		python /home/pi/Desktop/scripts/python/green24/green_on.py
        	successful_upload $FILENAME
		file_size=$(du -h /bluetooth/$FILENAME | cut -f1 -d"/")
		echo "Size of File Uploaded: $file_size"
		sudo mv /bluetooth/$FILENAME /home/pi/Desktop/scripts/pen_files/sent

	else
		python /home/pi/Desktop/scripts/python/yellow23/yellow_on.py
       		failed_upload $FILENAME
		sudo mv /bluetooth/$FILENAME /home/pi/Desktop/scripts/pen_files/outbox
	fi
}

failed_upload()
{
	file=$1
	get_time
	echo "\n$timestamp FAILED:  $file could not be uploaded"
	python /home/pi/Desktop/scripts/python/post_fail.py
}

successful_upload()
{
	file=$1
	get_time
	echo "\n$timestamp SUCCESS: $file Uploaded Successfully"
	python /home/pi/Desktop/scripts/python/post_success.py

}

# ------------------ Set Up ----------------------------------------
sudo ifconfig wlan0 down
echo "---------------------------------------------"
echo "Booted Up"  
echo "---------------------------------------------"
# ------------------------------------------------------------------
while :
do

# -q flag to  remove console logging of unncessary info
# -e create /bluetooth (needed!) - specifies to watch for create event in /bluetooth
# -r recursive (needed!) - watches all directories or subdirectories
# --format quote%fquote (needed!) - this specifies that output will be replaced
#                         with the filename that triggered the event  

echo "\nwatching /bluetooth directory for new files..."
pgc=$(sudo inotifywait -r -q --format '%f' -e create /bluetooth)

# rnet needs a minimum of 10 seconds after being called to start up
python /home/pi/Desktop/scripts/python/received/file_received.py
sudo pon rnet
sleep 12

# Testing ppp0 Internet Capabilities
ifconfig ppp0 | grep inet || ifconfig wlan0
if  [ $? -eq 0 ]
then

	ifconfig > /home/pi/Desktop/scripts/logs/config.txt 
	#Distinguish whether it is ppp0 or wlan0 connection
	ifconfig ppp0 | grep inet
	if [ $? -eq 0 ]
	then
	        get_time
        	echo "$timestamp SUCCESS: Connected to ppp0 and ready for POST request"
        	post_file $pgc	
	else
		ifconfig wlan0
		if [ $? -eq 0 ]
		then
                	get_time
                	echo "$timestamp SUCCESS: Connected to wlan0 and ready for POST request"
                	post_file $pgc 
		fi
	fi
else
	python /home/pi/Desktop/scripts/python/yellow23/yellow_on.py
	ifconfig > /home/pi/Desktop/scripts/logs/config.txt
	get_time
	echo "$timestamp FAILURE: No Internet Connection (Check config.txt for ifconfig log)"
	sudo mv /bluetooth/$pgc /home/pi/Desktop/scripts/pen_files/outbox
	python /home/pi/Desktop/scripts/python/post_fail.py
fi

sleep 1
python /home/pi/Desktop/scripts/python/green24/green_off.py
python /home/pi/Desktop/scripts/python/yellow23/yellow_off.py
get_time
echo "$timestamp Turning rnet off"
sudo poff rnet
echo "---------------------------------------------"
done

