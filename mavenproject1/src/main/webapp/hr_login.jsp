<%@ page import="java.sql.*; import jakarta.* ; " %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>HR Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .login-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        .login-container h2 {
            text-align: center;
            color: #333;
        }
        .login-container label {
            font-weight: bold;
            color: #333;
        }
        .login-container input[type="text"], .login-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .login-container input[type="submit"] {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .login-container input[type="submit"]:hover {
            background-color: #45a049;
        }
        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String message = null;

    if (username != null && password != null) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hackathon", "admin", "admin");

            // Query to check if the HR username and password are correct
            String sql = "SELECT * FROM User WHERE username = ? AND password = ? AND role = 'HR'";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                // HR user found, redirect to Hr_Dashboard.java servlet
                response.sendRedirect("Hr_Dashboard"); // Servlet mapping should be correct
            } else {
                // Invalid credentials, show error message
                message = "Invalid HR credentials!";
            }
        } catch (Exception e) {
            message = "Error: " + e.getMessage(); // Display exception error message
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    }
%>

<div class="login-container">
    <h2>HR Login</h2>
    
    <form action="hr_login.jsp" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>
        
        <input type="submit" value="Login">
    </form>
    
    <% if (message != null) { %>
        <p class="error"><%= message %></p>
    <% } %>
</div>

</body>
</html>
