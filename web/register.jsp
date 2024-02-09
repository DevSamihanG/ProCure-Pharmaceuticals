<%-- 
    Document   : login
    Created on : 13 Dec, 2023, 9:18:57 PM
    Author     : samih
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<%
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost/pharmacy_mgmt_db","root","");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String alertMessage = ""; // Variable to hold the alert message
    if (email != null && password != null) {
        if (!email.isEmpty() && !password.isEmpty()) {
            pst = con.prepareStatement("INSERT INTO users (name, email, password) VALUES (?, ?, ?)");
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, password);
            pst.executeUpdate();
//            session.setAttribute("email", email);
//            response.sendRedirect("index.jsp");
//            alertMessage = "Logged in successfully!"; // Set the success alert message
            response.sendRedirect("login.html");
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ProCure Pharmaceuticals</title>
    </head>
    <body>
    </body>
</html>
