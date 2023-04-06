from flask import Flask, jsonify, request
from flask_cors import CORS
from .Services.graphservice import generateNewGraph

# Start new app
app = Flask(__name__)
CORS(app)


@app.route("/reload", methods=["GET"])
def getGraphs():
    generateNewGraph()
    # setImage()
    # succ_str = wasPredictionSuccessful()
    succ_str = "Successs"
    return jsonify(succ_str), 201


if __name__ == "__main__":
    app.run(host="0.0.0.0")
