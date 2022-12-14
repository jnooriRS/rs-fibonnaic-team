from flask import Flask
from flask import render_template, request

app = Flask(__name__)


def fib_find(N):
    num1 = 0
    num2 = 1
    find = 2
    fib_num = 0

    while find <= int(N):
        fib_num = num1 + num2
        num1 = num2
        num2 = fib_num
        find = find + 1

    return fib_num


@app.route("/home/", methods=["POST", "GET"])
def fib_converter():
    if request.method == "POST":
        user_input = request.form["number"]
        return render_template(
            "result.html",
            number_decimal=user_input,
            number_roman=fib_find(user_input),
        )
    else:
        return render_template("home.html", not_valid=False)


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5000)
