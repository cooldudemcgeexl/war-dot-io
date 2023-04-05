from pathlib import Path

from model_gen.trainer import ModelTrainer

TRAINING_DATA = Path(__file__).parents[1] / "resources/dumps/Intro"
MODEL_PARAMS = {
    "img_width": 240,
    "img_height": 160,
    "batch_size": 32,
    "pool_size": 3,
    "strides": 1,
    "num_outputs": 13,  # 213 total microgames
    "epochs": 6,
}

if __name__ == "__main__":
    mt = ModelTrainer(TRAINING_DATA, MODEL_PARAMS)
