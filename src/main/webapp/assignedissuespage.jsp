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
    <link rel="stylesheet" href="style.css"> <link rel="icon" type="image/png" href="fevi.png">
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
        <div class="main p-4">
            <!-- Top Right Department Info -->
            <div class="text-end mb-3">
                <strong>Department:</strong> <%= dep.getName() %> | 
                <strong>Constituency:</strong> <%= dep.getConstituency() %>
            </div>

            <h1 class="text-center">Assigned Issues</h1>

            <br>
            <div class="form-container mt-4 mx-auto" style="max-width: 400px;">
                <h4 class="text-center">Respond to Issue</h4>
                <form action="issueupdate" method="post">
                    <div class="mb-3">
                        <label for="iname" class="form-label">Department Name</label>
                        <input type="text" id="iname" name="iname" class="form-control" readonly value="<%= dep.getName() %>" required/>
                    </div>
                    <div class="mb-3">
                        <label for="pconstituency" class="form-label">Constituency</label>
                        <input type="text" id="pconstituency" name="pconstituency" class="form-control" readonly value="<%= dep.getConstituency() %>" required/>
                    </div>
                    <div class="text-center">
                        <input type="submit" value="Click Here" class="btn btn-primary"/>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="script.js"></script>
</body>
</html>
