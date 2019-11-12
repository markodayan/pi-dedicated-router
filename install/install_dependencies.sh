# Removing unwanted Packages
sudo apt-get remove --purge libreoffice*
sudo apt-get clean
sudo apt-get autoremove

# Install dependencies
sudo apt-get install ranger
sudo apt-get install inotify-tools
sudo apt-get install bluetooth bluez blueman
sudo apt-get install obexpushd
sudo apt-get install ppp screen elinks

#WiringPi Python wrapper
pip install wiringpi

# Receive Folder for PGC Files
sudo mkdir /bluetooth

# Autostart Desktop File
sudo mkdir -p /home/pi/.config/autostart
sudo cp /home/pi/Desktop/scripts/install/main-autostart.desktop /home/pi/.config/autostart

# PPP0 Stack Setup for GSM Modem
sudo cp /home/pi/Desktop/scripts/install/rnet /etc/ppp/peers
sudo chmod 777 /etc/chatscripts
sudo cp /home/pi/Desktop/scripts/install/gprs /etc/chatscripts

# Then follow Obex Guide to set up Obex Server Functionality
# Then Pair the Pen
