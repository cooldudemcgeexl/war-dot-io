from flask import Flask, jsonify, request
from .Services.imageservice import getImage
from .Services.graphservice import generateNewGraph

# Start new app
app = Flask(__name__)


@app.route("/images", methods=["GET"])
def getCurrentImage():
    img_str = getImage()
    return img_str, 201


@app.route("/graphs", methods=["GET"])
def getGraphs():
    graph_str = generateNewGraph()
    return graph_str, 201


@app.route("/prediction", methods=["GET"])
def getPrediction():
    return "Success", 201


if __name__ == "__main__":
    app.run(host="0.0.0.0")
