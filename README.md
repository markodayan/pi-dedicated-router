# Router Device Software Functionality

> This repo contains various scripts that were written to perform many tasks that the device is required to perform upon reboot. It makes use of the autostart LXDE desktop file to call the primary script that initiates all the actions (main.sh).

> To have the device work there are several steps needed to be followed in set up that have been described below. After these steps have been followed the device will function according to the specification from boot and manage all its processes and logging of events.

## Instructions

---

### 1. Disable serial port on console login and enable hardware serial

```
sudo raspi-config
```

### 2. Clone the repository (run the following whilst in Desktop directory)

```
git clone https://github.com/markodayan/xcallibre-linux.git
```

### 3. Rename the folder from xcallibre-linux to 'scripts'

### 4. Run the script in the install directory

```
./install_dependencies.sh
```

### 6. Pair to pen using bluetoothctl and pin:12345

### 7. Set URL for HTTP Post Request in settings/settings.txt file

---

# Raspberry Pi Pin Connections

- GPIO14 - Blue line of GSM (RX on module)

- GPIO15 - Green line of GSM (TX on module)
- GPIO23 - Yellow LED
- GPIO24 - Green LED
- GPIO25 - Piezo Speaker
- 3V3 - Red LED (Powered by 3.3V pin to show when the device is powered on)
- 5V - Connected to 5V of GSM Module (GND connection of GSM Module is connected to the transistor's collector)
- GPIO16 - Transistor Base with 1K Resistor (Switches the GSM Module On & Off)
