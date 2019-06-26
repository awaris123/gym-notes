from flask import Flask, jsonify, request, abort, make_response
from models.user import User
import mysql.connector


app = Flask(__name__)

mydb = mysql.connector.connect(host="gym-notes.cj6ntdmjz9qf.us-east-1.rds.amazonaws.com",
                               user="gym_log_db_1234" ,
                               passwd="V7qEz8kaqSs4zBN",
                               database="gym_log_db_1234")

cursor = mydb.cursor(buffered=True)

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

    fname = request.json['firstname']
    lname = request.json['lastname']
    user = request.json['username']
    email = request.json['email']
    password = request.json['password']
    confirm = request.json['confirm-pw']
    member = User(user,email,password, fname, lname)

    if not fname or not lname or not user or not email or not password or not confirm:
        abort(400) # missing args

    if password != confirm:
        abort(400) # password does not match confirm

    cursor.execute("SELECT username, email FROM User")
    results = cursor.fetchall()

    issue = ""
    for res in results:
        print(res)
        if res[0] == member.username:
            issue += "That username already in use\n"
        if res[1] == member.email:
            issue += "That email is already associated with another account\n"

    if issue:
        return issue
    else:
        ADD_USER = ("INSERT INTO User "
                   "(username, email, hashed_pw, firstname, lastname, user_id) "
                   "VALUES (%s, %s, %s, %s, %s, %s)")


        cursor.execute(ADD_USER,member.info())
        mydb.commit()


        return member.json()

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
