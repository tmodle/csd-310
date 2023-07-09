print("-- DISPLAYING STUDENTS DOCUMENTS FROM find() QUERY --")
import pymongo
from pymongo import MongoClient
url = "mongodb+srv://admin:admin@cluster0.alst1wx.mongodb.net/"
client = MongoClient(url)
db = client["mydb"]
pytech = db["PyTech"]
  

docs = pytech.find({})

for doc in docs:
 print(doc)


print()
print("-- DISPLAYING STUDENT DOCUMENT FROM find_one() QUERY --")


doc = pytech.find_one({"student_id": "1007"})
print(doc)


print()
input("End of program, press any ket to exit...")
exit()