from flask import Flask, jsonify, request, abort, make_response
import firebase_admin
from firebase_admin import credentials, auth

app = Flask(__name__)

cred = credentials.Certificate("gym-notes-f8bbe-firebase-adminsdk-rmrwf-545e8543f5.json")
firebase_admin.initialize_app(cred)

'''Create user account'''

@app.route('/notes/api/v1.0/users', methods=['POST'])
def signup():

    email = request.json['email']
    password = request.json['password']
    confirm = request.json['confirm-pw']

    if email and password and confirm:
        if password == confirm:
            user = auth.create_user(email=email, password=password)

            print('Sucessfully created new user: {0}'.format(user.uid))
            custom_token = auth.create_custom_token(user.uid)
            return jsonify(custom_token)

    return jsonify({"Status":"No argumemnts"})



'''User authentication'''

@app.route('/notes/api/v1.0/users/', methods = ['GET'])
def login():
    email = request.json['email']
    password = request.json['password']
    user = auth.get_user_by_email(email)
    if user:
        if user.password_hash == password:
            pass
    uid = 'some-uid'

    custom_token = auth.create_custom_token(uid)

    print(email, password)
    return jsonify({"email":email, "password":password})





if __name__ == '__main__':
    app.run(debug=True)
