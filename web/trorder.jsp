 <%@page import="java.sql.*;"%>
    <%
    // Retrieve session attributes
    String username = (String) session.getAttribute("UNAME");
    String useremail = (String) session.getAttribute("EMAIL");
    %>

<!DOCTYPE html>
<html>
<head>
    <title>Jsp Sample</title>
   
     <style>
        body {
            background-color: #E0E0E0;
            font-family: 'Arial', sans-serif;
        }

        h1 {
            margin-top: 30px;
            text-align: center;
            color: #333;
            text-shadow: 2px 2px 4px #aaa;
            margin-bottom: 30px;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
            background-color: #f2f2f2
        }

        th {
            background-color: #B0C4DE;
        }
    </style>
</head>
<body>
    <h1>Track Orders</h1>
    
    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=(Connection)DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/pharmacy_mgmt_db","root","");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from orders;");
    %>
    <table border=1 align=center style="text-align:center">
        <thead>
            <tr>
                <th>Order ID</th>
                <th>User Name</th>
                <th>User Email</th>
                <th>Medicine Name</th>
                <th>Medicine Company</th>
                <th>Medicine Price</th>
                <th>Order Quantity</th>
                <th>Order Cost</th>
                <th>Order Status</th>
                <th>Delivery Address</th>
            </tr>
        </thead>
        <tbody>
            <%
            while(rs.next()) {
                String order_id = rs.getString("order_id");
                String order_status = rs.getString("order_status");
            %>
            <tr>
                <td><%= order_id %></td>
                <td><%= rs.getString("u_name") %></td>
                <td><%= rs.getString("u_email") %></td>
                <td><%= rs.getString("med_name") %></td>
                <td><%= rs.getString("med_company")%></td>
                <td><%= rs.getInt("med_price")%></td>
                <td><%= rs.getInt("order_qty")%></td>
                <td><%= rs.getInt("order_cost") %></td>
                <td><%= order_status %></td>
                <td><%= rs.getString("delivery_addr")%></td>
<!--                <td>
                    <%
                    // Add a link to updOrStatus.jsp if the order status is "Placed"
                    if ("Placed".equals(order_status)) {
                    %>
                        <a href="updOrStatus.jsp?order_id=<%= order_id %>">Update Status</a>
                    <%
                    }
                    %>
                </td>-->
            </tr>
            <%
            }
            %>
        </tbody>
    </table><br>
    <%
    }
    catch(Exception e){
        out.print(e.getMessage());
    }
    %>
</body>
</html>
