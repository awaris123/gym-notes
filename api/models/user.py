from flask import jsonify
from passlib.apps import custom_app_context as pwd

class User:

    def __init__ (self,username="", email="", pw = "", id=0):
        self.username = username
        self.email = email
        self.hashed_pw = pwd.encrypt(pw)
        self.user_id = id

    def __eq__(self, other):
        if self.username == other.username or self.email == other.email:
            return True
        else:
            return False
    def verify_pw(self, password):
        return pwd.verify(password, self.hashed_pw)

    def set_hash(self, hash):
        self.hashed_pw = hash

    def json(self):
        print(self.hashed_pw)
        return jsonify(username = self.username,
                       email = self.email,
                       pw_hash = self.hashed_pw,
                       id = self.user_id)

    def info(self):
                return jsonify(username = self.username,
                               email = self.email,
                               id = self.user_id)
