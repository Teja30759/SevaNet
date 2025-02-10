<%@page import="com.klef.jfsd.springboot.sevanet.model.Citizen"%>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
Citizen citizen = (Citizen)session.getAttribute("citizen");

// After logout, session expired
if (citizen == null) {
    response.sendRedirect("citizensessionexpiry");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SevaNet - Citizen Home</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css"><link rel="icon" type="image/png" href="fevi.png">
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
                <li class="sidebar-item">
                    <a href="citizenhome" class="sidebar-link">
                        <i class="lni lni-home"></i>
                        <span>Home</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="addissue" class="sidebar-link">
                        <i class="lni lni-eye"></i>
                        <span>Report Issue</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="trackissue" class="sidebar-link">
                        <i class="lni lni-comments"></i>
                        <span>Track Issue</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="citizenprofile" class="sidebar-link">
                        <i class="lni lni-bullhorn"></i> <!-- Updated icon -->
                        <span>Profile</span>
                    </a>
                </li>
                
                
            <div class="sidebar-footer">
                <a href="citizenlogout" class="sidebar-link">
                    <i class="lni lni-exit"></i>
                    <span>Logout</span>
                </a>
            </div>
        </aside>

        <!-- Main Content Section -->
        <div class="main">
            <div class="username">
                Logged in as: <strong><%= citizen.getFirstname() %></strong>
            </div>
            <h2>Welcome, <%= citizen.getFirstname() %></h2>
            <p>Welcome to your Citizen Dashboard. From here, you can report issues, track issue status, and manage your profile.</p>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8g4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="script.js"></script>
</body>
</html>
