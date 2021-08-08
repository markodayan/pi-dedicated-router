# Router Device Software Functionality
> A repo that can configure a Raspberry Pi (any Linux distro computer) to be able to collect Anoto digital pen data and transfer digitally signed documents to any configured backend for processing. Basically the script installs dependencies, creates systemd services and logging structures as well as shows instructions of how to configure a Raspberry Pis GPIO to add external output to indicate at what step in the dedicated design case has been reached. Extra peripherals that the code prepares for use with a Raspberry Pi includes a GSM module which is a fallback in the case that internet connectivity is not available (This device is designed to work from anywhere provided it is supplied power)

> This repo contains various scripts that were written to perform many tasks that the device is required to perform upon reboot. It makes use of the autostart LXDE desktop file to call the primary script that initiates all the actions (main.sh).

> To have the device work there are several steps needed to be followed in set up that have been described below. After these steps have been followed the device will function according to the specification from boot and manage all its processes and logging of events.

## Instructions

---

### 1.

Load SD Card with Raspbian Operating System (Follow guide on how to do this from the official Raspberry Pi Website as well as various web sources: https://www.raspberrypi.org/documentation/installation/installing-images/)

### 2.

Once the Raspberry Pi has been booted with Raspbian loaded SD Card, set up the WiFi connection for setup, this will be by clicking on the top right corner of the taskbar and clicking on the network listed.

### 3.

Enter the configuration menu by typing the following into the terminal:

```
sudo raspi-config
```

then follow the menu to change interfacing options and select serial port on console login to be disabled and for hardware serial to be enabled. Thereafter reboot the device.

### 4.

Open the commandline and go the Desktop directory by typing the following in the command terminal:

```
cd ~/Desktop
```

then clone the repository holding all the files by writing the command:

```
git clone https://github.com/markodayan/xcallibre-linux.git
```

### 5.

Rename the folder from xcallibre-linux to 'scripts'

### 6.

go into the install directory in the directory of the cloned folder

```
cd ~/Desktop/scripts/install
```

Run the following command:

```
./install_dependencies.sh
```

### 7.

Go to the terminal and write the command

```
sudo bluetoothctl
```

This will open up the bluetooth terminal. Type the following after

```
agent on
```

Set the mode

```
default-agent
```

Type the following command to begin scanning devices

```
scan on
```

A list of devices will be listed, once the name appears of the desired device to connect with, copy the MAC address (XX-XX-XX-XX-XX-XX) and write a command to pair with it as demonstrated below.

```
pair XX:XX:XX:XX:XX:XX
```

A default pin may be requested which would typically be 12345. Once you enter this the device will be paired successfully and ready for use.

### 7.

Set URL for HTTP Post Request in settings/settings.txt file

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
