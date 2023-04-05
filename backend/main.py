from constants.game_list import GAMES
from constants.paths import IMAGE_PATH, MODEL_DIR
from flask import Flask, jsonify, request
from flask_cors import CORS
from model_gen import ModelRunner
from services.graph_service import generate_new_graph

# Start new app
app = Flask(__name__)
CORS(app)
model_runner = ModelRunner(MODEL_DIR, image_path=IMAGE_PATH, category_list=GAMES)


@app.route("/reload", methods=["GET"])
def update_data():
    prediction = model_runner.predict(IMAGE_PATH)
    graph_str = generate_new_graph()
    return jsonify(prediction), 201


if __name__ == "__main__":
    app.run(host="0.0.0.0")
