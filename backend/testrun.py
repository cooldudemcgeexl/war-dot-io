from pathlib import Path

from constants.game_list import GAMES
from model_gen import ModelRunner

MODEL_PATH = Path(__file__).parents[1] / "resources/models"
IMAGE_DIR = Path(__file__).parents[1] / "resources/testImages"
IMAGE_PATH = IMAGE_DIR / "test.png"


if __name__ == "__main__":
    mr = ModelRunner(MODEL_PATH, image_path=IMAGE_DIR, category_list=GAMES)
    prediction = mr.predict(IMAGE_PATH)
    print(prediction)
