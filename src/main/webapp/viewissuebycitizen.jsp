<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@page import="com.klef.jfsd.springboot.sevanet.model.Citizen" %>

<%
    Citizen citizen = (Citizen) session.getAttribute("citizen");
    if (citizen == null) {
        response.sendRedirect("citizensessionexpiry");
        return;
    }
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>SevaNet</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <style>
    .card-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
    padding: 20px;
    margin: 0 auto;
}

.card {
    background: linear-gradient(145deg, #ffffff, #f1f3f5);
    border-radius: 15px;
    box-shadow: 4px 4px 8px #d1d9e6, -4px -4px 8px #ffffff;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    overflow: hidden;
}

.card:hover {
    transform: translateY(-10px);
    box-shadow: 6px 6px 12px rgba(0, 0, 0, 0.2);
}

.card-header {
    background: linear-gradient(145deg, #003366, #004080);
    color: white;
    padding: 15px;
    text-align: center;
    font-size: 1.4rem;
    font-weight: bold;
    border-bottom: 2px solid rgba(255, 255, 255, 0.3);
}

.card-body {
    padding: 20px;
    color: #333;
    font-family: 'Arial', sans-serif;
    line-height: 1.6;
}

.card-body .issue-info {
    font-size: 1rem;
    font-weight: bold;
    margin-bottom: 8px;
}

.card-body .issue-details {
    display: inline-block;
    font-weight: 400;
    margin-left: 10px;
    color: #555;
}

.card-footer {
    background: linear-gradient(145deg, #e7e7e7, #f1f1f1);
    text-align: center;
    padding: 10px;
    font-size: 0.9rem;
    border-top: 2px solid rgba(0, 0, 0, 0.1);
}

.card-footer a {
    color: #003366;
    font-weight: bold;
    text-decoration: none;
    transition: color 0.3s ease;
}

.card-footer a:hover {
    color: #007bff;
}

/* Responsive Styling */
@media (max-width: 768px) {
    .card-container {
        grid-template-columns: 1fr;
    }
}

</style>


    <script>
        function myFunction() {
            var input, filter, cards, card, issueType, i;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            cards = document.getElementsByClassName("card");

            for (i = 0; i < cards.length; i++) {
                card = cards[i];
                issueType = card.getElementsByClassName("issue-type")[0].textContent || card.getElementsByClassName("issue-type")[0].innerText;
                if (issueType.toUpperCase().indexOf(filter) > -1) {
                    card.style.display = "";
                } else {
                    card.style.display = "none";
                }
            }
        }
    </script>
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
                <li class="sidebar-item"><a href="citizenhome" class="sidebar-link"><i class="lni lni-home"></i><span>Home</span></a></li>
                <li class="sidebar-item"><a href="citizenprofile" class="sidebar-link"><i class="lni lni-user"></i><span>Profile</span></a></li>
                <li class="sidebar-item"><a href="updatecitizen" class="sidebar-link"><i class="lni lni-pencil"></i><span>Update Profile</span></a></li>
                <li class="sidebar-item"><a href="addissue" class="sidebar-link"><i class="lni lni-bullhorn"></i><span>Report Issue</span></a></li>
                <li class="sidebar-item"><a href="trackissue" class="sidebar-link"><i class="lni lni-search"></i><span>Track Issue</span></a></li>
            </ul>
            <div class="sidebar-footer">
                <a href="citizenlogout" class="sidebar-link"><i class="lni lni-exit"></i><span>Logout</span></a>
            </div>
        </aside>

        <!-- Main Content Section -->
        <div class="main">
            <div class="welcome-container">
                <h1 align="center">Your Reported Issues</h1>
                <!-- Search Input Field -->
                <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search by Issue Type">
            </div>

            <!-- Card Layout for Displaying Issues -->
            <div class="card-container">
                <c:forEach var="issue" items="${issues}">
                    <div class="card">
                        <div class="card-header">
                            <span>Issue ID: ${issue.id}</span>
                        </div>
                        <div class="card-body">
                            <div class="issue-info">Title: <span class="issue-details">${issue.title}</span></div>
                            <div class="issue-info">Description: <span class="issue-details">${issue.description}</span></div>
                            <div class="issue-info">Issue Type: <span class="issue-details issue-type">${issue.issueType}</span></div> <!-- Added the class issue-type -->
                            <div class="issue-info">Location: <span class="issue-details">${issue.location}</span></div>
                            <div class="issue-info">Reported By: <span class="issue-details">${issue.reportedBy}</span></div>
                            <div class="issue-info">Constituency: <span class="issue-details">${issue.constituency}</span></div>
                            <div class="issue-info">Created Date: <span class="issue-details">${issue.createdDate}</span></div>
                            <div class="issue-info">Urgency Level: <span class="issue-details">${issue.urgencyLevel}</span></div>
                            <div class="issue-info">Status: <span class="issue-details">${issue.status}</span></div>
                        </div>
                        <div class="card-footer">
                            <!-- Empty or additional footer content can go here -->
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="script.js"></script>
</body>
</html>
