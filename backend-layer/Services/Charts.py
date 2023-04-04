import numpy as np
from matplotlib import pyplot as plt
import os

"""
Data
"""
correct = 5
incorrect = 10
running = True

"""
Plotting
"""
#poll predResult
predResult = True

fig, ax = plt.subplots()
bar_colors = ['tab:green', 'tab:red']
options = ["Correct", "Incorrect"]
counts = [correct, incorrect]
ax.set_ylabel('# Predictions')
ax.set_xlabel('Result')

requested = True
while running == True:
    if requested:
        if predResult == True:
            correct += 1
        else:
            incorrect += 1
        ax.bar(options, counts, color=bar_colors)
        plt.savefig('plot.png')
        requested = False