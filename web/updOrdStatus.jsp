<%@page import="java.sql.*;"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        h2 {
            text-align: center;
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
            background-color: #f2f2f2;
        }

        th {
            background-color: #B0C4DE;
        }

        select {
            width: 100%;
        }
    </style>
</head>
<body>
    <h1>Admin Portal</h1><br><br>
    <h2>Update Order Status</h2>

   
        <table border="1" align="center" style="text-align:center">
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
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pharmacy_mgmt_db", "root", "");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from orders;");
                                      
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("order_id")%></td>
                    <td><%= rs.getString("u_name") %></td>
                    <td><%= rs.getString("u_email") %></td>
                    <td><%= rs.getString("med_name") %></td>
                    <td><%= rs.getString("med_company")%></td>
                    <td><%= rs.getInt("med_price")%></td>
                    <td><%= rs.getInt("order_qty")%></td>
                    <td><%= rs.getInt("order_cost") %></td>
                    <td>
                        <%= rs.getString("order_status")%>
                       
                    </td>
                    <td><%=rs.getString("delivery_addr")%></td>
                    <!-- Add more columns as needed -->

                </tr>
                <%
                    }
                } catch (Exception e) {
                    out.print(e.getMessage());
                }
                %>
            </tbody>
        </table><br><br>
      <div style="margin-left:40vw">
         <form action="updateOrders2.jsp" method="post">
             <input type="text" id="ordId" name="ordId" style="height:30px">
           <select id="updOrdSt" name="updOrdSt" style="width: 100px;height: 25px;margin-left:  8px">
               <option value="" disabled=""></option>
                              <option value="Dispatched">Dispatched</option>
                              <option value="Delivered">Delivered</option>
           </select><br><br>
           <input type="submit" id="updBtn" name="updBtn" value="UPDATE STATUS" style="margin-left: 5vw;background-color: cadetblue;color: whitesmoke;padding: 10px;width: 130px;height: 50px">
         </form>
     </div>
</body>
</html>
