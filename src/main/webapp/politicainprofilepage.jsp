<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@page import="com.klef.jfsd.springboot.sevanet.model.Politician" %>

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
    <title>Politician Profile</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css"><link rel="icon" type="image/png" href="fevi.png">

    <!-- Custom Styles -->
    <style>
 
        

        /* Profile Layout */
        .profile-container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 30px;
        }

        .profile-details {
            background-color: white;
            padding: 25px;
            width: 60%;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .profile-details h3 {
            font-size: 1.8rem;
            color: #333;
            font-weight: bold;
            margin-bottom: 20px;
            border-bottom: 2px solid #007bff;
            padding-bottom: 10px;
        }

        .profile-details ul {
            list-style: none;
            padding: 0;
        }

        .profile-details li {
            font-size: 1.2rem;
            margin: 10px 0;
            color: #555;
        }

        .profile-details strong {
            font-weight: 600;
            color: #222;
        }

        .profile-image {
            width: 35%;
            padding: 20px;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .profile-image img {
            width: 100%;
            height: auto;
            border-radius: 10px;
            object-fit: cover;
        }

        .btn-custom {
            background-color: #004945;
            color: white;
            padding: 12px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 1.1rem;
            display: inline-block;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }

        .btn-custom:hover {
            background-color: #00302e;
        }

        .username {
            text-align: right;
            margin-bottom: 20px;
            color: #333;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .profile-container {
                flex-direction: column;
            }

            .profile-details,
            .profile-image {
                width: 100%;
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
                        <i class="lni lni-comments"></i>
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

            <div class="profile-container">
                <div class="profile-details">
                    <h3>Politician Profile</h3>
                    <ul>
                        <li><strong>Id: </strong><%= poli.getId() %></li>
                        <li><strong>Name: </strong><%= poli.getName() %></li>
                        <li><strong>Party: </strong><%= poli.getParty() %></li>
                        <li><strong>Constituency: </strong><%= poli.getConstituency() %></li>
                        <li><strong>Position: </strong><%= poli.getPosition() %></li>
                     
                        <li><strong>Contact Info: </strong><%= poli.getContactInfo() %></li>
                    </ul>
                </div>
                
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8g4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="script.js"></script>
</body>

</html>
