<%@ page import="com.klef.jfsd.springboot.sevanet.model.Citizen" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false" %>
<%
Citizen citizen = (Citizen) session.getAttribute("citizen");
if (citizen == null) {
    response.sendRedirect("citizensessionexpiry");
    return;
}
String aadharNumber = citizen.getAadharnumber();
String constituency = citizen.getConstituency();
%>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SevaNet - Report Issue</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
     <link rel="icon" type="image/png" href="fevi.png">
    <style>
    	.form-container {
    background: #fff;
    border: 1px solid #dee2e6;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

.table {
    margin: 0;
    width: 100%;
}

.table td {
    padding: 10px;
    vertical-align: middle;
}

.table input[type="text"],
.table input[type="date"],
.table select,
.table textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ced4da;
    border-radius: 5px;
    background: #f8f9fa;
    font-size: 14px;
    color: #495057;
}

.table input[type="text"]:focus,
.table input[type="date"]:focus,
.table select:focus,
.table textarea:focus {
    border-color: #80bdff;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
    outline: none;
}

.table label {
    font-weight: bold;
    color: #495057;
}

/* Button Styles */
.btn-primary {
    background: linear-gradient(90deg, #007bff, #0056b3);
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    color: #fff;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s ease;
}

.btn-primary:hover {
    background: linear-gradient(90deg, #0056b3, #003e82);
}

/* Responsive Styles */
@media (max-width: 768px) {
    #sidebar {
        width: 100%;
        height: auto;
        position: static;
    }

    .main {
        margin: 0;
    }

    .form-container {
        padding: 15px;
    }
}
    </style>
</head>

<body>
    <div class="wrapper">
        <!-- Sidebar -->
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
                    <a href="citizenhome" class="sidebar-link">
                        <i class="lni lni-home"></i>
                        <span>Home</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="citizenprofile" class="sidebar-link">
                        <i class="lni lni-user"></i>
                        <span>Profile</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="updatecitizen" class="sidebar-link">
                        <i class="lni lni-pencil"></i>
                        <span>Update Profile</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="addissue" class="sidebar-link">
                        <i class="lni lni-bullhorn"></i>
                        <span>Report Issue</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="trackissue" class="sidebar-link">
                        <i class="lni lni-search"></i>
                        <span>Track Issue</span>
                    </a>
                </li>
            </ul>
            <div class="sidebar-footer">
                <a href="citizenlogout" class="sidebar-link">
                    <i class="lni lni-exit"></i>
                    <span>Logout</span>
                </a>
            </div>
        </aside>

        <!-- Main Content Section -->
        <div class="main">
            <h3 class="text-center"><u>Report an Issue</u></h3>

            <div class="form-container mx-auto" style="max-width: 600px;">
                <form action="insertissue" method="post" enctype="multipart/form-data">
                    <table class="table">
                        <tr>
                            <td><label>Title</label></td>
                            <td><input type="text" name="title" required class="form-control" /></td>
                        </tr>
                        <tr>
                            <td><label>Description</label></td>
                            <td><textarea name="description" required class="form-control"></textarea></td>
                        </tr>
                        <tr>
                            <td><label>Issue Type</label></td>
                            <td>
                                <select name="issueType" required class="form-select">
                                    <option value="">---Select---</option>
                                    <option value="Infrastructure">Infrastructure</option>
                                    <option value="Health">Health</option>
                                    <option value="Education">Education</option>
                                    <option value="Police">Police</option>
                                </select>
                            </td>
                        </tr>
                         <tr>
                            <td><label>Location</label></td>
                            <td><input type="text" name="location" required class="form-control" /></td>
                        </tr>
                        
                        <tr>
                            <td><label>Constituency</label></td>
                            <td><input type="text" readonly="readonly" name="constituency" value="<%= constituency %>" /></td>
                        </tr>
                        
                        <tr>
    <td><label>Reported By</label></td>
    <td><input type="text" readonly="readonly" name="reportedBy" value="<%= aadharNumber %>"/></td>
    <!-- <td><%= aadharNumber %></td> --> <!-- Displaying the Aadhar number for reference -->
</tr>
                        
                        <tr>
        <td><label>Urgency Level</label></td>
        <td>
            <select name="urgencyLevel" required="required">
                <option value="">---Select Urgency Level---</option>
                <option value="High">High</option>
                <option value="Medium">Medium</option>
                <option value="Low">Low</option>
            </select>
        </td>
    </tr>
<<<<<<< HEAD
    <tr>
<td><label>Image</label></td>
<td><input type="file" name="issueimage" required="required"/></td>
</tr>


                        
                        <tr>
                            <td><label>Created Date</label></td>
                            <td><input type="date" name="createdDate" placeholder="Enter date of issue" required
                                    class="form-control" /></td>
                        </tr>
=======
                       <tr>
    <td><label>Created Date</label></td>
    <td>
        <input type="date" name="createdDate" required class="form-control" id="createdDate" />
    </td>
</tr>

                        <tr class="text-center">
                            <td colspan="2">
                                <input type="submit" value="Report Issue" class="btn btn-primary" />
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8g4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="script.js"> const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));</script>
    <script>
    document.addEventListener("DOMContentLoaded", function() {
        var today = new Date().toISOString().split('T')[0];  
        document.getElementById("createdDate").setAttribute("min", today);  
    });
</script>
</body>
</html>
        