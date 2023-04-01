from sqlalchemy import Column, String
from .entity import Entity, Base
from marshmallow import Schema, fields


class Image(Entity, Base):
    __tablename__ = "image"
    img_src = Column(String)
    game_name = Column(String)

    def __init__(self, img, gameName):
        Entity.__init__(self)
        self.img_src = img
        self.game_name = gameName


class ImageSchema(Schema):
    id = fields.Number()
    created_on = fields.DateTime()
    img_src = fields.Str()
    game_name = fields.Str()
