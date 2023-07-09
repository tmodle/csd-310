print("-- INSERT STATEMENTS --")
import pymongo
from pymongo import MongoClient
url = "mongodb+srv://admin:admin@cluster0.alst1wx.mongodb.net/"
client = MongoClient(url)
db = client["mydb"]
pytech = db["PyTech"]

Thorin = {
    "student_id": "1007",
    "first_name": "Thorin",
    "last_name": "Oakenshield"
}
Thorin_student_id = pytech.insert_one(Thorin).inserted_id
print("Inserted student record Thorin Oakenshield into the students collection with document id", Thorin_student_id)


Bilbo = {
    "student_id": "1008",
    "first_name": "Bilbo",
    "last_name": "Baggins"
}
Bilbo_student_id = pytech.insert_one(Bilbo).inserted_id
print("Inserted student record Bilbo Baggins into the students collection with document id", Bilbo_student_id)


Frodo = {
    "student_id": "1009",
    "first_name": "Frodo",
    "last_name": "Baggins"
}
Frodo_student_id = pytech.insert_one(Frodo).inserted_id
print("Inserted student record Frodo Baggins into the students collection with document id", Frodo_student_id)


print()
input("End of program, press any ket to exit...")
exit()