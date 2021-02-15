import numpy as nu
import cv2
import time

cap = cv2.VideoCapture(1)


while(True):

    ret, frame = cap.read()



    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

    cv2.imshow('frame', frame)
    if cv2.waitKey(1) == ord('q'):
        break

cap.release()
cv2.destroyAllWindow()