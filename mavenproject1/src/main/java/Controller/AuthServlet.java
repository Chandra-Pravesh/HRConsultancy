package Controller;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

public class AuthServlet extends HttpServlet {

    // JDBC variables
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;

    // Database connection initialization
    public void init() throws ServletException {
        try {
            // Load the JDBC driver (make sure you have the JDBC driver in your classpath)
             Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hackathon", "admin", "admin");
        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException(e);
        }
    }

    // Handle GET requests (for username availability check)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        try {
            // Check if the username exists in the database
            String sql = "SELECT UserName FROM User WHERE UserName = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            rs = stmt.executeQuery();

            if (rs.next()) {
                // Username exists
                out.write("not available");
            } else {
                // Username does not exist, so it's available
                out.write("available");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Handle POST requests (for login and sign-up)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("signin") != null ? "signin" : "signup";

        if ("signin".equals(action)) {
            handleSignIn(request, response);
        } else if ("signup".equals(action)) {
            handleSignUp(request, response);
        }
    }

    private void handleSignIn(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("login_email");
        String password = request.getParameter("login_password");
        
        try {
            String sql = "SELECT * FROM User WHERE email = ? AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            if (rs.next()) {
                // Successfully signed in
                response.sendRedirect("home.jsp");
            } else {
                // Invalid credentials
                response.sendRedirect("login.jsp?error=Invalid credentials");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void handleSignUp(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("UserName");
        String email = request.getParameter("email");
        String role = request.getParameter("roles");
        String password = request.getParameter("login_password");

        try {
            // Insert a new user into the database
            String sql = "INSERT INTO User (UserName, Email, Role, Password) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, role);
            stmt.setString(4, password);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                // Successfully signed up
                response.sendRedirect("home.jsp");
            } else {
                // Sign-up failed
                response.sendRedirect("login.jsp?error=Sign-up failed");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void destroy() {
        // Close the connection when the servlet is destroyed
        try {
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
