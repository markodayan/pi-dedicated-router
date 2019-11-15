# When file is received, flash green LED once and beep once
import RPi.GPIO as GPIO
import time

# Green LED = GPIO24, Speaker = GPIO25
green = 24
speaker = 25

GPIO.setmode(GPIO.BCM)
GPIO.setup(green, GPIO.OUT)
GPIO.setup(speaker, GPIO.OUT)

GPIO.output(green, GPIO.HIGH)
GPIO.output(speaker, GPIO.HIGH)
time.sleep(0.1)
GPIO.output(speaker, GPIO.LOW)
time.sleep(0.4)
GPIO.output(green, GPIO.LOW)


