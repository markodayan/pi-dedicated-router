<h1>Directory of Executable Scripts that Manage Functionality of the Device</h1>
<hr>
<p>This repo contains various scripts that were written to perform many tasks that the device is required to perform upon reboot. It makes use of the autostart LXDE desktop file to call the primary script that initiates all the actions (main.sh).</p>
<hr>
<h2>Instructions</h2>
<p>1. First do 'sudo raspi-config' and disable serial port on console login and enable hardware serial</p>
<p>2. Clone the repository (run the following whilst in Desktop directory) git clone https://github.com/markodayan/xcallibre-linux.git</p>
<p>3. Rename the folder from xcallibre-linux to 'scripts'</p>
<p>4. Run the script in the install directory, install_dependencies.sh</p>
<p>5. Follow OBEX Guide: https://www.raspberrypi.org/forums/viewtopic.php?t=146328</p>
<p>6. Pair to pen using bluetoothctl and pin:12345 and Maybe Test Some Scripts</p>
<hr>
<h2>Raspberry Pi Pin Connections</h2>
<p>GPIO14 - Blue line of GSM (RX on module)</p>
<p>GPIO15 - Green line of GSM (TX on module)</p>
<p>GPIO23 - Yellow LED</p>
<p>GPIO24 - Green LED</p>
<p>GPIO25 - Speaker</p>
<p>3V3 - Red LED (Powered by 3.3V pin to show when the device is powered on)</p>
<p>5V - Connected to 5V of GSM Module (GND connection of GSM Module is connected to the transistor's collector)
<p>GPIO16 - Transistor Base with 1K Resistor (Switches the GSM Module On & Off)</p>
<br>
<hr>


