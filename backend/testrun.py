from pathlib import Path

from constants.game_list import GAMES
from constants.paths import IMAGE_DIR, IMAGE_PATH, MODEL_PATH
from model_gen import ModelRunner

if __name__ == "__main__":
    mr = ModelRunner(MODEL_PATH, image_path=IMAGE_DIR, category_list=GAMES)
    prediction = mr.predict(IMAGE_PATH)
    print(prediction)
