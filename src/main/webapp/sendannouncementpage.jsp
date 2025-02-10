<%@ page import="com.klef.jfsd.springboot.sevanet.model.Politician" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
Politician politician = (Politician) session.getAttribute("politician");
if (politician == null) {
    response.sendRedirect("politiciansessionexpiry");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SevaNet</title>
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
                    <a href="politicianhome" class="sidebar-link">
                        <i class="lni lni-home"></i>
                        <span>Home</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="viewissuespage" class="sidebar-link">
                        <i class="lni lni-eye"></i>
                        <span>Current Issues</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="respondtoissuespage" class="sidebar-link">
                        <i class="lni lni-comments"></i>
                        <span>Respond to Issues</span>
                    </a>
                </li>
                <li class="sidebar-item active">
                    <a href="sendannouncementspage" class="sidebar-link">
                        <i class="lni lni-bullhorn"></i>
                        <span>Send Announcements</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="ViewDepartments" class="sidebar-link">
                        <i class="lni lni-briefcase"></i>
                        <span>Assigned Departments</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="profilepage" class="sidebar-link">
                        <i class="lni lni-user"></i>
                        <span>Profile</span>
                    </a>
                </li>
            </ul>
            <div class="sidebar-footer">
                <a href="politicianlogout" class="sidebar-link">
                    <i class="lni lni-exit"></i>
                    <span>Logout</span>
                </a>
            </div>
        </aside>

        <!-- Main Content Section -->
        <div class="main">
            <div class="username">
                <p align="right">Logged in as: <strong><%= politician.getName() %></strong></p>
            </div>

            <!-- Announcements Form -->
    <!-- Announcements Form -->
<div class="container mt-4">
    <h3 class="mb-4">Send Announcements</h3>
    <form action="sendannouncements" method="post">
        <div class="mb-3">
            <label for="subject" class="form-label">Subject</label>
            <input type="text" class="form-control" id="subject" name="subject" placeholder="Enter subject" required>
        </div>
        <div class="mb-3">
            <label for="message" class="form-label">Message</label>
            <textarea class="form-control" id="message" name="message" rows="6" placeholder="Enter your message here" required></textarea>
        </div>
        <!-- Hidden Template -->
        <input type="hidden" id="template" name="template" value="Dear Citizens,\n\n[Your Message Here]\n\nThank you for your support.\n\nSincerely,\n<%= politician.getName() %>">
        <button type="submit" class="btn btn-primary">Send Announcement</button>
    </form>
</div>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8g4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="script.js"></script>
</body>
</html>
