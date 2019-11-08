# Before Running the script - make sure you have disabled serial port for login and enabled hardware serial ports!!!!
# sudo raspi-config

# Removing Unwanted Packages
sudo apt-get remove --purge libreoffice*
sudo apt-get clean
sudo apt-get autoremove

# Installing required Linux Packages
sudo apt-get install ranger
sudo apt-get install inotify-tools
sudo apt-get install bluetooth bluez blueman
sudo apt-get install obexpushd
sudo apt-get install ppp screen elinks

# WiringPi Python Wrapper 
pip install wiringpi
sudo mv /home/pi/.local/lib/python2.7/site-packages/* /usr/lib/python2.7/dist-packages

# Receive Folder for PGC Files
sudo mkdir /bluetooth

# Autostart Desktop File
sudo mkdir -p /home/pi/.config/autostart
sudo mv /home/pi/Desktop/scripts/install/main-autostart.desktop /home/pi/.config/autostart

# PPP0 Stack Setup for GSM Modem
sudo mv /home/pi/Desktop/scripts/install/rnet /etc/ppp/peers
sudo rm /etc/chatscripts/gprs
sudo mv /home/pi/Desktop/scripts/install/gprs /etc/chatscripts

# Then follow Obex Guide to set up Obex Server Functionality
# Then Pair the Pen
