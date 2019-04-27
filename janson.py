#!flask/bin/python
from flask import Flask
from flask import render_template
from flask import jsonify

app = Flask(__name__)

@app.route('/')
def index():
    return jsonify(name="Przemyslaw",
                   lastName="Galewski",
                   age=37)
if __name__ == '__main__':
    app.run(debug=True)