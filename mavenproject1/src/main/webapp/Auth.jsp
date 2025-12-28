<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Shantell+Sans:ital,wght@0,300..800;1,300..800&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: poppins;
        }

        body {
            background: whitesmoke; /* Updated gradient colors */
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            height: 100vh;
            
        }

        .container {
            background-color: #f0f0f0;
            border-radius: 30px;
            box-shadow: 0 5px 25px black;
            position: relative;
            overflow: hidden;
            width: 768px;
            max-width: 100%;
            min-height: 480px;
        }
        input[type=radio]{
            accent-color:#004c97;
        }
        .container p {
            font-size: 14px;
            line-height: 20px;
            letter-spacing: 0.3px;
            margin: 20px 0;
            color: white; /* Changed text color */
        }

        .container span {
            font-size: 12px;
            color: #004c97; /* Changed text color */
        }

        .container a {
            color: #004c97; /* Changed link color */
            font-size: 13px;
            text-decoration: none;
            margin: 15px 0 10px;
           
        }

        .container button {
            background-color:  #004c97; /* Keep button background */
            color: white;
            font-size: 12px;
            padding: 10px 45px;
            border: 1px solid transparent;
            border-radius: 8px;
            font-weight: 600;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            margin-top: 10px;
            cursor: pointer;
        }

        .container button.hidden {
            background-color: transparent;
            border-color: #004c97; /* Changed hidden button border color */
        }

        .container form {
            background-color: #f0f0f0;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 40px;
            height: 100%;
        }

        .container input {
            background-color: #ddd;
            border: none;
            margin: 8px 0;
            padding: 10px 15px;
            font-size: 13px;
            border-radius: 8px;
            width: 100%;
            outline: none;
            color: #333;
        }

        .form-container {
            position: absolute;
            top: 0;
            height: 100%;
            transition: all 0.6s ease-in-out;
        }

        .sign-in {
            left: 0;
            width: 50%;
            z-index: 2;
        }

        .container.active .sign-in {
            transform: translateX(100%);
        }

        .sign-up {
            left: 0;
            width: 50%;
            opacity: 0;
            z-index: 1;
        }

        .container.active .sign-up {
            transform: translateX(100%);
            opacity: 1;
            z-index: 5;
            animation: move 0.6s;
        }
         
        @keyframes move {
            0%,
            49.99% {
                opacity: 0;
                z-index: 1;
            }

            50%,
            100% {
                opacity: 1;
                z-index: 5;
            }
        }

        .social-icons {
            margin: 20px 0;
        }

        .social-icons a {
            border: 1px solid #ccc;
            border-radius: 20%;
            display: inline-flex;
            justify-content: center;
            align-items: center;
            margin: 0 3px;
            width: 40px;
            height: 40px;
            color: #004c97; /* Changed icon color */
        }

        .toggle-container {
            position: absolute;
            top: 0;
            left: 50%;
            width: 50%;
            height: 100%;
            overflow: hidden;
            transition: all 0.6s ease-in-out;
            border-radius: 150px 0 0 180px;
            z-index: 1000;
        }

        .container.active .toggle-container {
            transform: translateX(-100%);
            border-radius: 0 150px 100px 0;
        }

        .toggle {
            background-color: #004c97; /* Changed toggle background color */
            height: 100%;
            background: linear-gradient(to right, #0066cc, #004c97); /* Updated gradient colors */
            color: #fff;
            position: relative;
            left: -100%;
            height: 100%;
            width: 200%;
            transform: translateX(0);
            transition: all 0.6s ease-in-out;
        }

        .container.active .toggle {
            transform: translateX(50%);
        }

        .toggle-panel {
            position: absolute;
            width: 50%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 30px;
            text-align: center;
            top: 0;
            transform: translateX(0);
            transition: all 0.6s ease-in-out;
        }

        .toggle-left {
            transform: translateX(-200%);
        }

        .container.active .toggle-left {
            transform: translateX(0);
        }

        .toggle-right {
            right: 0;
            transform: translateX(0);
        }

        .container.active .toggle-right {
            transform: translateX(200%);
        }
    </style>
    <title>Login Page</title>
</head>

<body>

    <div class="container" id="container">
        <div class="form-container sign-up">
            <form method="post" action="AuthServlet">
                <h1>Create Account</h1>

                <span>or use your email for registration</span>

                <!-- Username input with Check Availability button -->
                <input type="text" id="username" name="regUserName" placeholder="Username" required>
                <button type="button" id="checkAvailability" onclick="checkUsername()">Check Availability</button>
                <span id="availabilityMessage"></span>
                <input type="email" placeholder="Email" name="regEmail" required>
                <input type="password" placeholder="Password" name="regPassword" required>
                
                <!-- Role selection (example roles) -->
                <label for="roles" style="color: #004c97;">Select Role(s):</label><br> <!-- Changed label color -->
                <div style="display: flex; gap: 20px;">
                    <div>
                        <input type="radio" id="job_seeker" name="regRole" value="job_seeker">
                        <label for="job_seeker">Job Seeker</label>
                    </div>
                    <div>
                        <input type="radio" id="client" name="regRole" value="client">
                        <label for="client">Client</label>
                    </div>
                    <div>
                        <input type="radio" id="hr" name="regRole" value="hr">
                        <label for="hr">HR</label>
                    </div>
                </div>

                <button name="signup" type="submit">Sign Up</button>
            </form>

            <!-- JavaScript to check username availability -->
            <script>
                function checkUsername() {
                    var username = document.getElementById("username").value;
                    var xhr = new XMLHttpRequest();
                    xhr.open("GET", "AuthServlet?username=" + username, true);
                    xhr.onreadystatechange = function() {
                        if (xhr.readyState == 4 && xhr.status == 200) {
                            var response = xhr.responseText.trim();
                            var availabilityMessage = document.getElementById("availabilityMessage");
                            var usernameField = document.getElementById("username");
                            if (response === "available") {
                                availabilityMessage.innerHTML = "Available";
                                availabilityMessage.style.color = "green";
                                usernameField.style.borderColor = "green";
                            } else {
                                availabilityMessage.innerHTML = "Not Available";
                                availabilityMessage.style.color = "red";
                                usernameField.style.borderColor = "red";
                            }
                        }
                    };
                    xhr.send();
                }
            </script>

            <div class="social-icons">
                <a href="#" class="fab fa-facebook-f"></a>
                <a href="#" class="fab fa-twitter"></a>
                <a href="#" class="fab fa-google-plus-g"></a>
            </div>
            <span>Already have an account? <a href="#" class="switch">Sign In</a></span>
        </div>

        <div class="form-container sign-in">
            <form method="POST" action="AuthServlet">
                <h1>Welcome Back!</h1>
                <span>or use your account</span>
                <input type="text" placeholder="Username" name="regUserName" required>
                <input type="password" placeholder="Password" name="regPassword" required>
                <button name="login" type="submit">Login</button>
            </form>
            <div class="social-icons">
                <a href="#" class="fab fa-facebook-f"></a>
                <a href="#" class="fab fa-twitter"></a>
                <a href="#" class="fab fa-google-plus-g"></a>
            </div>
            <span>Don't have an account? <a href="#" class="switch">Sign Up</a></span>
        </div>

        <div class="toggle-container">
            <div class="toggle">
                <div class="toggle-panel toggle-left">
                    <h1>New Here?</h1>
                    <p>Sign up and discover great opportunities!</p>
                    <button class="hidden" onclick="toggleForms()">Sign Up</button>
                </div>
                <div class="toggle-panel toggle-right">
                    <h1>Welcome Back!</h1>
                    <p>To keep connected with us please login with your personal info.</p>
                    <button onclick="toggleForms()">Sign In</button>
                </div>
            </div>
        </div>
    </div>

    <script>
    
        document.querySelectorAll('.switch').forEach(item => {
            item.addEventListener('click', event => {
                document.getElementById('container').classList.toggle('active');
            });
        });

        function toggleForms() {
            document.getElementById('container').classList.toggle('active');
        }
    </script>
</body>

</html>