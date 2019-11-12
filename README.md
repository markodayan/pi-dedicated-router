<h1>Directory of Executable Scripts that Manage Functionality of the Device</h1>

<p>This repo contains various scripts that were written to perform many tasks that the device is required to perform upon reboot. It makes use of the autostart LXDE desktop file to call the primary script that initiates all the actions (main.sh).</p>

<hr>

<h2>Instructions</h2>

<p>1. First do 'sudo raspi-config' and disable serial port on console login and enable hardware serial</p>
<br>
<p>2. Clone the repository (run the following whilst in Desktop directory) git clone https://github.com/markodayan/xcallibre-linux.git</p>
<br>
<p>3. Rename the folder from xcallibre-linux to 'scripts'</p>
<br>
<p>4. Run the script in the install directory, install_dependencies.sh</p>
<br>
<p>5. Follow OBEX Guide: https://www.raspberrypi.org/forums/viewtopic.php?t=146328</p>
<br>
<p>6. Pair to pen using bluetoothctl and pin:12345 and Maybe Test Some Scripts</p>
<br>
<hr>
<br>

<h2>Remember</h2>

<p/>LED(Green) - GPIO24</p>
<br>
<p>LED(Yellow) - GPIO23</p>
<br>
<p>Speaker - GPIO25</p>
<br>
<p>THEN GSM Module ends on GPIO 15 and starts on 5V (Adding NPN Transistor soon for GPIO control)</p>
<br>
<p> 3V3 pin to LED(Red) - Just to show Power is on</p>


