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
	else
       		failed_upload $FILENAME
	fi
}

failed_upload()
{
	file=$1
	get_time
	echo $(ifconfig ppp0)
	echo "$timestamp $file could not be uploaded"
	#run python failure code
}

successful_upload()
{
	file=$1
	get_time
	echo $(ifconfig ppp0)
	echo "$timestamp $file Uploaded Successfully"
	python /home/pi/Desktop/scripts/python/post_success.py
	
}



while :
do

# -q flag to  remove console logging of unncessary info
# -e create /bluetooth (needed!) - specifies to watch for create event in /bluetooth
# -r recursive (needed!) - watches all directories or subdirectories
# --format quote%fquote (needed!) - this specifies that output will be replaced
#                         with the filename that triggered the event  

echo "\nwatching /bluetooth directory for new files..."
pgc=$(sudo inotifywait -r -q --format '%f' -e create /bluetooth)

get_time
echo "$timestamp Turning rnet on(10 sec wait)"
sudo pon rnet
sleep 10
get_time
echo "$timestamp 10 sec wait over" 

post_file $pgc

get_time
ifconfig > /home/pi/Desktop/scripts/logs/config.txt
echo "$timestamp Turning rnet off"
sudo poff rnet
echo "---------------------------------------------"
done
