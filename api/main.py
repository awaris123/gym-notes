from flask import Flask, jsonify, request
from Models.User import User
app = Flask(__name__)



'''Create user account'''

@app.route('/notes/api/users', methods=['POST'])
def add_user():
    try:
        new_user = User(request.json["email"], request.json["password"])
        response = new_user.create()

    except:
        response = {"message" : "BAD_REQUEST"}

    return jsonify(response)


'''Delete a user account'''

@app.route('/notes/api/users', methods=['DELETE'])
def del_user():
    try:
        new_user = User(id_token = request.json['id_token'])
        response = new_user.delete()

    except:
        response = {"message" : "BAD_REQUEST"}

    return jsonify(response)




if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8081, debug=True)
