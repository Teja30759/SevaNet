<%@page import="com.klef.jfsd.springboot.sevanet.model.Citizen"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Citizen citizen = (Citizen) session.getAttribute("citizen");
    // After logout, session expired
    if (citizen == null) {
        response.sendRedirect("citizensessionexpiry");
        return;
    }

    // Get current time
    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
    String currentTime = sdf.format(Calendar.getInstance().getTime());
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SevaNet - Citizen Home</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <link rel="icon" type="image/png" href="fevi.png">

    <!-- Add custom CSS -->
    <style>
        /* Main Content Styling */
        .username {
            font-size: 16px;
            color: #555;
        }

        .main h2 {
            color: #333;
            font-size: 28px;
            margin-bottom: 15px;
        }

        .current-time {
            font-size: 18px;
            margin-top: 20px;
            padding: 10px;
            background-color: #f1f1f1;
            border-radius: 5px;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Live Calendar Styling */
        .live-calendar {
            margin-bottom: 30px;
            padding: 15px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .blogs {
            padding: 20px;
        }

        .blog-post {
            margin-bottom: 25px;
        }

        .blog-card {
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 15px;
        }

        .blog-post h5 {
            font-size: 22px;
            color: #333;
        }

        .blog-post p {
            font-size: 16px;
            color: #555;
            margin: 10px 0;
        }

        .blog-post a {
            font-size: 16px;
            color: #007bff;
            text-decoration: none;
        }

        .blog-post a:hover {
            text-decoration: underline;
        }
    </style>

</head>
<body>
    <div class="wrapper">
        <!-- Sidebar Section -->
        <aside id="sidebar">
            <div class="d-flex">
                <button class="toggle-btn" type="button">
                    <i class="lni lni-grid-alt"></i>
                </button>
                <div class="sidebar-logo">
                    <a href="">SevaNet</a>
                </div>
            </div>
            <ul class="sidebar-nav">
                <!-- Sidebar Links -->
                <li class="sidebar-item">
                    <a href="citizenhome" class="sidebar-link">
                        <i class="lni lni-home"></i>
                        <span>Home</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="citizenprofile" class="sidebar-link">
                        <i class="lni lni-user"></i>
                        <span>Profile</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="updatecitizen" class="sidebar-link">
                        <i class="lni lni-pencil"></i>
                        <span>Update Profile</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="addissue" class="sidebar-link">
                        <i class="lni lni-bullhorn"></i>
                        <span>Report Issue</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="trackissue" class="sidebar-link">
                        <i class="lni lni-search"></i>
                        <span>Track Issue</span>
                    </a>
                </li>
            </ul>
            <div class="sidebar-footer">
                <a href="citizenlogout" class="sidebar-link">
                    <i class="lni lni-exit"></i>
                    <span>Logout</span>
                </a>
            </div>
        </aside>

        <!-- Main Content Section -->
        <div class="main">
            <div class="username" align="right">
                Logged in as: <strong><%= citizen.getFirstname() %></strong>
            </div>
            <h2>Welcome, <%= citizen.getFirstname() %></h2>
          
            
            <!-- Current Time Section -->
            <div class="current-time">
                <h4>Current Time: <%= currentTime %></h4>
            </div>

            <!-- Live Calendar Section -->
            <div class="live-calendar" align="center">
                <h4>Live Calendar</h4>
                <iframe src="https://calendar.google.com/calendar/embed?src=your-calendar-id%40group.calendar.google.com&ctz=Asia%2FKolkata" style="border: 0" width="800" height="600" frameborder="0" scrolling="no"></iframe>
            </div>

            <!-- Dynamic Blog Section -->
            <h4 align="center">Latest Updates</h4>
            <div class="blogs">
                <div class="blog-card card">
                    <div class="card-body blog-post">
                        <h5 class="card-title">Resolved Issues and Solutions</h5>
                        <p class="card-text">Recent issues reported by citizens have been resolved effectively by the respective departments. Read about the solutions and how they have made a difference.</p>
                        <a href="https://rural.nic.in" target="_blank" class="card-link">Read More</a>
                    </div>
                </div>
                <div class="blog-card card">
                    <div class="card-body blog-post">
                        <h5 class="card-title">Current Affairs in India</h5>
                        <p class="card-text">Stay updated with the latest political developments and current affairs in India. Learn about the new policies, government initiatives, and societal changes.</p>
                        <a href="https://www.digitalindia.gov.in" target="_blank" class="card-link">Read More</a>
                    </div>
                </div>
                <div class="blog-card card">
                    <div class="card-body blog-post">
                        <h5 class="card-title">Indian Politics and Governance</h5>
                        <p class="card-text">Explore in-depth articles about the structure of Indian politics, the role of elected representatives, and key governance issues.</p>
                        <a href="https://www.mha.gov.in" target="_blank" class="card-link">Read More</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8g4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="script.js"></script>
</body>
</html>
