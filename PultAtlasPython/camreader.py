import numpy as nu
import cv2
import time
import keyboard

def print_pressed_keys(e):
    print(e.name)
    e.name = None


cap = cv2.VideoCapture(0)
k = "w"

while(True):

    ret, frame = cap.read()

    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

    cv2.imshow('frame', frame)

    keyboard.hook(print_pressed_keys)

    if cv2.waitKey(1) == ord('q'):  
            break

cap.release()
cv2.destroyAllWindow()