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
    <title>SevaNet - Update Issue</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">

    <style>
        /* General body and table styling */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        table {
            width: 100%;
            max-width: 1200px;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: white; /* White background */
            color: black; /* Black text color */
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #cccccc; /* Light grey border */
        }

        th {
            background-color: #0e2238; /* Table header color */
            color: white;
            font-weight: bold;
        }

        td {
            background-color: white; /* White for rows */
            font-size: 14px;
        }

        /* Table row hover effect with blinking */
        @keyframes blink {
            50% {
                background-color: lightblue; /* Blinking effect color */
            }
        }

        tr:hover {
            animation: blink 0.5s step-end infinite alternate; /* Blinking effect on hover */
            cursor: pointer;
        }

        /* Form and select styling */
        select {
            padding: 10px;
            margin: 5px;
            border-radius: 5px;
            border: 1px solid black; /* Black border */
            background-color: white;
            color: black;
            font-size: 14px;
        }

        select:focus {
            border-color: #00c4cc;
            outline: none;
        }

        input[type="hidden"] {
            display: none;
        }

        button[type="submit"] {
            background-color: black; /* Black button */
            border: none;
            padding: 10px 20px;
            color: white;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #333333; /* Darker black on hover */
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
                    <a href="/">SevaNet</a>
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
                        <i class="lni lni-pencil-alt"></i> <!-- Updated icon -->
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
                <h2>Respond to Issues</h2>
                <table>
                    <tr>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Type</th>
                        <th>Location</th>
                        <th>Reported By</th>
                        <th>Constituency</th>
                        <th>Created Date</th>
                        <th>Urgency Level</th>
                        <th>Update Status</th>
                        <th>Actions</th>
                    </tr>
                    <c:forEach items="${issuelist}" var="iss">
                        <c:if test="${iss.status == 'Reported'}">
                            <form action="updateIssueFields" method="post">
                                <tr>
                                    <td><c:out value="${iss.title}"/></td>
                                    <td><c:out value="${iss.description}"/></td>
                                    <td><c:out value="${iss.issueType}"/></td>
                                    <td><c:out value="${iss.location}"/></td>
                                    <td><c:out value="${iss.reportedBy}"/></td>
                                    <td><c:out value="${iss.constituency}"/></td>
                                    <td><c:out value="${iss.createdDate}"/></td>
                                    <td><c:out value="${iss.urgencyLevel}"/></td>
                                    <td>
                                        <input type="hidden" name="id" value="${iss.id}"/>

                                        <select name="status" required>
                                            <option value="Reported" ${iss.status == 'Reported' ? 'selected' : ''}>Reported</option>
                                            <option value="In Progress" ${iss.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                                        </select>

                                        <select name="priority" required>
                                            <option value="Immediate" ${iss.priority == 'Immediate' ? 'selected' : ''}>Immediate</option>
                                            <option value="Soon" ${iss.priority == 'Soon' ? 'selected' : ''}>Soon</option>
                                            <option value="Whenever possible" ${iss.priority == 'Whenever possible' ? 'selected' : ''}>Whenever possible</option>
                                        </select>

                                        <select name="assignedTo" required>
                                            <option>---Select Department---</option>
                                            <option value="Health Department" ${iss.assignedTo == 'HealthDepartment' ? 'selected' : ''}>Health</option>
                                            <option value="Education Department" ${iss.assignedTo == 'EducationDepartment' ? 'selected' : ''}>Education</option>
                                            <option value="Infrastructure Department" ${iss.assignedTo == 'InfrastructureDepartment' ? 'selected' : ''}>Infrastructure</option>
                                            <option value="Police Department" ${iss.assignedTo == 'PoliceDepartment' ? 'selected' : ''}>Police</option>
                                        </select>
                                    </td>
                                    <td>
                                        <button type="submit">Respond</button>
                                    </td>
                                </tr>
                            </form>
                        </c:if>
                    </c:forEach>
                </table>
            </center>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8g4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="script.js"></script>
</body>
</html>
