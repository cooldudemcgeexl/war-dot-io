from io import BytesIO

import numpy as np
from constants.paths import GRAPH_PATH
from matplotlib import pyplot as plt
from matplotlib.figure import Figure


class Charter:
    def __init__(self) -> None:
        self.predArr = []

    def addVal(self, val: int):
        self.predArr.append(val)

    def getList(self):
        return self.predArr

    def readTxt(self, filepath):
        with open(filepath, "r") as f:
            return f.read()

    def genGraph(self):
        length = len(self.predArr)
        if length > 5:
            l = length // 5
        else:
            l = 1
        x = [l, 2 * l, 3 * l, 4 * l, 5 * l]
        y = []
        for i in range(len(x)):
            y1 = self.predArr[0 : x[i]].count(1)
            y.append(y1 / x[i])
        fig = Figure()
        ax = fig.subplots()
        ax.plot(x, y)
        fig.supxlabel("Amount of Trials")
        fig.supylabel(" Percent of Correct Predictions")
        fig.savefig(GRAPH_PATH, format="png")
