import json

with open('config.json') as file_handler:
    data = json.loads(file_handler.read())

for key, value in data.items():
    print(f'key: {key}, value: {value}')

with open('tekst.txt', 'w') as file_handler:
    for key, value in data.items():
        file_handler.write(f'{key} = {value}\n')