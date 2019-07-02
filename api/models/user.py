from flask import jsonify
from passlib.apps import custom_app_context as pwd

class User:

    def __init__ (self,username = "", email = "", pw = "", first_name = "", last_name = "",id=0):
        self.username = username
        self.email = email
        self.hashed_pw = pwd.encrypt(pw)
        self.first_name = first_name
        self.last_name = last_name
        self.user_id = id


    @staticmethod
    def check_pw(pw, hash):
        return pwd.encrypt(pw) == hash

    def __eq__(self, other):
        if self.username == other.username or self.email == other.email:
            return True
        else:
            return False


    def json(self):
        print(self.hashed_pw)
        return jsonify(username = self.username,
                       email = self.email)

    def info(self):

        return (self.username, self.email, self.hashed_pw, self.first_name, self.last_name,self.user_id)
