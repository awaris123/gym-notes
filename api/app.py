from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/notes/api/v1/')
def index():
    return jsonify(exercise = "Bench Press",
                   weight = 225,
                   date = "Dec-23-1999")

if __name__ == '__main__':
    app.run(debug=True)
