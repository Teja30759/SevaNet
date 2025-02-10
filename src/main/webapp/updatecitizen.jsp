<%@page import="com.klef.jfsd.springboot.sevanet.model.Citizen"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Citizen citizen = (Citizen) session.getAttribute("citizen");
if(citizen == null) {
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
    <title>SevaNet</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css"><link rel="icon" type="image/png" href="fevi.png">
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
                        <i class="lni lni-pencil-alt"></i>
                        <span>Update Profile</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="addissue" class="sidebar-link">
                        <i class="lni lni-flag"></i>
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
            <h4 align="center" style="color:red">
                <c:out value="${message}"></c:out>
            </h4>

            <h3 class="text-center"><u>Update Citizen Profile</u></h3>
            <div class="form-container mx-auto" style="max-width: 600px;">
                <form method="post" action="updateCitizenProfile">
                    <table class="table">
                        <tr>
                            <td><label for="cid">Citizen ID</label></td>
                            <td><input type="number" id="cid" name="cid" readonly value="<%= citizen.getId() %>" required class="form-control"/></td>
                        </tr>
                        <tr>
                            <td><label for="firstname">First Name</label></td>
                            <td><input type="text" id="firstname" name="firstname" value="<%= citizen.getFirstname() %>" required class="form-control"/></td>
                        </tr>
                        <tr>
                            <td><label for="lastname">Last Name</label></td>
                            <td><input type="text" id="lastname" name="lastname" value="<%= citizen.getLastname() %>" required class="form-control"/></td>
                        </tr>
                        <tr>
                            <td><label>Select Gender</label></td>
                            <td>
                                <input type="radio" id="male" name="gender" value="MALE" <%= citizen.getGender().equals("MALE") ? "checked" : "" %> required/>
                                <label for="male">Male</label>
                                <input type="radio" id="female" name="gender" value="FEMALE" <%= citizen.getGender().equals("FEMALE") ? "checked" : "" %> required/>
                                <label for="female">Female</label>
                                <input type="radio" id="others" name="gender" value="OTHERS" <%= citizen.getGender().equals("OTHERS") ? "checked" : "" %> required/>
                                <label for="others">Others</label>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="dob">Date of Birth</label></td>
                            <td><input type="text" id="dob" name="edob" readonly value="<%= citizen.getDateofbirth() %>" required class="form-control"/></td>
                        </tr>
                        <tr>
                            <td><label for="address">Address</label></td>
                            <td><input type="text" id="address" name="address" value="<%= citizen.getAddress() %>" required class="form-control"/></td>
                        </tr>
                        <tr>
                            <td><label for="constituency">Constituency</label></td>
                            <td><input type="text" id="constituency" name="constituency" readonly value="<%= citizen.getConstituency() %>" required class="form-control"/></td>
                        </tr>
                        <tr>
                            <td><label for="aadhar">Aadhaar Number</label></td>
                            <td><input type="text" id="aadhar" name="aadharno" readonly value="<%= citizen.getAadharnumber() %>" required class="form-control"/></td>
                        </tr>
                        <tr>
                            <td><label for="contact">Contact Number</label></td>
                            <td><input type="text" id="contact" name="contact" readonly value="<%= citizen.getContact() %>" required class="form-control"/></td>
                        </tr>
                        <tr>
                            <td><label for="maritalstatus">Marital Status</label></td>
                            <td>
                                <select id="maritalstatus" name="maritalstatus" required class="form-select">
                                    <option value="">---Select---</option>
                                    <option value="SINGLE" <%= "SINGLE".equals(citizen.getMaritalstatus()) ? "selected" : "" %>>Single</option>
                                    <option value="MARRIED" <%= "MARRIED".equals(citizen.getMaritalstatus()) ? "selected" : "" %>>Married</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label for="email">Email</label></td>
                            <td><input type="email" id="email" name="email"  value="<%= citizen.getEmail() %>" required class="form-control"/></td>
                        </tr>
                        <tr>
                            <td><label for="password">Password</label></td>
                            <td><input type="password" id="password" name="password" readonly value="<%= citizen.getPassword() %>" required class="form-control"/></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center">
                                <input type="submit" value="Update" class="btn btn-primary"/>
                                <input type="reset" value="Clear" class="btn btn-secondary"/>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="script.js"></script>
</body>

</html>
