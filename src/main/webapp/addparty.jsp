<%@ page import="com.klef.jfsd.springboot.sevanet.model.Admin" %>
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SevaNet</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css"> <link rel="icon" type="image/png" href="fevi.png">
    <style>
    .form-container {
            width: 50%;
            margin: auto;
            padding: 20px;
            border: 1px solid #ddd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
        }

        h3 {
            text-align: center;
            color: #333;
        }

        .message {
            color: red;
            text-align: center;
        }

        table {
            width: 100%;
            margin: 0 auto;
        }

        td {
            padding: 10px;
        }

        .button-container {
            text-align: center;
        }

        input[type="submit"], input[type="reset"] {
            padding: 10px 20px;
            font-size: 14px;
            margin: 10px;
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
                <!-- Sidebar Links with Tooltips -->
                <li class="sidebar-item">
                    <a href="adminhome" class="sidebar-link" title="Home" data-bs-toggle="tooltip" data-bs-placement="top">
                        <i class="lni lni-home"></i>
                        <span>Home</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="addpolitician" class="sidebar-link" title="Add Politician" data-bs-toggle="tooltip" data-bs-placement="top">
                        <i class="lni lni-user"></i>
                        <span>Add Politician</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="adddepartment" class="sidebar-link" title="Add Department" data-bs-toggle="tooltip" data-bs-placement="top">
                        <i class="lni lni-briefcase"></i>
                        <span>Add Department</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="managepoliticians" class="sidebar-link" title="Manage Politicians" data-bs-toggle="tooltip" data-bs-placement="top">
                        <i class="lni lni-users"></i>
                        <span>Manage Politicians</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="managedepartments" class="sidebar-link" title="Manage Departments" data-bs-toggle="tooltip" data-bs-placement="top">
                        <i class="lni lni-briefcase"></i>
                        <span>Manage Departments</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="managecitizens" class="sidebar-link" title="Manage Citizens" data-bs-toggle="tooltip" data-bs-placement="top">
                        <i class="lni lni-users"></i>
                        <span>Manage Citizens</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="viewissues" class="sidebar-link" title="View Issues" data-bs-toggle="tooltip" data-bs-placement="top">
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
                <a href="adminlogout" class="sidebar-link" title="Logout" data-bs-toggle="tooltip" data-bs-placement="top">
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
             <h3 style="text-align: center;"><u>Add Party</u></h3>
            <h4 align="center" style="color: red;">${message}</h4>
            <div class="form-container">
                     <form  action="insertparty">
                    <table>

                        <tr>
                            <td><label for="constname" data-bs-toggle="tooltip" data-bs-placement="top" title="Provide Party Name">Enter Party Name</label></td>
                            <td><input type="text" id="constname" name="constname" rows="3" class="form-control" required data-bs-toggle="tooltip" data-bs-placement="top" required title="Provide Party Name"></td>
                        </tr>
                
                        <tr>
                            <td colspan="2" class="button-container">
                                <input type="submit" value="Add" />
                                <input type="reset" value="Clear" />
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
           
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

    <script src="script.js"> const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));</script>
</body>

</html>
