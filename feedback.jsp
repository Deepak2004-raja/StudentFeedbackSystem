
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<%@ page import="com.feedback.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feedback Submitted</title>

<style>
    * {
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(135deg, #e0eafc, #cfdef3);
        min-height: 100vh;
        margin: 0;
        padding: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .container {
        background: white;
        padding: 40px 30px;
        width: 100%;
        max-width: 450px;
        text-align: center;
        border-radius: 16px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.12);
    }

    .success-icon {
        width: 70px;
        height: 70px;
        margin: 0 auto 20px;
        background: #d1fae5;
        color: #198754;
        border-radius: 50%;
        font-size: 40px;
        line-height: 70px;
    }

    h2 {
        color: #198754;
        margin-bottom: 12px;
    }

    p {
        color: #666;
        line-height: 1.6;
    }

    a {
        display: inline-block;
        margin-top: 20px;
        padding: 13px 22px;
        background: #3867d6;
        color: white;
        text-decoration: none;
        border-radius: 8px;
        font-weight: bold;
        transition: background 0.3s;
    }

    a:hover {
        background: #274baf;
    }
</style>
</head>

<body>
<div class="container">

<%
String student = request.getParameter("studentName");
String teacher = request.getParameter("teacherName");
String message = request.getParameter("feedback");

if (student == null || teacher == null || message == null
        || student.trim().isEmpty()
        || teacher.trim().isEmpty()
        || message.trim().isEmpty()) {
%>

    <h2>Feedback Not Submitted</h2>
    <p>Please fill in all the fields.</p>

<%
} else {

    String sql = "INSERT INTO feedback "
        + "(student_name, teacher_name, message) "
        + "VALUES (?, ?, ?)";

    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        ps.setString(1, student.trim());
        ps.setString(2, teacher.trim());
        ps.setString(3, message.trim());

        ps.executeUpdate();
%>
    <div class="success-icon">&#10003;</div>
    <h2>Feedback Submitted Successfully!</h2>
    <p>Your feedback has been saved.</p>

<%
    } catch (SQLException e) {
        application.log("Unable to save feedback", e);
%>

    <h2>Something Went Wrong</h2>
    <p>Feedback save aagala. Database connection-ai check pannunga.</p>

<%
    }
}
%>

    <a href="index.jsp">Give Another Feedback</a>

</div>
</body>
</html>
