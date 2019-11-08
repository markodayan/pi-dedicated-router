import wiringpi
import time

# GPIO pin numbering
wiringpi.wiringPiSetupGpio()

# Create Tone Output on GPIO25
wiringpi.softToneCreate(25)
start_f = 500	# start frequency 500 Hz
t = 0

while t < 4:
	f = (150 * t * t) + start_f	# f = 100*t^2 + 300 (Parabolic)
	wiringpi.softToneWrite(25,f)
	time.sleep(0.12)
	t += 1

wiringpi.softToneStop(25)
