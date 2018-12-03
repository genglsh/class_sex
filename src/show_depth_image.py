import cv2
import numpy as np

if __name__ == "__main__":
    img_name = 'image_show.txt'
    img = np.loadtxt(img_name)
    print(img.shape)
    cv2.imshow('sy',img)
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    cv2.imwrite('0.png', img)