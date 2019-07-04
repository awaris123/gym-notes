from flask import Flask, jsonify, request, abort, make_response
import pyrebase

from models.user import User


app = Flask(__name__)

config = {

    "apiKey": "AIzaSyCX2lMCCTI5Nk8GwuL1MTU-ujSFMH7tSEM",
    "authDomain": "gym-notes-f8bbe.firebaseapp.com",
    "databaseURL": "https://gym-notes-f8bbe.firebaseio.com",
    "projectId": "gym-notes-f8bbe",
    "storageBucket": "",
    "messagingSenderId": "926581369021",
    "appId": "1:926581369021:web:9dfafa08087d8612"
}

firebase = pyrebase.initialize_app(config)
auth = firebase.auth()


@app.route('/notes/api/v1.0/', methods=['GET'])
def dummy():
    return "Hello"

'''Create user account'''

@app.route('/notes/api/v1.0/users', methods=['POST'])
def signup():


    email = request.json['email']
    password = request.json['password']
    confirm = request.json['confirm-pw']

    if email and password and confirm:
        if password == confirm:
            user = auth.create_user_with_email_and_password(email, password)
            return jsonify({"Status":"Account Created",
                            "UserID": auth.get_account_info(user["idToken"])})

    return jsonify({"Status":"No argumemnts"})



'''Login and user authentication'''

@app.route('/notes/api/v1.0/users/auth', methods = ['POST'])
def login():
    email = request.json['email']
    password = request.json['password']
    if email and password :
        user = auth.sign_in_with_email_and_password(email, password)
        return jsonify({"Status":" Logged In",
                        "User": auth.get_account_info(user["idToken"])})



if __name__ == '__main__':
    app.run(debug=True)
