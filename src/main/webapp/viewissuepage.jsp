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

    <!-- Improved Card CSS -->
    <style>
       /* Issue Card Styles */
.card.issue-card {
    border: 1px solid #e0e0e0; /* Lighter border for a softer look */
    border-radius: 15px; /* More rounded corners */
    background-color: #ffffff;
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1); /* Enhanced shadow for depth */
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
    margin-bottom: 20px;
    overflow: hidden; /* Prevent content overflow */
}

.card.issue-card:hover {
    transform: translateY(-8px); /* Slightly more movement on hover */
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2); /* Stronger shadow on hover */
}

.card-body {
    padding: 25px; /* Increased padding for more space */
    position: relative;
}

.card-title {
    font-size: 1.5rem; /* Larger title */
    font-weight: 600; /* Slightly lighter than bold */
    color: #333; /* Dark text for better readability */
    margin-bottom: 12px;
    text-transform: uppercase; /* Uppercase title for a bold impression */
    letter-spacing: 1px;
}

.card-text {
    font-size: 1rem;
    color: #555; /* Softer text color */
    line-height: 1.7; /* Increased line-height for better readability */
    margin-bottom: 15px;
}

.card-footer {
    background-color: #f1f3f5;
    padding: 18px;
    text-align: center;
    border-top: 2px solid #ddd;
    border-radius: 0 0 15px 15px;
    position: relative;
}

.card-footer .btn {
    margin: 8px;
    border-radius: 50px; /* Rounded button edges */
    padding: 10px 20px;
    font-size: 0.9rem;
    transition: all 0.3s ease;
}

.card-footer .btn-primary {
    background-color: #007bff;
    border: none;
    color: white;
}

.card-footer .btn-danger {
    background-color: #dc3545;
    border: none;
    color: white;
}

.card-footer .btn-primary:hover {
    background-color: #0056b3;
    transform: scale(1.05); /* Slight button scaling on hover */
}

.card-footer .btn-danger:hover {
    background-color: #c82333;
    transform: scale(1.05);
}

/* Optional Badge Style for Urgency Level (if included) */
.urgency-badge {
    position: absolute;
    top: 10px;
    right: 10px;
    padding: 6px 12px;
    background-color: #ffcc00;
    color: white;
    font-size: 0.9rem;
    border-radius: 25px;
    font-weight: bold;
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
                <li class="sidebar-item">
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
                <p align="right">Logged in as: <strong><%= politician.getName() %></strong></p> <!-- Ensure getName() is correct -->
            </div>

            <h3 class="text-center">View All Issues</h3>

            <div class="container mt-4">
                <div class="mb-3">
                    <!-- Search Input -->
                    <input type="text" id="myInput" onkeyup="myFunction()" class="form-control" placeholder="Search by Issue Type">
                </div>

                <!-- Issue Cards Layout -->
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <c:forEach items="${issuelist}" var="iss">
                        <div class="col">
                            <div class="card issue-card">
                                <div class="card-body">
                                    <h5 class="card-title"><c:out value="${iss.title}"/></h5>
                                    <p class="card-text">
                                        <strong>Description:</strong> <c:out value="${iss.description}"/><br>
                                        <strong>Location:</strong> <c:out value="${iss.location}"/><br>
                                        <strong>Reported By:</strong> <c:out value="${iss.reportedBy}"/><br>
                                        <strong>Constituency:</strong> <c:out value="${iss.constituency}"/><br>
                                        <strong>Created Date:</strong> <c:out value="${iss.createdDate}"/><br>
                                        <strong>Urgency Level:</strong> <c:out value="${iss.urgencyLevel}"/><br>
                                        <strong>Status:</strong> <c:out value="${iss.status}"/><br>
                                    </p>
                                    <!-- Hidden Issue Type for filtering -->
                                    <p class="issue-type" style="display: none;"><c:out value="${iss.issueType}"/></p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <script>
        function myFunction() {
            var input, filter, cards, card, issueType, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            cards = document.getElementsByClassName("issue-card");

            for (i = 0; i < cards.length; i++) {
                card = cards[i];
                issueType = card.getElementsByClassName("issue-type")[0];
                if (issueType) {
                    txtValue = issueType.textContent || issueType.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        card.style.display = "";
                    } else {
                        card.style.display = "none";
                    }
                }
            }
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8g4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="script.js"></script>
</body>
</html>
