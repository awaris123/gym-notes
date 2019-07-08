from flask import Flask, jsonify, request, abort, make_response
import config
import pyrebase



app = Flask(__name__)

keys = {

    "apiKey": config.apiKey,
    "authDomain": config.authDomain,
    "databaseURL": config.databaseURL,
    "projectId": config.projectId,
    "storageBucket": config.storageBucket,
    "messagingSenderId": config.messagingSenderId,
    "appId": config.appId
}

firebase = pyrebase.initialize_app(keys)
auth = firebase.auth()


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
