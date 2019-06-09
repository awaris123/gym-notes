from flask import jsonify

class User:

    def __init__ (self,username, email, pw, id=0):
        self.username = username
        self.email = email
        self.pw = pw
        self.id = id

    def __eq__(self, other):
        if self.username == other.username or self.email == other.email:
            return True
        else:
            return False


    def json(self):
        return jsonify(username = self.username,
                       email = self.email,
                       password = self.pw,
                       id = self.id)
