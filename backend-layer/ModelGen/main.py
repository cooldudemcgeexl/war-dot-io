import numpy as np
import tensorflow as tf
from tensorflow import keras
import os

"""
Load Model
"""
model = keras.models.load_model(os.getcwd())

"""
Load Image
"""
image = keras.utils.load_img(os.getcwd() + "\\image.png")

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