# Yellow LED (GPIO23 is On)
import RPi.GPIO as GPIO
import time

# GPIO23 
yellow = 23

GPIO.setmode(GPIO.BCM)

GPIO.setup(yellow, GPIO.OUT)

GPIO.output(yellow, GPIO.HIGH)


