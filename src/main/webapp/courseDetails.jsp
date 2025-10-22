<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String course = request.getParameter("course");
    if (course == null) course = "Course";
%>
<html>
<head>
    <title>EduSpark - <%= course %> Details</title>
</head>
<body>
    <h1><%= course %> Details</h1>
    <nav>
        <a href="index.jsp">Home</a> |
        <a href="courses.jsp">Courses</a> |
        <a href="instructors.jsp">Instructors</a> |
        <a href="enrollment.jsp">Enrollment</a>
    </nav>
    <p>Details for <strong><%= course %></strong> will be listed here.</p>
    <p><a href="enrollment.jsp">Enroll Now</a></p>
</body>
</html>
