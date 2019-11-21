address=$(awk '/URL/ {print $2}' /home/pi/Desktop/scripts/settings/settings.txt)
echo $address

curl -v -X POST -F 'file=@/bluetooth/pen_11_Nov_19_11.26.51.941.pgc' $address

