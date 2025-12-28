import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;

// Servlet to handle authentication
@WebServlet("/AuthServlet")
public class AuthServlet extends HttpServlet {
    Connection con;
    Statement smt;
    ResultSet rs;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check username availability
        String username = request.getParameter("username");
    try{
        PrintWriter out = response.getWriter();
         con = DriverManager.getConnection("jdbc:derby://localhost:1527/example", "root", "root");
        String Query1 = "SELECT * FROM User_Data WHERE Username = '"+username+"'";
        rs = smt.executeQuery(Query1);
            if (rs.next()) {
                out.write("unavailable");
            } else {
                out.write("available");
            }
        } catch (SQLException ex) {
            Logger.getLogger(AuthServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("signin") != null ? "signin" : "signup";
        
        if ("signin".equals(action)) {
            // Handle Sign-In
            String email = request.getParameter("login_email");
            String password = request.getParameter("login_password");

            // Simulated login check (replace with actual DB check)
            if ("admin@example.com".equals(email) && "1234".equals(password)) {
                // Successful login, create session
                HttpSession session = request.getSession();
                session.setAttribute("user", email);
                response.sendRedirect("home.html");
            } else {
                // Login failed, send back to login page with error
                request.setAttribute("errorMessage", "Invalid email or password.");
                request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
            }
        } else if ("signup".equals(action)) {
            // Handle Sign-Up
            String username = request.getParameter("UserName");
            String password = request.getParameter("Password");
            String email = request.getParameter("email");
            String roles[] = request.getParameterValues("roles");

            // Save user to database (dummy message for now)
            // In real scenarios, check for username availability and insert into the DB

            // Redirect to login page after sign-up
            request.setAttribute("message", "Sign-Up successful! Please login.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}