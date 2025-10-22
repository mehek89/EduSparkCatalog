<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
    String name = request.getParameter("name");
    String course = request.getParameter("course");
%>
<html>
<head><title>Enrollment Success</title></head>
<body>
<h2>Thank You, <%= name %>!</h2>
<p>You have successfully enrolled in <%= course %>.</p>
<a href="index.jsp">Back to Home</a>
</body>
</html>
