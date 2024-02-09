<%-- 
    Document   : admin
    Created on : 18 Dec, 2023, 10:18:27 PM
    Author     : samih
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost/pharmacy_mgmt_db","root","");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String adminKey = request.getParameter("adminKey");
    String alertMessage = ""; // Variable to hold the alert message
    if (email != null && password != null) {
        if (!email.isEmpty() && !password.isEmpty()) {
            pst = con.prepareStatement("SELECT * FROM admin WHERE email=? AND pwd=? AND admin_key=?");
            pst.setString(1, email);
            pst.setString(2, password);
            pst.setString(3, adminKey);
            rs = pst.executeQuery();
//            session.setAttribute("email", email);
//            response.sendRedirect("updOrdStatus.html");
            
//            alertMessage = "Logged in successfully!"; // Set the success alert message
                if (rs.next()) {
//                    
                    String a_name = rs.getString("name");
                    String a_email = rs.getString("email");
               
                session.setAttribute("ANAME", a_name);
                session.setAttribute("AEMAIL", a_email);
                
                // Redirect to a welcome page or dashboard
                response.sendRedirect("updOrdStatus.jsp");
            } else {
                // Invalid login, show an error message
                out.println("<p style='color:red;'>Invalid email or password. Please try again.</p>");
            }
                
                
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
