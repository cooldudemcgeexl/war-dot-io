import numpy as np
import tensorflow as tf
from tensorflow import keras
import os

"""
Parameters
"""
img_width, img_height = 240, 160
batch_size = 32
pool_size = 3
strides = 1
num_outputs = 3 # 213 total microgames
epochs = 3

"""
Data
"""
training_images, testing_images = keras.utils.image_dataset_from_directory(os.getcwd() + "\\images",
                                                        "inferred", "categorical", color_mode="rgb", batch_size=batch_size,
                                                        image_size=(img_height, img_width), subset="both", seed=1337, validation_split=.2)

training_images_layer = keras.layers.Rescaling(1./255)
testing_images_layer = keras.layers.Rescaling(1./255)

training_images_norm = training_images.map(lambda x, y: (training_images_layer(x), y))
testing_images_norm = testing_images.map(lambda x, y: (testing_images_layer(x), y))

"""
Microgames Table
"""

"""
Model
"""
print("\"train\" or \"load\"?")
method = input()
if method == "train":
    model = keras.models.Sequential()
    model.add(keras.layers.Conv2D(2, pool_size, input_shape=(img_height, img_width, 3), activation="relu"))
    model.add(keras.layers.MaxPooling2D(pool_size, strides, padding="same"))
    model.add(keras.layers.Conv2D(2, pool_size, input_shape=(img_height, img_width, 3), activation="relu"))
    model.add(keras.layers.MaxPooling2D(pool_size, strides, padding="same"))
    model.add(keras.layers.Conv2D(2, pool_size, input_shape=(img_height, img_width, 3), activation="relu"))
    model.add(keras.layers.MaxPooling2D(pool_size, strides, padding="same"))
    model.add(keras.layers.Flatten())
    model.add(keras.layers.Dense(num_outputs, activation="softmax"))

    """
    Training
    """
    model.compile(optimizer="Adam", loss="categorical_crossentropy", metrics=["accuracy"])
    history = model.fit(training_images_norm, epochs=epochs)
    model.save(os.getcwd())
    """
    Testing
    """
    results = model.evaluate(testing_images_norm)
    print("test loss, test acc: ", results)

elif method == "load":
    model = keras.models.load_model(os.getcwd())
    """
    Testing
    """
    results = model.evaluate(testing_images_norm)
    print("test loss, test acc: ", results)

