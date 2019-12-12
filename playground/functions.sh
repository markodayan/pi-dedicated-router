add_user()
{
	USER=$1
	PASSWORD=$2

	echo "User: $USER"
	echo "Password: $PASSWORD"

}

upload_test()
{
	FILENAME=$1
	#curl -v -X POST -F 'file=@/bluetooth/'$FILENAME https://addy/ex.aspx 
	echo "$FILENAME"
	echo "$USER"
}


#PGC=$"pen_05_Nov_19_09.48.52.414.pgc"
#INPUT=$PGC

#upload_test $INPUT
#add_user mark pblah

get_time()
{
        timestamp=$(date '+[Date: %d/%m/%Y, Time: %H:%M:%S]: ')
}


post_file()
{
	get_time
	echo "$timestamp"
}



post_file 
