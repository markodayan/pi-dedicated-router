# Turn GSM Module Off (No current to turn transistor off)
import RPi.GPIO as GPIO
import time

# GPIO16 
switch = 16

GPIO.setmode(GPIO.BCM)

GPIO.setup(switch, GPIO.OUT)

GPIO.output(switch, GPIO.LOW)


