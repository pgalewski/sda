import json

from flask import Flask
app = Flask(__name__)

@app.route('/', methods=['GET'])
def hello_world():
    with open ('hello.html') as file_handler:
        data = file_handler.read()
    return data


@app.route('/app/api/v1/info', methods=['GET'])
def version():
    data = {
        'version' : '1.0.0',
        'author' : 'Przemyslaw'
    }
    return json.dumps(data)


app.run()