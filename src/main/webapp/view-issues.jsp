<%@ page import="com.klef.jfsd.springboot.sevanet.model.Admin" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
Admin admin = (Admin) session.getAttribute("admin");
if (admin == null) {
    response.sendRedirect("adminsessionexpiry");
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

    <!-- Custom Card CSS -->
    <style>
        .card {
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease-in-out, transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
        }

        .card-body {
            background-color: #f9f9f9;
            padding: 20px;
            font-size: 14px;
        }

        .card-title {
            font-size: 18px;
            font-weight: bold;
        }

        .card-text {
            color: #555;
            line-height: 1.6;
        }

        .card-footer {
            background-color: #fff;
            border-top: 1px solid #ddd;
            padding: 10px;
        }

        .btn-sm {
            padding: 6px 12px;
            font-size: 14px;
            text-transform: uppercase;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }

        .btn-danger:hover {
            background-color: #c82333;
            border-color: #c82333;
        }

        .container {
            margin-top: 30px;
        }

        /* Search box styling */
        #searchInput {
            margin: 20px auto;
            display: block;
            width: 300px;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            text-align: center;
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
                    <a href="adminhome" class="sidebar-link" data-bs-toggle="tooltip" data-bs-placement="top" title="Go to Home">
                        <i class="lni lni-home"></i>
                        <span>Home</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="addpolitician" class="sidebar-link" data-bs-toggle="tooltip" data-bs-placement="top" title="Add a New Politician">
                        <i class="lni lni-user"></i>
                        <span>Add Politician</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="adddepartment" class="sidebar-link" data-bs-toggle="tooltip" data-bs-placement="top" title="Add a New Department">
                        <i class="lni lni-briefcase"></i>
                        <span>Add Department</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="managepoliticians" class="sidebar-link" data-bs-toggle="tooltip" data-bs-placement="top" title="Manage Politicians">
                        <i class="lni lni-users"></i>
                        <span>Manage Politicians</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="managedepartments" class="sidebar-link" data-bs-toggle="tooltip" data-bs-placement="top" title="Manage Departments">
                        <i class="lni lni-briefcase"></i>
                        <span>Manage Departments</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="managecitizens" class="sidebar-link" data-bs-toggle="tooltip" data-bs-placement="top" title="Manage Citizens">
                        <i class="lni lni-users"></i>
                        <span>Manage Citizens</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="viewissues" class="sidebar-link" data-bs-toggle="tooltip" data-bs-placement="top" title="View Citizen Issues">
                        <i class="lni lni-eye"></i>
                        <span>View Issues</span>
                    </a>
                </li>
                   <li class="sidebar-item">
                    <a href="addparty" class="sidebar-link" title="Add Party" data-bs-toggle="tooltip" data-bs-placement="top">
                        <i class="lni lni-network"></i>
                        <span>Add Party</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="addconstituency" class="sidebar-link" title="Add Constituency" data-bs-toggle="tooltip" data-bs-placement="top">
                        <i class="lni lni-map"></i>
                        <span>Add Constituency</span>
                    </a>
                </li>
            </ul>
            <div class="sidebar-footer">
                <a href="adminlogout" class="sidebar-link" data-bs-toggle="tooltip" data-bs-placement="top" title="Logout">
                    <i class="lni lni-exit"></i>
                    <span>Logout</span>
                </a>
            </div>
        </aside>
        <!-- Main Content Section -->
        <div class="main">
            <div class="username">
                <p align="right">Logged in as: <strong><%= admin.getUsername() %></strong></p>
            </div>

            <h3 style="text-align: center;"><u>View Issues</u></h3>
            
            <!-- Sort by Status Form -->
            <form action="viewissues" method="get" style="text-align: center; margin: 20px;">
                <label for="status">Sort by Status:</label>
                <select name="status" id="status" onchange="this.form.submit()">
                    <option value="">---Select---</option>
                    <option value="ViewAll">View All</option>
                    <option value="Reported">Reported</option>
                    <option value="In Progress">In Progress</option>
                    <option value="Resolved">Resolved</option>
                </select>
            </form>

            <!-- Search Box for Issues -->
            <input type="text" id="searchInput" onkeyup="searchIssues()" placeholder="Search Issues..." class="form-control">

            <!-- Issue Cards -->
            <div class="container mt-4">
                <div class="row row-cols-1 row-cols-md-3 g-4" id="issueContainer">
                    <c:forEach items="${issues}" var="issue">
                        <div class="col issue-card">
                            <div class="card h-100 shadow-sm">
                                <div class="card-body">
                                    <h5 class="card-title"><c:out value="${issue.title}" /></h5>
                                    <p class="card-text">
                                        <strong>Issue ID:</strong> <c:out value="${issue.id}" /><br>
                                        <strong>Description:</strong> <c:out value="${issue.description}" /><br>
                                        <strong>Type:</strong> <c:out value="${issue.issueType}" /><br>
                                        <strong>Status:</strong> <c:out value="${issue.status}" /><br>
                                        <strong>Priority:</strong> <c:out value="${issue.priority}" /><br>
                                        <strong>Location:</strong> <c:out value="${issue.location}" /><br>
                                        <strong>Constituency:</strong> <c:out value="${issue.constituency}" /><br>
                                        <strong>Reported By:</strong> <c:out value="${issue.reportedBy}" /><br>
                                        <strong>Assigned To:</strong> <c:out value="${issue.assignedTo}" /><br>
                                        <strong>Created Date:</strong> <c:out value="${issue.createdDate}" /><br>
                                        <strong>Updated Date:</strong> <c:out value="${issue.updatedDate}" /><br>
                                        <strong>Urgency Level:</strong> <c:out value="${issue.urgencyLevel}" />
                                    </p>
                                </div>
                             <div class="card-actions">
                           
                            <a href='<c:url value="deleteissue?id=${issue.id}" />' onclick="return confirm('Are you sure you want to delete this Issue?');" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete this Issue">
                                <i class="lni lni-trash-can"></i> Delete
                            </a>
                        </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8g4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

    <!-- Custom JS for Search Functionality -->
    <script>
        function searchIssues() {
            var input = document.getElementById('searchInput').value.toUpperCase();
            var issueCards = document.querySelectorAll('.issue-card');

            issueCards.forEach(function(card) {
                var title = card.querySelector('.card-title').textContent.toUpperCase();
                var description = card.querySelector('.card-text').textContent.toUpperCase();
                var constituency = card.querySelector('.card-text').textContent.toUpperCase();

                if (title.includes(input) || description.includes(input) || constituency.includes(input)) {
                    card.style.display = '';
                } else {
                    card.style.display = 'none';
                }
            });
        }
    </script>

    <!-- Tooltips Initialization -->
    <script src="script.js">
        const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
        tooltipTriggerList.forEach(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
    </script>
</body>
</html>
