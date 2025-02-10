<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.klef.jfsd.springboot.sevanet.model.Admin" %>
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
            padding: 8px;
        }

        .form-control {
            width: 80%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        .button-container {
            text-align: center;
        }

        input[type="submit"], input[type="reset"] {
            padding: 8px 16px;
            font-size: 14px;
            margin: 10px;
            cursor: pointer;
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
                    <a href="adminhome" class="sidebar-link" data-bs-toggle="tooltip" data-bs-placement="top" title="Home">
                        <i class="lni lni-home"></i>
                        <span>Home</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="addpolitician" class="sidebar-link" data-bs-toggle="tooltip" data-bs-placement="top" title="Add Politician">
                        <i class="lni lni-user"></i>
                        <span>Add Politician</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="adddepartment" class="sidebar-link" data-bs-toggle="tooltip" data-bs-placement="top" title="Add Department">
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
                    <a href="viewissues" class="sidebar-link" data-bs-toggle="tooltip" data-bs-placement="top" title="View Issues">
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
        <div class="main p-3">
            <div class="username">
                <p align="right">Logged in as: <strong><%= admin.getUsername() %></strong></p>
            </div>
            <h3 style="text-align: center;"><u>Add Politician</u></h3>
            <h4 align="center" style="color: red;">${message}</h4>
            <div class="form-container">
                <form method="post" action="insertpolitician">
                    <table>
                        <tr>
                            <td><label for="pname" data-bs-toggle="tooltip" data-bs-placement="top" title="Enter the politician's full name">Enter Name</label></td>
                            <td><input type="text" id="pname" name="pname" class="form-control" required data-bs-toggle="tooltip" data-bs-placement="top" title="Enter the politician's full name" /></td>
                        </tr>
                        <tr>
                            <td><label for="pparty" data-bs-toggle="tooltip" data-bs-placement="top" title="Select the politician's party">Select Party</label></td>
                            <td>
                                <select id="pparty" name="pparty" class="form-control" required data-bs-toggle="tooltip" data-bs-placement="top" title="Select the politician's party">
                                    <option value="" disabled selected>-------------Select Party-------------</option>
                                    <c:forEach var="party" items="${partyData}">
                                        <option value="${party.name}">${party.name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="pconstituency" data-bs-toggle="tooltip" data-bs-placement="top" title="Select the politician's constituency">Select Constituency</label></td>
                            <td>
                                <select id="pconstituency" name="pconstituency" class="form-control" required data-bs-toggle="tooltip" data-bs-placement="top" title="Select the politician's constituency">
                                    <option value="" disabled selected>----------Select Constituency----------</option>
                                    <c:forEach var="constituency" items="${constituencyData}">
                                        <option value="${constituency.name}">${constituency.name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="pposition" data-bs-toggle="tooltip" data-bs-placement="top" title="Enter the politician's position">Enter Position</label></td>
                            <td><input type="text" id="pposition" name="pposition" class="form-control" required data-bs-toggle="tooltip" data-bs-placement="top" title="Enter the politician's position" /></td>
                        </tr>
                        <tr>
                            <td><label for="pcontact_info" data-bs-toggle="tooltip" data-bs-placement="top" title="Enter the politician's contact details">Enter Contact Information</label></td>
                            <td><input type="text" id="pcontact_info" name="pcontact_info" class="form-control" required data-bs-toggle="tooltip" data-bs-placement="top" title="Enter the politician's contact details" /></td>
                        </tr>
                        <tr>
                            <td><label for="ppassword" data-bs-toggle="tooltip" data-bs-placement="top" title="Enter a password for the politician">Enter Password</label></td>
                            <td><input type="password" id="ppassword" name="ppassword" class="form-control" required data-bs-toggle="tooltip" data-bs-placement="top" title="Enter a password for the politician" /></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="button-container">
                                <input type="submit" value="Submit" />
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
    <script src="script.js">
        const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
        const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
    </script>
</body>

</html>
