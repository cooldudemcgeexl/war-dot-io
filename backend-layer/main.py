# import sys
# sys.path.append(r"D:\\Senior Project\\war-dot-io\\backend-layer")
from .DataContext.Entities.entity import Session, Engine, Base
from .DataContext.Entities.img_entity import Image, ImageSchema
from flask import Flask, jsonify, request

Base.metadata.create_all(Engine)

# Start new app
app = Flask(__name__)


@app.route("/images", methods=["GET"])
def getAllImages():
    # Fetch Data
    session = Session()
    image_objects = session.query(Image).all()

    # transform into JSON
    schema = ImageSchema(many=True)
    images = schema.dump(image_objects)
    session.close()
    return jsonify(images)


@app.route("/images", methods=["POST"])
def addImages():
    # posted data
    posted_image = ImageSchema(only=("img_src:", "game_name:")).load(request.get_json())
    image = Image(**posted_image)

    session = Session()
    session.add(image)
    session.commit()
    session.close()

    return "Success", 201


if __name__ == "__main__":
    app.run(host="0.0.0.0")
