<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="com.klef.jfsd.springboot.sevanet.model.Department" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
Department dep = (Department) session.getAttribute("department");

if (dep == null) {
    response.sendRedirect("politiciansessionexpage");
    return;
}

// Get current date and time
SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
String currentDateTime = sdf.format(new Date());
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SevaNet</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" 
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css"> <!-- Custom CSS for styles --><link rel="icon" type="image/png" href="fevi.png">
</head>
<body class="loaded"> <!-- Added fade-in effect on load -->

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
                    <a href="departmenthome" class="sidebar-link">
                        <i class="lni lni-home"></i>
                        <span>Home</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="assignedissuespage" class="sidebar-link">
                        <i class="lni lni-list"></i>
                        <span>Assigned Issues</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="departprofilepage" class="sidebar-link">
                        <i class="lni lni-user"></i>
                        <span>Profile</span>
                    </a>
                </li>
            </ul>
            <div class="sidebar-footer">
                <a href="departmentlogout" class="sidebar-link">
                    <i class="lni lni-exit"></i>
                    <span>Logout</span>
                </a>
            </div>
        </aside>

        <!-- Main Content Section -->
        <div class="main">
            <div class="username">
                <p align="right">Department: <strong><%= dep.getName() %></strong> | Constituency: <strong><%= dep.getConstituency() %></strong></p>
            </div>
          
            <!-- Profile Card Section -->
            <div class="container profile-card mt-4">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card">
                            <div class="card-header text-center">
                                <strong>Department Profile</strong>
                            </div>
                            <div class="card-body">
                                <!-- Using Bootstrap grid system to align the fields -->
                                <div class="row mb-3">
                                    <label for="departmentId" class="col-sm-4 col-form-label"><strong>Department ID:</strong></label>
                                    <div class="col-sm-8">
                                        <p id="departmentId"><%= dep.getDepartmentid() %></p>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="departmentName" class="col-sm-4 col-form-label"><strong>Department Name:</strong></label>
                                    <div class="col-sm-8">
                                        <p id="departmentName"><%= dep.getName() %></p>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="departmentConstituency" class="col-sm-4 col-form-label"><strong>Department Constituency:</strong></label>
                                    <div class="col-sm-8">
                                        <p id="departmentConstituency"><%= dep.getConstituency() %></p>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="departmentEmail" class="col-sm-4 col-form-label"><strong>Department Email:</strong></label>
                                    <div class="col-sm-8">
                                        <p id="departmentEmail"><%= dep.getContactEmail() %></p>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="departmentDescription" class="col-sm-4 col-form-label"><strong>Department Description:</strong></label>
                                    <div class="col-sm-8">
                                        <p id="departmentDescription"><%= dep.getDescription() %></p>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <label for="currentDateTime" class="col-sm-4 col-form-label"><strong>Current Date and Time:</strong></label>
                                    <div class="col-sm-8">
                                        <p id="currentDateTime"><%= currentDateTime %></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          
        </div>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" 
            crossorigin="anonymous"></script>

    <!-- Custom Script -->
    <script src="script.js"></script> <!-- Optional custom JavaScript for interactivity -->

</body>
</html>
