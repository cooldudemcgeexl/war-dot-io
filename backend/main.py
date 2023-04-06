from constants.game_list import GAMES
from constants.paths import IMAGE_PATH, MODEL_SAVE_DIR
from flask import Flask, jsonify, request
from flask_cors import CORS
from model_gen import ModelRunner
from services.graph_service import generate_new_graph
from services.charts import Charter

# Start new app
app = Flask(__name__)
CORS(app)
model_runner = ModelRunner(MODEL_SAVE_DIR, image_path=IMAGE_PATH, category_list=GAMES)


@app.route("/reload", methods=["GET"])
def update_data():
    prediction = model_runner.predict(IMAGE_PATH)
    Charter.genGraph()
    return jsonify(prediction), 201


if __name__ == "__main__":
    app.run(host="0.0.0.0")
