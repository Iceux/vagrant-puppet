from flask import Flask
app = Flask(__name__)
@app.route("/")
def hello():
    return 'Hi,this is a demo! '

if __name__ == "__main__":
    app.debug = True
    app.run()
