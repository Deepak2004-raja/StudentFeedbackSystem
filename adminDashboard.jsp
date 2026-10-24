<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if ("admin".equals(username) && "Admin@123".equals(password)) {
        session.setAttribute("adminLoggedIn", true);
        response.sendRedirect("viewFeedback.jsp");
        return;
    } else {
        response.sendRedirect("adminLogin.jsp?error=1");
        return;
    }
%>