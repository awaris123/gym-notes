import firebase_admin
from firebase_admin import credentials, auth
import json

file = open('keys.json', 'r')
keys = json.load(file)



cred = credentials.Certificate(keys['firebase-admin-key'])
firebase_admin.initialize_app(cred)
