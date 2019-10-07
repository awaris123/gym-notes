from config import auth

# cred = credentials.Certificate("gym-notes-f8bbe-firebase-adminsdk-rmrwf-545e8543f5.json")
# firebase_admin.initialize_app(cred)

class User:

    def __init__(self, email="", password=""):
        self.email = email
        self.password = password

    def create(self):
        try:
            auth.create_user(email=self.email, password=self.password)
            return {"message" : "Successfully created user: {}".format(self.email)}
        except:
            return {"message" : "Unable to create user"}

    def delete(self):
        try:
            uid= auth.get_user_by_email(self.email).uid
            auth.delete_user(uid)
            return {"message" : "Successfully deleted user: {}".format(self.email)}

        except:
            return {"message" : "Unable to delete user"}
