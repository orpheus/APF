from flask import Flask
from flask import render_template

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello world!"

@app.route('/hello/')
@app.route('/hello/<name>')
def hell(name=None):
    return render_template('hello.html', name=name)

if __name__ == "__main__":
    app.run()
