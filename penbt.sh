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
        	successful_upload $FILENAME
		sudo mv /bluetooth/$FILENAME /home/pi/Desktop/scripts/pen_files/sent
	else
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

retry()
{
	retry_file=$1
	sudo poff rnet
	sleep 2
	get_time
	echo "\n$timestamp Retrying Connection to GSM Module (Once)"
	sudo pon rnet
	sleep 10
	ifconfig ppp0 | grep inet
	if [ $? -eq 0 ]
	then
		ifconfig > /home/pi/Desktop/scripts/logs/config.txt
		get_time
		echo "$timestamp RETRY_SUCCESS: Connected to ppp0 and ready for POST request"
		post_file $retry_file
	else
		ifconfig > /home/pi/Desktop/scripts/logs/config.txt
		get_time
		echo "$timestamp RETRY_FAILURE: No PPP"
        	# Will Add Some Logic Here (Maybe moving the file to an Outbox and Then trying to send in next attempt)
        	echo "$timestamp ACTION: Need to Move Pen File to Outbox"
        	python /home/pi/Desktop/scripts/python/post_fail.py
	fi
}

# ------------------ Set Up ----------------------------------------
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

sudo pon rnet
sleep 15

# Testing ppp0 Internet Capabilities
ifconfig ppp0 | grep inet 
if  [ $? -eq 0 ]
then
	python /home/pi/Desktop/scripts/python/green24/green_on.py
	ifconfig > /home/pi/Desktop/scripts/logs/config.txt 
	get_time
	echo "$timestamp SUCCESS: Connected to ppp0 and ready for POST request"
	post_file $pgc
else
	python /home/pi/Desktop/scripts/python/yellow23/yellow_on.py
	ifconfig > /home/pi/Desktop/scripts/logs/config.txt
	get_time
	echo "$timestamp FAILURE: No PPP Internet Connection"
	sudo mv /bluetooth/$pgc /home/pi/Desktop/scripts/pen_files/outbox
	# Will Add Some Logic Here (Maybe moving the file to an Outbox and Then trying to send in next attempt)
	#echo "$timestamp ACTION: Retry Connecting to GSM and Upload Attempt"
	python /home/pi/Desktop/scripts/python/post_fail.py
	#retry $pgc 
fi

sleep 1
python /home/pi/Desktop/scripts/python/green24/green_off.py
python /home/pi/Desktop/scripts/python/yellow23/yellow_off.py
get_time
echo "$timestamp Turning rnet off"
sudo poff rnet
echo "---------------------------------------------"
done

