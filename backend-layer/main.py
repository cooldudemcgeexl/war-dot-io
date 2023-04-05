from flask import Flask, jsonify, request
from flask_cors import CORS
from .Services.graphservice import generateNewGraph

# Start new app
app = Flask(__name__)
CORS(app)


@app.route("/graph", methods=["GET"])
def getGraphs():
    graph_str = generateNewGraph()
    return jsonify(graph_str), 201


@app.route("/prediction", methods=["GET"])
def getPrediction():
    return jsonify("Success"), 201


if __name__ == "__main__":
    app.run(host="0.0.0.0")
