from pathlib import Path

BASE_DIR = Path(__file__).parents[2]

MODEL_SAVE_DIR = BASE_DIR / "resources/models"


IMAGE_DIR = BASE_DIR / "resources/testImages"
GRAPH_PATH = IMAGE_DIR / "graph.png"
IMAGE_PATH = IMAGE_DIR / "image.png"

TRAINING_DATA = BASE_DIR / "resources/dumps/Intro"
