<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    String alertMessage = ""; // Variable to hold the alert message

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/pharmacy_mgmt_db", "root", "");

        String medicine = request.getParameter("medicine");
        String med_priceStr = request.getParameter("med_price");
        int med_price = Integer.parseInt(med_priceStr);
        String med_company = request.getParameter("med_company");
        String quantityStr = request.getParameter("quantity");
        int quantity = Integer.parseInt(quantityStr);
        String deliveryAddress = request.getParameter("deliveryAddress");
        
        String username = (String) session.getAttribute("UNAME");
        String useremail = (String) session.getAttribute("EMAIL");
        String orderid = username.substring(0, 3) + "_" + medicine.substring(0, 4) + "_" + med_company.substring(0, 5);
        String orderstatus = "placed";
        int tcost = med_price * quantity;

        if (!orderid.isEmpty() && !username.isEmpty() && !useremail.isEmpty() && !orderstatus.isEmpty() && !medicine.isEmpty() && !deliveryAddress.isEmpty() && !med_company.isEmpty() && med_price > 0 && quantity > 0 && tcost > 0) {
            pst = con.prepareStatement("INSERT INTO orders(order_id, u_name, u_email, med_name, med_company , med_price, order_qty, order_cost, order_status, delivery_addr) VALUES (?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, orderid);
            pst.setString(2, username);
            pst.setString(3, useremail);
            pst.setString(4, medicine);
            pst.setString(5, med_company);
            pst.setInt(6, med_price);
            pst.setInt(7, quantity);
            pst.setInt(8, tcost);
            pst.setString(9, orderstatus);
            pst.setString(10, deliveryAddress);
            pst.executeUpdate();
            alertMessage = "Order placed successfully!"; // Set the success alert message
        } else {
            alertMessage = "Order failed!";
        }
    } catch (Exception e) {
        alertMessage = "An error occurred while processing your order.";
        e.printStackTrace(); // You might want to log the exception for debugging purposes
    } finally {
        try {
            if (rs != null) rs.close();
            if (pst != null) pst.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception or log it
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
        <h1><%= alertMessage %></h1>
        <a href="homepage.jsp">Go to homepage</a>
    </body>
</html>
