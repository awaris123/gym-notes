import firebase_admin
from firebase_admin import credentials, auth

cred = credentials.Certificate("gym-notes-f8bbe-firebase-adminsdk-rmrwf-545e8543f5.json")
firebase_admin.initialize_app(cred)
