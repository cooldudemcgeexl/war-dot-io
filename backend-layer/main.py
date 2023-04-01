from flask import Flask, jsonify, request

# Start new app
app = Flask(__name__)


@app.route("/images", methods=["GET"])
def getCurrentImage():
    # Fetch Data
    return "Success", 201


@app.route("/graphs", methods=["GET"])
def getGraphs():
    return "Success", 201


@app.route("/prediction", methods=["GET"])
def getPrediction():
    return "Success", 201


if __name__ == "__main__":
    app.run(host="0.0.0.0")
