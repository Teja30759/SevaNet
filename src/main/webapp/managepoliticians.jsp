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
    <title>Manage Politicians</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css"><link rel="icon" type="image/png" href="fevi.png">
    <style>
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }
        .politician-card {
            width: 300px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            background-color: #fff;
            transition: box-shadow 0.3s ease;
        }
        .politician-card:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
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
        .card-actions {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            border-top: 1px solid #ddd;
            background-color: #f9f9f9;
        }
        .card-actions a {
            color: #3a7bd5;
            text-decoration: none;
            font-size: 16px;
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
            cards = cardContainer.getElementsByClassName("politician-card");

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
                <u>Manage Politicians</u><br>
                Total Politicians = <c:out value="${polcount}" />
            </h3>

            <!-- Search input -->
            <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names..." class="form-control">

            <!-- Politician Cards -->
            <div id="cardContainer" class="card-container">
                <c:forEach items="${politicianslist}" var="politician">
                    <div class="politician-card" data-bs-toggle="tooltip" data-bs-placement="top" title="Click to view details of <c:out value="${politician.name}" />">
                        <div class="card-body">
                            <h5 class="card-title"><c:out value="${politician.name}" /></h5>
                            <p class="card-text">Party: <c:out value="${politician.party}" /></p>
                            <p class="card-text">Constituency: <c:out value="${politician.constituency}" /></p>
                            <p class="card-text">Position: <c:out value="${politician.position}" /></p>
                            <p class="card-text">Contact: <c:out value="${politician.contactInfo}" /></p>
                        </div>
                        <div class="card-actions">
                            <a href='<c:url value="updatepolitician?id=${politician.id}" />' data-bs-toggle="tooltip" data-bs-placement="top" title="Edit this politician">
                                <i class="lni lni-pencil-alt"></i> Update
                            </a>
                            <a href='<c:url value="deletepolitician?id=${politician.id}" />' onclick="return confirm('Are you sure you want to delete this politician?');" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete this politician">
                                <i class="lni lni-trash-can"></i> Delete
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="script.js">
        const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
        const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
    </script>
</body>

</html>
