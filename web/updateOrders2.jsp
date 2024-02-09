<%-- 
    Document   : updateOrders2
    Created on : 19 Dec, 2023, 10:04:52 PM
    Author     : samih
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;"%>

<%
     Connection con = null;
    PreparedStatement pst = null;
//    ResultSet rs;
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost/pharmacy_mgmt_db","root","");
    String updOrdSt = request.getParameter("updOrdSt");
    String ordId = request.getParameter("ordId");
    String alertMessage = ""; // Variable to hold the alert message
    if (updOrdSt != null) {
        if (!updOrdSt.isEmpty()) {
            pst = con.prepareStatement("UPDATE orders SET order_status=? WHERE order_id=?");
            pst.setString(1, updOrdSt);
            pst.setString(2, ordId);
            pst.executeUpdate();

    out.println("Update successful!");
//            session.setAttribute("email", email);
//            response.sendRedirect("index.jsp");
//            alertMessage = "Logged in successfully!"; // Set the success alert message
        }
    }
    %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
    </head>
    <body>
        <h2 style="color:red;background-color: bisque;border:2 px solid black;padding:30px">Updated Successefully !</h2>
    </body>
</html>
