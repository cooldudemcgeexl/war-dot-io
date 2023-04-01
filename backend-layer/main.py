import sys

sys.path.append(r"D:\\Senior Project\\war-dot-io\\backend-layer")

from DataContext.Entities.entity import Session, Engine, Base
from DataContext.Entities.img_entity import Image

Base.metadata.create_all(Engine)

# Start Session
session = Session()
tests = session.query(Image).all()

if len(tests) == 0:
    # create and persist mock exam
    test_add = Image("flowdiagram.png", "TEST GAME")
    session.add(test_add)
    session.commit()
    session.close()

    # reload exams
    tests = session.query(Image).all()

print("Tests:")
for img in tests:
    print(f"({img.id}) {img.created_on}, {img.img_src}, {img.game_name}")
