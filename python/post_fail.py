import wiringpi
import time

#General Setup
wiringpi.wiringPiSetupGpio()

wiringpi.softToneCreate(25)

# 200Hz frequency on GPIO25
wiringpi.softToneWrite(25,200)

# Run for 0.7 seconds
time.sleep(0.7)

# Stop the tone
wiringpi.softToneStop(25)

