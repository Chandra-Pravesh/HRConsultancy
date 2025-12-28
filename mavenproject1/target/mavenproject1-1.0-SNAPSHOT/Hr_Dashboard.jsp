
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assigned Job Requirement</title>
        <style>
            /* Body Styles */
            body {
                font-family: "Poppins", sans-serif;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                background-color: #f0f2f5;
                color: #333;
            }

            /* Header Styles */
            header {
                padding: 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            header h1 {
                color: #004c97;
                margin: 0;
            }

            header nav a {
                color: #004c97;
                margin-left: 20px;
                padding: 10px;
                border-radius: 10px;
                text-decoration: none;
                font-weight: bold;
                border: 2px solid #004c97;
            }

            header nav a:hover {
                text-decoration: none;
                background-color: #004c97;
                color: white;
                transition: all 1s ease;
            }

            /* Article Section */
            .article-section {
                padding: 20px;
                margin: 20px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .article-section h2 {
                color: #004c97;
                margin-bottom: 15px;
            }

            .article-section p {
                line-height: 1.6;
                margin-bottom: 15px;
            }

            /* Overlay Styles */
            .overlay {
                position: fixed;
                display: none;
                width: 100%;
                height: 100%;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: rgba(0, 0, 0, 0.7);
                z-index: 1000;
            }

            /* Pop-up window styles */
            .popup {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 350px;
                background: white;
                border-radius: 8px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
                padding: 20px;
                z-index: 1001;
                display: none;
            }

            .popup h2 {
                margin-bottom: 20px;
                font-size: 22px;
            }

            .popup table {
                width: 100%;
                border-collapse: collapse;
            }

            .popup table th, .popup table td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            .popup button {
                background-color: #333;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .popup button.cancel {
                background-color: #f44336;
            }

            /* Displaying the pop-up when the overlay is active */
            .overlay.active,
            .popup.active {
                display: block;
            }
        </style>
    </head>
    <body>
        <header>
            <h1>Hello HR Rakesh Kumar</h1>
            <nav>
                <a href="ClientDashboard.jsp">LogOut</a>
            </nav>
        </header>

        <div class="article-section">
            <h2>Assigned Job Requirement</h2>

            <!-- Example Job Requirement Display -->
             <%
                // Mock job data, could be replaced with database call
                String jobId = "J1001";
                String jobName = "Software Developer";
                String company = "Tech Solutions";
                String createdDate = "2024-10-05";
                String query = "SELECT Job_Id, Job_Name, Job_Create_Date,Job_End_Date,job_company FROM Job_Data WHERE job_hr = 'Sophia Blue'";
                String Id;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hackathon", "admin", "admin");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery(query);

                    // Dynamically display the job listings
                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<p><strong>Job ID:</strong> "+ rs.getString("Job_Id")+"</p>");
                        out.println("<p><strong>Job_Name:</strong> "+ rs.getString("Job_Name")+"</p>");
                        out.println("<p><strong>job_company</strong> "+ rs.getString("job_company")+"</p>");
                        out.println("<p><strong>Job_Create_Date:</strong> "+ rs.getString("Job_Create_Date")+"</p>");
                         out.println("<p><strong>Job_End_Date</strong> "+ rs.getString("Job_End_Date")+"</p>");
                          out.println("<p><strong>Job_Create_Date:</strong> "+ rs.getString("Job_Create_Date")+"</p>");
                        out.println("</tr> <button id='viewStudentsBtn'>View Selected Students</button> <hr>");
                }
                }
                catch(Exception ex){
                out.println(ex);
                }
                 

            %>

            <p><strong>Job ID:</strong> <%= jobId %></p>
            <p><strong>Job Name:</strong> <%= jobName %></p>
            <p><strong>Company:</strong> <%= company %></p>
            <p><strong>Created Date:</strong> <%= createdDate %></p>

            <!-- Button to show selected student details in a pop-up -->
            <button id="viewStudentsBtn">View Selected Students</button>
        </div>

        <!-- Overlay for pop-up -->
        <div id="overlay" class="overlay"></div>

        <!-- Pop-up window for showing selected student details -->
        <div id="studentDetailsPopup" class="popup">
            <h2>Selected Students</h2>
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Phone No</th>
                        <th>Job Title</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Example student details -->
                    <tr>
                        <td>John Doe</td>
                        <td>123-456-7890</td>
                        <td><%= jobName %></td>
                    </tr>
                    <tr>
                        <td>Jane Smith</td>
                        <td>987-654-3210</td>
                        <td><%= jobName %></td>
                    </tr>
                </tbody>
            </table>
            <button type="button" class="cancel" id="closePopupBtn">Close</button>
        </div>

        <script>
            // Get elements
            const viewStudentsBtn = document.getElementById("viewStudentsBtn");
            const studentDetailsPopup = document.getElementById("studentDetailsPopup");
            const closePopupBtn = document.getElementById("closePopupBtn");
            const overlay = document.getElementById("overlay");

            // Show pop-up when "View Selected Students" button is clicked
            viewStudentsBtn.addEventListener("click", function () {
                studentDetailsPopup.classList.add("active");
                overlay.classList.add("active");
            });

            // Hide pop-up when "Close" button is clicked
            closePopupBtn.addEventListener("click", function () {
                studentDetailsPopup.classList.remove("active");
                overlay.classList.remove("active");
            });

            // Hide pop-up when overlay is clicked
            overlay.addEventListener("click", function () {
                studentDetailsPopup.classList.remove("active");
                overlay.classList.remove("active");
            });
        </script>
    </body>
</html>
