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

            <h3 style="text-align: center;"><u>Manage Citizens</u><br>
                Total Citizens = <c:out value="${citizencount}"></c:out></h3>
            
            <!-- Search box -->
            <input type="text" id="searchInput" onkeyup="searchByConstituency()" placeholder="Search by Constituency" class="form-control">

            <div class="container mt-4">
                <div class="row row-cols-1 row-cols-md-3 g-4" id="citizenContainer">
                    <c:forEach items="${citizenlist}" var="citizen">
                        <div class="col citizen-card">
                            <div class="card h-100 shadow-sm">
                                <div class="card-body">
                                    <h5 class="card-title"><c:out value="${citizen.firstname}"/> <c:out value="${citizen.lastname}"/></h5>
                                    <p class="card-text">
                                        <strong>Citizen ID:</strong> <c:out value="${citizen.id}" /><br>
                                        <strong>Gender:</strong> <c:out value="${citizen.gender}" /><br>
                                        <strong>DOB:</strong> <c:out value="${citizen.dateofbirth}" /><br>
                                        <strong>Contact:</strong> <c:out value="${citizen.contact}" /><br>
                                        <strong>Aadhar No:</strong> <c:out value="${citizen.aadharnumber}" /><br>
                                        <strong>Constituency:</strong> <c:out value="${citizen.constituency}" /><br>
                                        <strong>Status:</strong> <c:out value="${citizen.status}" />
                                    </p>
                                </div>
                                <div class="card-footer text-center">
                                    <a href="<c:url value='updatestatus?id=${citizen.id}&status=Accepted'/>" class="btn btn-primary btn-sm" data-bs-toggle="tooltip" data-bs-placement="top" title="Accept Citizen">Accept</a>
                                    <a href="<c:url value='updatestatus?id=${citizen.id}&status=Rejected'/>" class="btn btn-danger btn-sm" data-bs-toggle="tooltip" data-bs-placement="top" title="Reject Citizen">Reject</a>
                                    <a href="<c:url value='deletecitizen?id=${citizen.id}'/>" onclick="return confirm('Are you sure you want to delete this citizen?');" class="btn btn-danger btn-sm" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete Citizen">Delete</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap and Custom JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8g4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    
    <!-- Search by Constituency JS -->
    <script>
        function searchByConstituency() {
            const input = document.getElementById('searchInput').value.toUpperCase();
            const cards = document.querySelectorAll('.citizen-card');

            cards.forEach(card => {
                const constituency = card.querySelector('.card-text').textContent.toUpperCase();
                if (constituency.indexOf(input) > -1) {
                    card.style.display = "";
                } else {
                    card.style.display = "none";
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
