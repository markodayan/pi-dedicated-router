# Turn GSM Module On (Base current to turn transistor on)
import RPi.GPIO as GPIO
import time

# GPIO16
switch = 16

GPIO.setmode(GPIO.BCM)

GPIO.setup(switch, GPIO.OUT)

GPIO.output(switch, GPIO.HIGH)


