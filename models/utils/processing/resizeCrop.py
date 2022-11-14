import cv2  # open cv
from PIL import Image

if __name__ == "__main__":

    leftCrop = 0
    topCrop = 0
    rightCrop = 0
    bottomCrop = 0
    openStr = ""
    writeStr = ""

    img = Image.open("")
    img_cropped = img.crop(leftCrop, topCrop, rightCrop, bottomCrop)
    cv2.imwrite("", img_cropped)
