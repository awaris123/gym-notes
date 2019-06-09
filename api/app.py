from flask import Flask, jsonify, request, abort, make_response
from user import User

app = Flask(__name__)


users = []

@app.route('/notes/api/v1.0/',methods=['GET'])
def index():
    return jsonify(exercise = "Bench Press",
                   weight = 225,
                   date = "Dec-23-1999")

@app.route('/notes/api/v1.0/sign-up', methods=['POST'])
def signup():

    member = User(request.json['username'],
                   request.json['email'],
                   request.json['password'],
                   len(users))
    if member.pw != request.json['password']:
        abort(400)
    for ppl in users:
        if member == ppl:
            abort(404)
    users.append(member)

    return member.json()

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
