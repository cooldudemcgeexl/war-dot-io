import numpy as np
import tensorflow as tf
from tensorflow import keras

"""
Load Model
"""
model = keras.models.load_model("C:\\Users\\niebe\\PycharmProjects\\KerasTest")

"""
Load Image
"""
image = keras.utils.load_img("C:\\Users\\niebe\\PycharmProjects\\WarioWareFinal\\image.png")

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