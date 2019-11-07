import time
import RPi.GPIO as GPIO

#Pin Definions
speaker = 25 #GPIO25 

#GPIO Numbering
GPIO.setmode(GPIO.BCM)


GPIO.setup(speaker, GPIO.OUT)

i = 0
while i < 3:
	GPIO.output(speaker, GPIO.HIGH)
	time.sleep(0.1)
	GPIO.output(speaker, GPIO.LOW)
	time.sleep(0.1)
	i += 1 



print("Done")

