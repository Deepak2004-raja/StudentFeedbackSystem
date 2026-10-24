
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <h1>Admin Login</h1>
        <p class="subtitle">Login to view student feedback</p>
        
<%
    if ("1".equals(request.getParameter("error"))) {
%>
    <p style="color: red; text-align: center; margin-bottom: 15px;">
        Invalid username or password. Please try again.
    </p>
<%
    }
%>
        

        <form action="adminDashboard.jsp" method="post">
            <label for="username">Username</label>
            <input type="text" id="username" name="username"
                   placeholder="Enter admin username" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password"
                   placeholder="Enter admin password" required>

            <input type="submit" value="Login">
        </form>

        <p class="link-text">
            <a href="index.jsp">Back to Feedback Form</a>
        </p>
    </div>
</body>
</html>
