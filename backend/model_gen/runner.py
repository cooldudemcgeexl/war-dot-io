from pathlib import Path
from typing import Optional

import numpy as np
import tensorflow as tf

keras = tf.keras


class ModelRunner:
    def __init__(
        self,
        model_path: Path | str,
        load=True,
        image_path: Optional[Path | str] = None,
        category_list: Optional[list[str]] = None,
    ) -> None:
        self.model_path = model_path
        self.model = None
        if load:
            self.load_model(model_path)
        self.image_path = image_path
        self.category_list = category_list

    def load_model(self, model_path: Path | str):
        self.model = keras.models.load_model(model_path)

    def set_image_path(self, image_path: Path | str):
        self.image_path = image_path

    def _load_image(self, image_path: Path | str):
        image_pil = keras.utils.load_img(image_path)
        image_array = keras.preprocessing.image.img_to_array(image_pil)
        image_np = np.array([image_array])
        return image_np

    def predict(self, image_path: Path | str | None = None) -> dict:
        if image_path:
            self.set_image_path(image_path)
        image_np = self._load_image(image_path)
        prediction = self.model.predict(image_np)
        prediction_max: int = prediction.argmax(axis=-1)[0]
        prediction_conf: float = prediction[0][prediction_max]
        if self.category_list:
            prediction_game: str = self.category_list[prediction_max]
            result = {"game": prediction_game, "confidence": str(prediction_conf)}
            return result
        result = {"game": str(prediction_max), "confidence": str(prediction_conf)}
        return result
