<%-- 
    Document   : login
    Created on : 13 Dec, 2023, 11:35:35 PM
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
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String alertMessage = ""; // Variable to hold the alert message
    if (email != null && password != null) {
        if (!email.isEmpty() && !password.isEmpty()) {
            pst = con.prepareStatement("SELECT * FROM users WHERE email=? AND password=?");
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();
//            session.setAttribute("email", email);
//            response.sendRedirect("index.jsp");
            
//            alertMessage = "Logged in successfully!"; // Set the success alert message
                if (rs.next()) {
                    
                    String u_name = rs.getString("Name");
            String u_email = rs.getString("email");
               
                session.setAttribute("UNAME", u_name);
                session.setAttribute("EMAIL", u_email);
                
                // Redirect to a welcome page or dashboard
                response.sendRedirect("homepage.jsp");
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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
