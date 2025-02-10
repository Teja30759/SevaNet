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
    <style>
        /* Custom styles for the cards */
        .card-body {
            padding: 20px;
        }
        .card-title {
            font-size: 18px;
            font-weight: bold;
            color: #3a7bd5;
        }
        .card-text {
            font-size: 14px;
            color: #333;
            margin: 5px 0;
        }
        .card-footer {
            padding: 10px;
            background-color: #f9f9f9;
        }
        .card-actions a {
            color: #3a7bd5;
            text-decoration: none;
        }
        .card-actions a:hover {
            color: #1e5aa6;
        }
        /* Search input styling */
        #myInput {
            width: 50%;
            font-size: 16px;
            padding: 10px;
            margin: 20px auto;
            display: block;
            border: 1px solid #ddd;
        }
    </style>
    <script>
        function myFunction() {
            var input, filter, cards, cardContainer, cardBody, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            cardContainer = document.getElementById("cardContainer");
            cards = cardContainer.getElementsByClassName("department-card");

            for (i = 0; i < cards.length; i++) {
                cardBody = cards[i].getElementsByClassName("card-body")[0];
                txtValue = cardBody.textContent || cardBody.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    cards[i].style.display = "";
                } else {
                    cards[i].style.display = "none";
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

            <h3 style="text-align: center;">
                <u>Manage Departments</u><br> 
                Total Departments = <c:out value="${deptcount}" />
            </h3>

            <!-- Search input -->
            <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for departments..." class="form-control">

            <!-- Department Cards -->
            <div id="cardContainer" class="container mt-4">
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <c:forEach items="${departmentslist}" var="department">
                        <div class="col department-card">
                            <div class="card h-100 shadow-sm" data-bs-toggle="tooltip" data-bs-placement="top"
                                 title="Click to view more details about <c:out value="${department.name}" />">
                                <div class="card-body">
                                    <h5 class="card-title"><c:out value="${department.name}" /></h5>
                                    <p class="card-text">
                                        <strong>Department ID:</strong> <c:out value="${department.departmentid}" /><br>
                                        <strong>Constituency:</strong> <c:out value="${department.constituency}" /><br>
                                        <strong>Description:</strong> <c:out value="${department.description}" /><br>
                                        <strong>Contact Email:</strong> <c:out value="${department.contactEmail}" />
                                    </p>
                                </div>
                                <div class="card-footer d-flex justify-content-between">
                                    <a href='<c:url value="updatedepartment?id=${department.departmentid}" />' class="btn btn-primary btn-sm" data-bs-toggle="tooltip" data-bs-placement="top" title="Update this department">
                                        Update
                                    </a>
                                    <a href='<c:url value="deletedepartment?id=${department.departmentid}" />' class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this department?');" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete this department">
                                        Delete
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
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="script.js">
        // Initialize Bootstrap tooltips
        const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
        const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
    </script>
</body>

</html>
