<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<%@ page import="com.feedback.DBConnection" %>

<%
    if (!Boolean.TRUE.equals(session.getAttribute("adminLoggedIn"))) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Feedback Dashboard</title>

<link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/style.css">

<style>
    body {
        display: block;
        padding: 30px;
    }

    .dashboard {
        max-width: 1100px;
        margin: 20px auto;
        background: white;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.12);
    }

    h1 {
        color: #243b55;
        margin-bottom: 10px;
    }

    .subtitle {
        margin-bottom: 25px;
    }

    .table-wrapper {
        overflow-x: auto;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        padding: 14px;
        border-bottom: 1px solid #ddd;
        text-align: left;
    }

    th {
        background: #3867d6;
        color: white;
    }

    tr:nth-child(even) {
        background: #f4f7fc;
    }

    .back-link {
        display: inline-block;
        margin-top: 25px;
        padding: 12px 20px;
        background: #3867d6;
        color: white;
        text-decoration: none;
        border-radius: 7px;
    }

    .error {
        color: #b42318;
    }
</style>
</head>

<body>

<div class="dashboard">

    <h1>Admin Feedback Dashboard</h1>
    <p class="subtitle">View all submitted student feedback</p>

    <div class="table-wrapper">
        <table>
            <tr>
                <th>ID</th>
                <th>Student Name</th>
                <th>Teacher Name</th>
                <th>Feedback</th>
                <th>Submitted At</th>
            </tr>

            <%
            String sql = "SELECT id, student_name, teacher_name, "
                       + "message, submitted_at FROM feedback "
                       + "ORDER BY id DESC";

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                boolean found = false;

                while (rs.next()) {
                    found = true;
            %>

            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("student_name") %></td>
                <td><%= rs.getString("teacher_name") %></td>
                <td><%= rs.getString("message") %></td>
                <td><%= rs.getTimestamp("submitted_at") %></td>
            </tr>

            <%
                }

                if (!found) {
            %>

            <tr>
                <td colspan="5">No feedback submitted yet.</td>
            </tr>

            <%
                }

            } catch (SQLException e) {
                application.log("Unable to load feedback", e);
            %>

            <tr>
                <td colspan="5" class="error">
                    Unable to load feedback. Please check the database connection.
                </td>
            </tr>

            <%
            }
            %>

        </table>
    </div>

    <a class="back-link" href="index.jsp">Back to Feedback Form</a>
    
<a class="back-link" href="adminLogout.jsp"
   style="background: #dc3545; margin-left: 10px;">
    Logout
</a>
    

</div>

</body>
</html>