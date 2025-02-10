<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="com.klef.jfsd.springboot.sevanet.model.Politician" %>

<%
Politician poli = (Politician) session.getAttribute("politician");

if (poli == null) {
    response.sendRedirect("politiciansessionexpage");
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

    <style>
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            gap: 20px;
            margin-top: 20px;
        }

        .card {
            width: 100%;
            max-width: 300px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #0e2238;
            color: white;
            padding: 15px;
            border-bottom: 1px solid #ccc;
            text-align: center;
        }

        .card-body {
            padding: 15px;
            background-color: #f9f9f9;
            color: #333;
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
                <p align="right">Logged in as: <strong><%= poli.getName() %></strong></p>
            </div>

            <center>
                <h3>Departments Assigned</h3>
                <div class="card-container">
                    <c:forEach items="${deplist}" var="dep">
                        <div class="card">
                            <div class="card-header">
                                <c:out value="${dep.name}" />
                            </div>
                            <div class="card-body">
                                <p><strong>Constituency:</strong> <c:out value="${dep.constituency}" /></p>
                                <p><strong>Contact Email:</strong> <c:out value="${dep.contactEmail}" /></p>
                                <p><strong>Description:</strong> <c:out value="${dep.description}" /></p>
                            </div>
                             <div class="card-footer text-center">
                               <a href="mailto:<c:out value='${dep.contactEmail}' />" class="btn btn-primary">
            <i class="lni lni-envelope"></i> Send Message
        </a>
    </div>
                        </div>
                    </c:forEach>
                </div>
            </center>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8g4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="script.js"></script>
</body>

</html>
