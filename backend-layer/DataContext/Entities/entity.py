#
# This is the Entity class which will be the basis for entity db sets
#

from datetime import datetime
from sqlalchemy import create_engine, Column, Integer, DateTime
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

db_url = "localhost:5432"
db_name = "images"
db_user = "postgres"
db_password = "login1"

Engine = create_engine(f"postgresql://{db_user}:{db_password}@{db_url}/{db_name}")
Session = sessionmaker(bind=Engine)
Base = declarative_base()


class Entity:
    id = Column(Integer, primary_key=True)
    created_on = Column(DateTime)

    def __init__(self):
        self.created_on = datetime.now()
