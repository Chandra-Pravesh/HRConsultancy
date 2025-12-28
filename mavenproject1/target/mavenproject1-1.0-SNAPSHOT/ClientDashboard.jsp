<%-- 
    Document   : ClientDashboard
    Created on : Oct 6, 2024, 3:38:34 PM
    Author     : C Pravesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        body {
            font-family: "Poppins", sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background-color: #f0f2f5;
            color: #333;
        }

        header {
            padding: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header1 {
            height: 5%;
            width: 100%;
            padding-left: 10%;
        }

        .header1 .container {
            min-height: 100vh;
            display: grid;
            place-items: center;
        }

        .typingtest {
            font-family: 'Courier New', Courier, monospace;
            font-size: 18px;
            font-weight: 700;
            border-right: 3px solid;
            width: 26ch;
            white-space: nowrap;
            overflow: hidden;
            animation: typing 3s steps(32) infinite;
            animation-delay: 1ms;
        }

        @keyframes typing {
            from {
                width: 0;
            }
        }

        header h1 {
            color: #004c97;
            margin: 0;
        }

        header nav a, #createJobBtn, #deleteJobBtn {
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
          #createJobBtn:hover {
            text-decoration: none;
            background-color: #004c97;
            color: white;
            transition: all 1s ease;
        }
        #deleteJobBtn:hover {
            text-decoration: none;
            background-color: #004c97;
            color: white;
            transition: all 1s ease;
        }
        

        /* New Article Section Styles */
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

        .services {
            padding: 20px;
            margin: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .services h1 {
            font-size: 28px;
            color: #004c97;
            margin-bottom: 20px;
        }

        /* CSS Grid for the service items */
        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        .service-item {
            padding: 20px;
            
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease;
        }

        .service-item h1 {
            font-size: 24px;
            color: #004c97;
        }

        .service-item p {
            line-height: 1.6;
        }

        /* Hover effect */
        .service-item:hover {
            transform: translateY(-10px); /* Lifts the service item */
            background-color: #e9ecef; /* Changes the background color */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* Adds a stronger shadow */
        }

        footer {
            background-color: #0e0e0eda;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .feedback-social-container {
            display: flex;
            flex-direction: row;
            justify-content: space-around;
            padding: 20px;
            background-color: #0e0e0eda;
            border-radius: 10px;
        }

        .feedback-section, .social-media {
            flex: 1;
            margin: 10px;
        }

        .feedback-section h2, .social-media h2 {
            font-size: 22px;
            margin-bottom: 15px;
        }

        .feedback-section form {
            margin-bottom: 20px;
        }

        .feedback-section input, .feedback-section textarea {
            width: 50%;
            padding: 10px;
            margin-bottom: 10px;
            border: none;
            border-radius: 5px;
        }

        .feedback-section button {
            padding: 10px 20px;
            border: none;
            background-color: #004c97;
            color: white;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .feedback-section button:hover {
            background-color: #006bb3;
        }

        .social-media {
            text-align: center;
        }

        .social-media .social-links {
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        .social-links a img {
            transition: transform 0.3s ease;
        }

        .social-links a:hover img {
            transform: scale(1.1); /* Zoom effect on hover */
        }

        .footer-bottom {
            margin-top: 20px;
        }

        .morelinks {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            border-radius: 10px;
        }

        .link-section {
            flex: 1;
            margin: 0 20px;
        }

        .link-section h2 {
            font-size: 18px;
            margin-bottom: 10px;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #f0f0f0;
        }

        .link-section ul {
            list-style-type: none;
            padding: 0;
        }

        .link-section ul li {
            margin: 10px 0;
        }

        .link-section ul li a {
            color: white;
            text-decoration: none;
            font-size: 13px;
            transition: color 0.3s ease;
        }

        .link-section ul li a:hover {
            color: #00bcd4; /* Color change on hover */
            text-decoration: underline; /* Underline on hover */
        }

        .morelinks:hover .link-section h2 {
            color: #00bcd4; /* Change heading color on hover */
        }

        @media (max-width: 768px) {
            header nav a {
                padding: 10px;
            }

            .morelinks {
                flex-direction: column;
                text-align: center;
            }

            .link-section {
                margin: 10px 0;
            }
        }

        @media (max-width: 768px) {
            .feedback-social-container {
                flex-direction: column;
                text-align: center;
            }

            .feedback-section, .social-media {
                flex: unset;
                margin: 20px 0;
            }
        }
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

        .popup label {
            display: block;
            margin: 10px 0 5px;
        }

        .popup input {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
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
        .styled-table {
    width: 100%;
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 18px;
    text-align: left;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
}

.styled-table thead tr {
    background-color: #004c97;
    color: #ffffff;
    text-align: left;
    font-weight: bold;
}

.styled-table th, .styled-table td {
    padding: 12px 15px;
    border-bottom: 1px solid #ddd;
}

.styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #004c97;
}

.styled-table tbody tr:hover {
    background-color: #f1f1f1;
    transition: background-color 0.3s ease;
}

        
    </style>
    </head>
    <body>
         <header>
        <h1>Amazon Pvt Ltd Dashboard</h1>
        <nav>
            <a href="ClientDashboard.jsp">LogOut</a>
            
            
        </nav>
    </header>
        <div class="article-section">
        <input id="createJobBtn"  type="Button" value="Create Job Requirement">
        <input id="deleteJobBtn" type="Button" value="Remove Job Requirement">
    </div>

    <!-- Overlay for pop-ups -->
    <div id="overlay" class="overlay"></div>

    <!-- Pop-up for creating a job -->
    <div id="createJobPopup" class="popup">
        <h2>Create Job Requirement</h2>
        <form action"JobServlets" method="GET">
             <input type="hidden" name="action" value="createJob">
            
            <label for="job_id">Job ID:</label>
            <input type="text" id="job_id" name="job_id" required>

            <label for="job_name">Job Name:</label>
            <input type="text" id="job_name" name="job_name" required>
            
             <label for="HR Id">HR Id:</label>
            <input type="number" id="Hr_Id" name="Hr_Id" required>

            <label for="openings">Openings:</label>
            <input type="number" id="openings" name="openings" required>
            
            <label for="Closing">Closing:</label>
            <input type="number" id="closing" name="closing" required>
            
            <label for="Vacancy">Vacancy"</label>
            <input type="number" id="Vacancy" name="Vacancy" required>
            
            
            <button type="submit">Create</button>
            <button type="button" class="cancel" id="cancelCreateJob">Cancel</button>
        </form>
    </div>

    <!-- Pop-up for deleting a job -->
    <div id="deleteJobPopup" class="popup">
        <h2>Remove Job Requirement</h2>
        <form id="deleteJobForm">
            <label for="del_job_id">Job ID:</label>
            <input type="text" id="del_job_id" name="del_job_id" required>

            <button type="submit">Remove</button>
            <button type="button" class="cancel" id="cancelDeleteJob">Cancel</button>
        </form>
    </div>

    <script>
        // Get elements for creating job popup
        const createJobBtn = document.getElementById("createJobBtn");
        const createJobPopup = document.getElementById("createJobPopup");
        const cancelCreateJobBtn = document.getElementById("cancelCreateJob");

        // Get elements for deleting job popup
        const deleteJobBtn = document.getElementById("deleteJobBtn");
        const deleteJobPopup = document.getElementById("deleteJobPopup");
        const cancelDeleteJobBtn = document.getElementById("cancelDeleteJob");

        // Get overlay
        const overlay = document.getElementById("overlay");

        // Show create job popup
        createJobBtn.addEventListener("click", function () {
            createJobPopup.classList.add("active");
            overlay.classList.add("active");
        });

        // Show delete job popup
        deleteJobBtn.addEventListener("click", function () {
            deleteJobPopup.classList.add("active");
            overlay.classList.add("active");
        });

        // Hide create job popup
        cancelCreateJobBtn.addEventListener("click", function () {
            createJobPopup.classList.remove("active");
            overlay.classList.remove("active");
        });

        // Hide delete job popup
        cancelDeleteJobBtn.addEventListener("click", function () {
            deleteJobPopup.classList.remove("active");
            overlay.classList.remove("active");
        });

        // Close popups when clicking on the overlay
        overlay.addEventListener("click", function () {
            createJobPopup.classList.remove("active");
            deleteJobPopup.classList.remove("active");
            overlay.classList.remove("active");
        });

        // Handle form submission (dummy handling for now)
        document.getElementById("createJobForm").addEventListener("submit", function (event) {
            event.preventDefault();
            // Here you would normally send form data to the server using AJAX or submit it traditionally.
            alert("Job Created Successfully!");
            createJobPopup.classList.remove("active");
            overlay.classList.remove("active");
        });

        document.getElementById("deleteJobForm").addEventListener("submit", function (event) {
            event.preventDefault();
            // Here you would normally send form data to the server using AJAX or submit it traditionally.
            alert("Job Removed Successfully!");
            deleteJobPopup.classList.remove("active");
            overlay.classList.remove("active");
        });
    </script>
    
    <div class="article-section">
    <h2>job Listed</h2>
    <table class="styled-table">
        <thead>
            <tr>
                <th>Job Id</th>
                <th>Job Title</th>
                <th>Create Date</th>
                <th>End Date</th>
            </tr>
        </thead>
        <tbody>
            <% 
                String query = "SELECT Job_Id, Job_Name, Job_Create_Date,Job_End_Date FROM Job_Data WHERE job_Company = 'Amazon'";

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hackathon", "admin", "admin");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery(query);

                    // Dynamically display the job listings
                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getString("Job_Id") + "</td>");
                        out.println("<td>" + rs.getString("Job_Name") + "</td>");
                        out.println("<td>" + rs.getString("Job_Create_Date") + "</td>");
                        out.println("<td>" + rs.getString("Job_End_Date") + "</td>");
                        out.println("</tr>");
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='2'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
        </tbody>
    </table>
</div>

         <div class="article-section">
        <h2>Selected Client List</h2>
        <table class="styled-table">
                    <tr>
                        <th>Candidate_Name</th>
                        <th>Candidate_Jab_Id</th>
                        <th>Candidate_Job_Name</th>
                        <th>Candidates_PhoneNo</th>
                        <th>Candidates_Email</th>
                        
                    </tr>
                    
                    <% 
                    
//                        String query = "SELECT Candidate_Name, Candidate_Jab_Title FROM SelectedCandidate WHERE Company = 'Amazon'";

                        // Fetch matching jobs from database
                        try {
                           Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hackathon", "admin", "admin");
                            String Query = "SELECT username,Job_Id,Job_Name,Candidates_PhoneNo,Candidates_Email FROM Candidates_Data WHERE Job_Company='Amazon'";
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery(query);

                            // Dynamically display the job listings
                            while (rs.next()) {
                                out.println("<tr>");
                                out.println("<td>" + rs.getString("Username") + "</td>");
                                out.println("<td>" + rs.getString("Job_Id") + "</td>");
                                out.println("<td>" + rs.getString(2) + "</td>");
                                out.println("<td>" + rs.getString(3) + "</td>");
                                out.println("<td>" + rs.getString("Candidates_Email") + "</td>");
                                out.println("</tr>");
                            }
                        } catch (Exception e) {
                            out.println("<tr><td colspan='5'>Error: " + e.getMessage() + "</td></tr>");
                        }
                    %>
                </table>
        
       
    </div>
    </body>
</html>
