# Green LED (GPIO24 is On)
import RPi.GPIO as GPIO
import time

# GPIO24 
green = 24

GPIO.setmode(GPIO.BCM)

GPIO.setup(green, GPIO.OUT)

GPIO.output(green, GPIO.HIGH)

