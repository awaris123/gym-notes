from flask import Flask, jsonify, request, abort, make_response
from models.user import User
import mysql.connector


app = Flask(__name__)


users = []

mydb = mysql.connector.connect(host="gym-notes.cj6ntdmjz9qf.us-east-1.rds.amazonaws.com",
                               user="gym_log_db_1234" ,
                               passwd="V7qEz8kaqSs4zBN",
                               database="gym_log_db_1234")

cursor = mydb.cursor()

cursor.execute("SHOW databases")

# dummy endpoint for sample output
@app.route('/notes/api/v1.0/',methods=['GET'])
def index():
    return jsonify(exercise = "Bench Press",
                   weight = 225,
                   date = "Dec-23-1999")

# allows user to create accounts
@app.route('/notes/api/v1.0/sign-up', methods=['POST'])
def signup():

    name = request.json['username']
    email = request.json['email']
    password = request.json['password']
    confirm = request.json['confirm-pw']
    if len(users) == 0:
        id = 0
    else:
         id = users[-1].id + 1

    member = User(name,email,password,id)

    if not name or not email or not password or not confirm:
        abort(400) # missing args

    if password != confirm:
        abort(400) # password does not match confirm

    for ppl in users:
        if member == ppl:
            abort(404) # account credentials not available
    users.append(member)

    return member.info()

# authenticates users and logs them in
@app.route('/notes/api/v1.0/login', methods = ['GET'])
def login():
    pass


@app.errorhandler(404)
def not_found(error):
    return make_response(jsonify({'error': 'Resource Not Found'}), 404)

@app.errorhandler(400)
def not_found(error):
    return make_response(jsonify({'error': 'Bad Request'}), 400)
if __name__ == '__main__':
    app.run(debug=True)
