from flask import Flask, jsonify, request, abort, make_response
import firebase_admin
from firebase_admin import credentials, auth

app = Flask(__name__)


cred = credentials.Certificate("gym-notes-f8bbe-firebase-adminsdk-rmrwf-545e8543f5.json")
firebase_admin.initialize_app(cred)

'''Create user account'''

@app.route('/notes/api/v1.0/users', methods=['POST'])
def create_account():

    response = "OK"

    try:
        email = request.json['email']
        password = request.json['password']
        confirm = request.json['confirm-pw']

        if email and password and confirm and (password == confirm):
            user = auth.create_user(email=email, password=password)

            custom_token = auth.create_custom_token(user.uid)

    except:
        response = "BAD_REQUEST"

    return response




@app.route('/notes/api/v1.0/users', methods = ['GET'])
def getEmail():

    response = "OK"
    return response





if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8081, debug=True)
