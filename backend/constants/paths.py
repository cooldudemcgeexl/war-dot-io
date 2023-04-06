from pathlib import Path

BASE_DIR = Path(__file__).parents[2]

MODEL_DIR = BASE_DIR / "resources/models"


IMAGE_DIR = BASE_DIR / "resources/testImages"
IMAGE_PATH = IMAGE_DIR / "test.png"

TRAINING_DATA = BASE_DIR / "resources/dumps/Intro"
