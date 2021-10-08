from flask import Flask
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

class Hi(Resource):
    def get(self):
        print('Hi')
        return {'blz': 'melo?'}

class Health(Resource):
    def get(self):
        print('Health')
        return {'ok': "It is working" }

api.add_resource(Hi, '/')
api.add_resource(Health, '/health')

if __name__ == '__main__':
    app.run(debug=True)