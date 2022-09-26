import cv2
import time

vidCap = cv2.VideoCapture("trafe.mp4")


BS_KNN = cv2.createBackgroundSubtractorKNN()
BS_MOG2 = cv2.createBackgroundSubtractorMOG2()

veiculos= 0

while vidCap.isOpened():
    ret, frame = vidCap.read()

    kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (5, 5))
    fgMask = BS_MOG2.apply(frame)

    opening = cv2.morphologyEx(fgMask, cv2.MORPH_OPEN, kernel)
    opening2= cv2.morphologyEx(opening, cv2.MORPH_OPEN, kernel)
    closing2 = cv2.morphologyEx(opening2, cv2.MORPH_CLOSE, kernel)
    closing = cv2.morphologyEx(closing2, cv2.MORPH_CLOSE, kernel)

    cv2.line(frame, (220, 450),(800, 450),(0, 0, 255), 2)
    cv2.line(frame, (220, 450), (800, 450), (0, 255, 0), 1)
    cv2.line(frame, (220, 450), (800, 450), (0, 255, 0), 1)


    conts, _ =cv2.findContours(closing, cv2.RETR_LIST,cv2.CHAIN_APPROX_SIMPLE)

    for c in conts:
        if cv2.contourArea(c) < 100:
            continue

        x,y,w,h = cv2.boundingRect(c)

        cv2.rectangle(frame,(x,y),(x+w,y+h),(0,255,0),2)
        xMid = int((x+(x+w))/2)
        yMid = int((y+(y+h))/2)
        cv2.circle(frame, (xMid,yMid),5,(0,0,255),5)

        if yMid > 440 and yMid <460:
            veiculos +=1

    cv2.imshow("FG mask", closing)
    cv2.putText(frame, "Quantidade de carros: {}".format(veiculos),(450,50),cv2.FONT_HERSHEY_PLAIN,2,(255,255,255),2)
    cv2.imshow("original", frame)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cv2.destroyAllWindows()
vidCap.release()

