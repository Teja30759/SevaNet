<%@page import="com.klef.jfsd.springboot.sevanet.model.Citizen" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Citizen citizen =(Citizen)session.getAttribute("citizen");

//after logout session expired
if(citizen == null){
  response.sendRedirect("citizensessionexpiry");
  return;
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Citizen</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css"> <link rel="icon" type="image/png" href="fevi.png">
</head>

<body>
    <div class="wrapper">
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
            <h3 class="text-center mb-4"><u>My Profile</u></h3>

            <!-- Bootstrap Card for Profile -->
            <div class="card mx-auto" style="max-width: 600px; border: none; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); border-radius: 12px; background-color: #223243;">
                <div class="card-body" style="padding: 2rem;">
                    <h5 class="card-title text-center" style="font-size: 1.5rem; color: #ffffff; font-weight: 600;">Citizen Details</h5>

                    <!-- Profile Details -->
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item d-none" style="font-size: 1rem; padding: 1rem 1.25rem; background-color: #223243; color: #ffffff; border-radius: 8px; margin-bottom: 0.5rem;">
                            <b>ID:</b> <%=citizen.getId()%>
                        </li> <!-- Hidden ID field -->
                        <li class="list-group-item" style="font-size: 1rem; padding: 1rem 1.25rem; background-color: #223243; color: #ffffff; border-radius: 8px; margin-bottom: 0.5rem;">
                            <b>First Name:</b> <%=citizen.getFirstname() %>
                        </li>
                        <li class="list-group-item" style="font-size: 1rem; padding: 1rem 1.25rem; background-color: #223243; color: #ffffff; border-radius: 8px; margin-bottom: 0.5rem;">
                            <b>Last Name:</b> <%=citizen.getLastname()%>
                        </li>
                        <li class="list-group-item" style="font-size: 1rem; padding: 1rem 1.25rem; background-color: #223243; color: #ffffff; border-radius: 8px; margin-bottom: 0.5rem;">
                            <b>Email:</b> <%=citizen.getEmail()%>
                        </li>
                        <li class="list-group-item" style="font-size: 1rem; padding: 1rem 1.25rem; background-color: #223243; color: #ffffff; border-radius: 8px; margin-bottom: 0.5rem;">
                            <b>Address:</b> <%=citizen.getAddress() %>
                        </li>
                        <li class="list-group-item" style="font-size: 1rem; padding: 1rem 1.25rem; background-color: #223243; color: #ffffff; border-radius: 8px; margin-bottom: 0.5rem;">
                            <b>Contact:</b> <%=citizen.getContact()%>
                        </li>
                        <li class="list-group-item" style="font-size: 1rem; padding: 1rem 1.25rem; background-color: #223243; color: #ffffff; border-radius: 8px; margin-bottom: 0.5rem;">
                            <b>Aadhar No:</b> <%=citizen.getAadharnumber()%>
                        </li>
                        <li class="list-group-item" style="font-size: 1rem; padding: 1rem 1.25rem; background-color: #223243; color: #ffffff; border-radius: 8px; margin-bottom: 0.5rem;">
                            <b>Constituency:</b> <%=citizen.getConstituency()%>
                        </li>
                        <li class="list-group-item" style="font-size: 1rem; padding: 1rem 1.25rem; background-color: #223243; color: #ffffff; border-radius: 8px; margin-bottom: 0.5rem;">
                            <b>Gender:</b> <%=citizen.getGender()%>
                        </li>
                        <li class="list-group-item" style="font-size: 1rem; padding: 1rem 1.25rem; background-color: #223243; color: #ffffff; border-radius: 8px; margin-bottom: 0.5rem;">
                            <b>Marital Status:</b> <%=citizen.getMaritalstatus()%>
                        </li>
                    </ul>

                    <a href="updatecitizen" class="btn btn-primary w-100 mt-3" style="font-size: 1rem; padding: 0.75rem; border-radius: 8px; background-color: #223243; color: white; font-weight: 600; transition: background-color 0.3s ease;">
                        Update Profile
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="script.js"></script>
</body>

</html>
