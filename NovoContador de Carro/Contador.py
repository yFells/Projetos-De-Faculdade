import cv2
import time

vidCap = cv2.VideoCapture("trafe.mp4")

ret, frame1 = vidCap.read()

# Metodo 2 BS_KNN = cv2.createBackgroundSubtractorKNN()
# Metodo 2 BS_MOG2 = cv2.createBackgroundSubtractorMOG2()

veiculos= 0

while vidCap.isOpened():
    ret, frame2 = vidCap.read()
    frame = frame2.copy()

    if not ret:
        break

    fgMask = cv2.absdiff(frame1,frame2)

    fgMask = cv2.cvtColor(fgMask, cv2.COLOR_BGR2GRAY)

    _,thresh = cv2.threshold(fgMask,50,255,cv2.THRESH_BINARY)

    frame1 = frame2

    cv2.line(frame, (220, 450),(1000, 450),(0, 0, 255), 2)
    cv2.line(frame, (220, 450), (1000, 450), (0, 255, 0), 1)
    cv2.line(frame, (220, 450), (1000, 450), (0, 255, 0), 1)


    conts, _ =cv2.findContours(thresh, cv2.RETR_LIST,cv2.CHAIN_APPROX_SIMPLE)

    for c in conts:
        x,y,w,h = cv2.boundingRect(c)

        cv2.rectangle(frame,(x,y),(x+w,y+h),(0,255,0),2)
        xMid = int((x+(x+w))/2)
        yMid = int((y+(y+h))/2)
        cv2.circle(frame, (xMid,yMid),5,(0,0,255),5)

        if yMid > 440 and yMid <460:
            veiculos +=1

    cv2.imshow("FG mask", fgMask)
    cv2.putText(frame, "Quantidade de carros: {}".format(veiculos),(450,50),cv2.FONT_HERSHEY_PLAIN,2,(255,255,255),2)
    cv2.imshow("original", frame)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cv2.destroyAllWindows()
vidCap.release()

