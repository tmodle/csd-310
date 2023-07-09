print("-- Pytech COllection List --")
import pymongo
from pymongo import MongoClient
url = "mongodb+srv://admin:admin@cluster0.alst1wx.mongodb.net/"
client = MongoClient(url)
db = client.pytech
print(db.list_collection_names())
print()
input("End of program, press any key to exit...")
exit()