<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.sql.*" %>

<%
    // Retrieve session attributes
    String username = (String) session.getAttribute("UNAME");
    String useremail = (String) session.getAttribute("EMAIL");
    
    session.setAttribute("UNAME", username);
    session.setAttribute("EMAIL", useremail);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pharmacy Management System</title>
    <style>       
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        #welcome-container {
            margin-left: 100px;
            margin-bottom: 20px;
            width: 50%; 
        }

        .word-art {
            font-size: 36px;
            font-weight: bold;
            color: #333;
            
        }
        .square {
            text-align: center;
            padding: 60px;
            margin: 30px; 
            border: 2px solid #ddd;
            border-radius: 30px;
            background-color: #fff;
            transition: transform 0.2s ease-in-out;
        }

        .square:hover {
            transform: scale(1.1);
        }

        .square img {
            width: 300px;
            height: 300px;
            object-fit: cover;
            border-radius: 50%;
        }

        .button {
            margin-top: 20px;
            font-size: 24px;
            font-weight: bold;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            background-color: #4caf50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div id="welcome-container">
        <div class="word-art">Welcome to ProCure Pharmaceuticals</div>
        <%-- Display username and email from session --%>
        <% if (username != null && useremail != null) { %>
            <div>User: <%= username %></div>
            <div>Email: <%= useremail %></div>
        <% } %>
    </div>
    
    <div class="square">
        <img src="medicine1.jpg">
        <div class="button" onclick="location.href='orders.html'">Order Medicines</div>
    </div>

    <div class="square">
        <img src="trackorder.jpg">
        <div class="button" onclick="location.href='trorder.jsp'">Track Orders</div>
    </div>

    <div class="square">
        <img src="doctor.jpg">
        <div class="button" onclick="location.href='doctors.html'">Consult Doctors</div>
    </div>
   
    
</body>
</html>
