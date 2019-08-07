from flask import Flask, jsonify, request, abort, make_response
import firebase_admin
from firebase_admin import credentials, auth

app = Flask(__name__)

cred = credentials.Certificate("gym-notes-f8bbe-firebase-adminsdk-rmrwf-545e8543f5.json")
firebase_admin.initialize_app(cred)

'''Create user account'''

@app.route('/notes/api/v1.0/users', methods=['POST'])
def signup():

    print("signup endpoint called")

    email = request.json['email']
    password = request.json['password']
    confirm = request.json['confirm-pw']
    print("recived request body")

    if email and password and confirm:
        print("valid request body")
        if password == confirm:
            user = auth.create_user(email=email, password=password)
            print('Sucessfully created new user: {0}'.format(user.uid))

            custom_token = auth.create_custom_token(user.uid)
            print("returned auth token")
            return jsonify(custom_token)

    return jsonify({"Status":"No argumemnts"})


@app.route('/notes/api/v1.0/users', methods = ['GET'])
def getEmail():


    token = request.json['token']
    decoded_tok = auth.verify_id_token(token)
    uid = decoded_tok['uid']
    user = auth.get_user(uid)
    response = jsonify({"Email":user.email})
    return response





if __name__ == '__main__':
    app.run(debug=True)
