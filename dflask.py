#!flask/bin/python
from flask import Flask
import sys
app = Flask(__name__)
@app.route('/')
def index():
    return sys.argv[1]
if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')