from flask import Flask, request, render_template

app = Flask(__name__)

@app.route('/')
def main():
    return render_template("login.html")
if __name__ == "__main__":
    app.run(host="0.0.0.0", port = 5050)