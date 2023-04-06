import numpy as np
from matplotlib import pyplot as plt
from constants.paths import GRAPH_PATH


class Charter:
    def __init__(self) -> None:
        self.predArr = []

    def addVal(self, val: int):
        self.predArr.append(val)

    def getList(self):
        return self.predArr

    def genGraph(self):
        length = len(self.predArr)
        l = length // 5
        x = [l, 2 * l, 3 * l, 4 * l, 5 * l]
        y = []
        for i in range(len(x)):
            y1 = self.predArr[0 : x[i]].count(1)
            y.append(y1 / x[i])
        plt.plot(x, y)
        plt.xlabel(" Amount of Trials")
        plt.ylabel(" Percent of Correct Predictions ")
        plt.savefig(GRAPH_PATH)
