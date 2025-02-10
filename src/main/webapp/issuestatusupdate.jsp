<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page import="com.klef.jfsd.springboot.sevanet.model.Department" %>
<%
Department dep = (Department) session.getAttribute("department");
if (dep == null) {
    response.sendRedirect("politiciansessionexpage");
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
    <link rel="stylesheet" href="style.css"><link rel="icon" type="image/png" href="fevi.png">
    <style >
        /* Card Styling */
        .card {
            border: 1px solid #ddd;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
        }

        .card-body {
            background-color: #f9f9f9;
            padding: 20px;
        }

        .card-title {
            font-size: 18px;
            font-weight: bold;
        }

        .issue-status {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .issue-status select, .issue-status input {
            margin-bottom: 10px;
            padding: 5px;
            width: 100%;
        }

        .btn-update {
            text-transform: uppercase;
            padding: 8px 15px;
            background-color: #007bff;
            color: white;
            border: none;
            font-weight: bold;
            cursor: pointer;
        }

        .btn-update:hover {
            background-color: #0056b3;
        }

        /* Responsiveness */
        @media (max-width: 768px) {
            #sidebar {
                width: 200px;
            }

            .main {
                margin-left: 200px;
            }

            .card {
                margin-bottom: 15px;
            }
        }

        @media (max-width: 576px) {
            #sidebar {
                width: 100%;
            }

            .main {
                margin-left: 0;
            }
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
                <!-- Sidebar Links from department navbar -->
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
            <div class="welcome-container">
                <h4 align="center" style="color: red">
                    <c:out value="${message}"></c:out>
                </h4>
            </div>
              <div class="container">
                <div class="row">
                    <c:forEach items="${issues}" var="iss">
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title"><c:out value="${iss.title}"/></h5>
                                    <p><strong>Description:</strong> <c:out value="${iss.description}"/></p>
                                    <p><strong>Issue Type:</strong> <c:out value="${iss.issueType}"/></p>
                                    <p><strong>Location:</strong> <c:out value="${iss.location}"/></p>
                                    <p><strong>Reported By:</strong> <c:out value="${iss.reportedBy}"/></p>
                                    <p><strong>Created Date:</strong> <c:out value="${iss.createdDate}"/></p>
                                    <p><strong>Urgency Level:</strong> <c:out value="${iss.urgencyLevel}"/></p>

                                    <!-- Update Status and Date Form -->
                                    <form action="issueupdation" method="post">
                                        <input type="hidden" name="id" value="${iss.id}" />
                                        <div class="issue-status">
                                            <select name="status" required class="form-select form-select-sm">
                                                <option value="In Progress" ${iss.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                                                <option value="Resolved" ${iss.status == 'Resolved' ? 'selected' : ''}>Resolved</option>
                                            </select>
                                            <input type="date" name="updateDate" value="${iss.updatedDate != null ? iss.updatedDate : ''}" required class="form-control form-control-sm" />
                                            <button type="submit" class="btn-update">
                                                <i class="lni lni-checkmark-circle"></i> Update Status & Date
                                            </button>
                                        </div>
                                    </form>
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
    <script src="script.js"></script>
</body>
</html>
