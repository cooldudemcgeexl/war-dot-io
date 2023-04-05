from pathlib import Path

import tensorflow as tf

keras = tf.keras

MODEL_SAVE_DIR = Path(__file__).parents[2] / "resources/models"


class ModelTrainer:
    def __init__(self, input_dir: Path | str, model_params: dict) -> None:
        self.input_dir = str(input_dir)
        self.model_params = model_params
        self.model = keras.models.Sequential()
        self.training_images: tf.data.Dataset | None = None
        self.testing_images: tf.data.Dataset | None = None
        self.training_images_norm = None
        self.testing_images_norm = None

    def create_model(self):
        img_width, img_height = (
            self.model_params["img_width"],
            self.model_params["img_height"],
        )
        batch_size = self.model_params["batch_size"]
        pool_size = self.model_params["pool_size"]
        strides = self.model_params["strides"]
        num_outputs = self.model_params["num_outputs"]

        (
            self.training_images,
            self.testing_images,
        ) = keras.utils.image_dataset_from_directory(
            self.input_dir,
            "inferred",
            "categorical",
            color_mode="rgb",
            batch_size=batch_size,
            image_size=(img_height, img_width),
            subset="both",
            seed=1337,
            validation_split=0.2,
        )

        training_images_layer = keras.layers.Rescaling(1.0 / 255)
        testing_images_layer = keras.layers.Rescaling(1.0 / 255)

        self.training_images_norm = self.training_images.map(
            lambda x, y: (training_images_layer(x), y)
        )
        self.testing_images_norm = self.testing_images.map(
            lambda x, y: (testing_images_layer(x), y)
        )

        self.model = self._add_model_layers(
            self.model, pool_size, img_height, img_width, strides, num_outputs
        )

    def _add_model_layers(
        self,
        model: keras.models.Sequential,
        pool_size: int,
        img_height: int,
        img_width: int,
        strides: int,
        num_outputs: int,
    ):
        model.add(
            keras.layers.Conv2D(
                2, pool_size, input_shape=(img_height, img_width, 3), activation="relu"
            )
        )
        model.add(keras.layers.MaxPooling2D(pool_size, strides, padding="same"))
        model.add(
            keras.layers.Conv2D(
                2, pool_size, input_shape=(img_height, img_width, 3), activation="relu"
            )
        )
        model.add(keras.layers.MaxPooling2D(pool_size, strides, padding="same"))
        model.add(
            keras.layers.Conv2D(
                2, pool_size, input_shape=(img_height, img_width, 3), activation="relu"
            )
        )
        model.add(keras.layers.MaxPooling2D(pool_size, strides, padding="same"))
        model.add(keras.layers.Flatten())
        model.add(keras.layers.Dense(num_outputs, activation="softmax"))
        return model

    def train_model(self):

        self.model.compile(
            optimizer="Adam", loss="categorical_crossentropy", metrics=["accuracy"]
        )
        epochs = self.model_params["epochs"]
        history = self.model.fit(self.training_images_norm, epochs=epochs)

    def test_model(self):
        results = self.model.evaluate(self.testing_images_norm)
        print("test loss, test acc: ", results)
        return results

    def save_model(self, path: Path | str = MODEL_SAVE_DIR):

        self.model.save(path)
