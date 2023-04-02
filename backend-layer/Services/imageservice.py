import cv2
import base64


def getImage():
    img = cv2.imread(
        r"E:\\Senior Project\\war-dot-io\\backend-layer\\Services\\flowdiagram.png"
    )
    jpg_img = cv2.imencode(".jpg", img)
    return base64.b64decode(jpg_img[1]).decode("latin-1")


if __name__ == "__main__":
    getImage()
