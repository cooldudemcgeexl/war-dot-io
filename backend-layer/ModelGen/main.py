import os
from pathlib import Path

import numpy as np
import tensorflow as tf

keras = tf.keras

"""
Load Model
"""
model = keras.models.load_model(str(Path.cwd()))

"""
Load Image
"""
image = keras.utils.load_img(str(Path.cwd().joinpath("image.png")))

"""
Process
"""
input_array = keras.preprocessing.image.img_to_array(image)
input_array = np.array([input_array])

"""
Print Classification
"""
prediction = model.predict(input_array)
print(prediction.argmax(axis=-1))
