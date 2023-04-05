from pathlib import Path

from model_gen import ModelTrainer
from model_gen.utils import get_total_games

TRAINING_DATA = Path(__file__).parents[1] / "resources/dumps/Intro"
MODEL_PARAMS = {
    "img_width": 240,
    "img_height": 160,
    "batch_size": 32,
    "pool_size": 3,
    "strides": 1,
    "num_outputs": get_total_games(TRAINING_DATA),  # 213 total microgames
    "epochs": 6,
}

if __name__ == "__main__":
    mt = ModelTrainer(TRAINING_DATA, MODEL_PARAMS)
    mt.create_model()
    mt.train_model()
    mt.save_model()
