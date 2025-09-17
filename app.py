from flask import Flask, render_template_string, request

app = Flask(__name__)

# HTML template as a string for simplicity
html_form = """
<!doctype html>
<title>Student Form</title>
<h2>Student Registration Form</h2>
<form method="post">
  Name: <input type="text" name="name" required><br><br>
  Age: <input type="number" name="age" required><br><br>
  Courses: <input type="text" name="course" required><br><br>
  <input type="submit" value="Submit">
</form>

{% if student %}
<h3>Submitted Data:</h3>
<ul>
  <li>Name: {{ student.name }}</li>
  <li>Age: {{ student.age }}</li>
  <li>Course: {{ student.course }}</li>
</ul>
{% endif %}
"""

@app.route("/", methods=["GET", "POST"])
def student_form():
    student = None
    if request.method == "POST":
        student = {
            "name": request.form["name"],
            "age": request.form["age"],
            "course": request.form["course"]
        }
    return render_template_string(html_form, student=student)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
