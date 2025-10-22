<html>
<head><title>Enroll</title></head>
<body>
<h2>Enroll in a Course</h2>
<form action="enrollSuccess.jsp" method="post">
    Name: <input type="text" name="name" required><br><br>
    Course:
    <select name="course">
        <option value="Java Basics">Java Basics</option>
        <option value="Web Development">Web Development</option>
        <option value="Data Science">Data Science</option>
    </select><br><br>
    <input type="submit" value="Enroll">
</form>
<a href="index.jsp">Back to Home</a>
</body>
</html>
