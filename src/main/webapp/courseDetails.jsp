<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
    String courseId = request.getParameter("courseId");
    String courseName = "";
    if("1".equals(courseId)) courseName = "Java Basics";
    else if("2".equals(courseId)) courseName = "Web Development";
    else if("3".equals(courseId)) courseName = "Data Science";
%>
<html>
<head><title>Course Details</title></head>
<body>
<h2>Course Details: <%= courseName %></h2>
<p>Description of <%= courseName %> goes here.</p>
<a href="courses.jsp">Back to Courses</a>
</body>
</html>
