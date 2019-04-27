#!flask/bin/python
from flask import Flask
from flask import render_template
import json
import sys
f = open(sys.argv[1], "r")
data = json.loads(f.read())
print(data["port"])
print(data["app_name"])

app = Flask(data["app_name"])

@app.route('/')
def index():
    return render_template('index.html')
if __name__ == '__main__':
        app.run(debug=True, port=data["port"])