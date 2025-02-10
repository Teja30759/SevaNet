
<%@ page import="com.klef.jfsd.springboot.sevanet.model.Admin" %>
  <%@ taglib uri="jakarta.tags.core" prefix="c" %>
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
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Admin Home</title>
      <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SX301p5ILy+dN9+nJOZ" crossorigin="anonymous">
      <link rel="stylesheet" href="style.css">
      <style>
          #issueChart {
              width: 300px !important;
              height: 300px !important;
          }
  
          .card-container {
              display: flex;
              flex-wrap: wrap;
              justify-content: center;
              gap: 20px;
              margin-top: 20px;
          }
  
          .dashboard-card {
              width: 300px;
              border: 1px solid #ddd;
              border-radius: 8px;
              box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
              background-color: #fff;
              transition: box-shadow 0.3s ease;
          }
  
          .dashboard-card:hover {
              box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
          }
  
          .card-body {
              padding: 20px;
          }
  
          .card-title {
              font-size: 18px;
              font-weight: bold;
              color: #3a7bd5;
          }
  
          .card-text {
              font-size: 14px;
              color: #333;
              margin: 5px 0;
          }
  
          .card-actions {
              display: flex;
              justify-content: space-between;
              padding: 10px;
              border-top: 1px solid #ddd;
              background-color: #f9f9f9;
          }
  
          .card-actions a {
              color: #3a7bd5;
              text-decoration: none;
              font-size: 16px;
          }
  
          .card-actions a:hover {
              color: #1e5aa6;
          }
  
          .username {
              text-align: right;
              margin: 10px;
          }
  
          
          .card-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 20px;
    margin-top: 50px; /* Adjust the spacing */
}

#channelSection {
    margin-top: 30px; /* Creates space from the previous content */
    text-align: center;
}

/* Container for pie chart and text */
.pie-chart-container {
    display: flex;
    justify-content: center;
    align-items: center; /* Align items vertically */
    margin-top: 20px; /* Adjust as needed */
    gap: 10px; /* Space between the chart and the text */
}

/* Pie chart styling */
.pie-chart-container canvas {
    align-self: center; /* Center the canvas relative to the text */
    max-width: 300px; /* Ensure a consistent size */
    height: auto; /* Maintain aspect ratio */
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
<div class="main">
    <div class="username">
        <p>Logged in as: <strong><%= admin.getUsername() %></strong></p>
    </div>

    <h3 style="text-align: center;">
        <u>Admin Dashboard</u>
    </h3>

<!-- Dashboard Cards -->
    <div class="card-container">
        <div class="dashboard-card">
            <div class="card-body">
                <h5 class="card-title">Manage Politicians</h5>
                <p class="card-text">Total Politicians: <c:out value="${polcount}" /></p>
            </div>
            <div class="card-actions">
                <a href="managepoliticians">Go to Politicians</a>
            </div>
        </div>

        <div class="dashboard-card">
            <div class="card-body">
                <h5 class="card-title">Manage Departments</h5>
                <p class="card-text">Total Departments: <c:out value="${deptcount}" /></p>
            </div>
            <div class="card-actions">
                <a href="managedepartments">Go to Departments</a>
            </div>
        </div>

        <div class="dashboard-card">
            <div class="card-body">
                <h5 class="card-title">Manage Citizens</h5>
                <p class="card-text">Total Citizens: <c:out value="${citcount}" /></p>
            </div>
            <div class="card-actions">
                <a href="managecitizens">Go to Citizens</a>
            </div>
        </div>
    </div>

  <div class="pie-chart-container">
    <!-- Pie Chart -->
    <div>
        <canvas id="issueChart"></canvas>
    </div>

    <!-- Issue Count Details -->
    <div style="text-align: left;">
        <p><strong>Total Issues (Np):</strong> <c:out value="${reportedCount + inProgressCount + resolvedCount}" /></p>
        <p><strong>Reported:</strong> <span id="reportedCountLabel">${reportedCount}</span></p>
        <p><strong>In Progress:</strong> <span id="inProgressCountLabel">${inProgressCount}</span></p>
        <p><strong>Resolved:</strong> <span id="resolvedCountLabel">${resolvedCount}</span></p>
    </div>
</div>




   
</div>

      <!-- Chart.js Script -->
      <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
      <script>
          var ctx = document.getElementById('issueChart').getContext('2d');
          var issueChart = new Chart(ctx, {
              type: 'pie',
              data: {
                  labels: ['Reported', 'In Progress', 'Resolved'],
                  datasets: [{
                      label: 'Issue Status',
                      data: [${reportedCount}, ${inProgressCount}, ${resolvedCount}],
                      backgroundColor: ['#FF6384', '#36A2EB', '#FFCE56']
                  }]
              },
              options: {
                  responsive: true,
                  plugins: {
                      legend: {
                          position: 'top',
                      },
                      tooltip: {
                          callbacks: {
                              label: function(tooltipItem) {
                                  return tooltipItem.label + ': ' + tooltipItem.raw;
                              }
                          }
                      }
                  }
              }
          });
      </script><br><br>
  <!-- Display Channel Cards -->
  <div id="channelSection">
<div style="margin: 30px auto; text-align: center;">
    <h4>Explore Channels</h4>
    <div class="card-container">
        <!-- Channel 1 -->
        <div class="dashboard-card">
            <img src="img1.jpg" alt="Channel 1" style="width: 100%; height: 150px; border-radius: 8px 8px 0 0;">
            <div class="card-body">
                <h5 class="card-title">TV-9</h5>
                <p class="card-text">Discover the latest updates and news from Channel 1.</p>
            </div>
            <div class="card-actions">
                <a href="channel1link">Learn More</a>
            </div>
        </div>

<!-- Channel 2 -->
        <div class="dashboard-card">
            <img src="img2.jpg" alt="Channel 2" style="width: 100%; height: 150px; border-radius: 8px 8px 0 0;">
            <div class="card-body">
                <h5 class="card-title">Republic</h5>
                <p class="card-text">Stay updated with insights from Channel 2.</p>
            </div>
            <div class="card-actions">
                <a href="channel2link">Learn More</a>
            </div>
        </div>

        <!-- Channel 3 -->
        <div class="dashboard-card">
            <img src="img3.jpg" alt="Channel 3" style="width: 100%; height: 150px; border-radius: 8px 8px 0 0;">
            <div class="card-body">
                <h5 class="card-title">Times now</h5>
                <p class="card-text">Explore features and resources on Channel 3.</p>
            </div>
            <div class="card-actions">
                <a href="channel3link">Learn More</a>
            </div>
        </div>

        <!-- Channel 4 -->
        <div class="dashboard-card">
            <img src="img4.jpg" alt="Channel 4" style="width: 100%; height: 150px; border-radius: 8px 8px 0 0;">
            <div class="card-body">
                <h5 class="card-title">India TV</h5>
                <p class="card-text">Get exclusive content and updates on Channel 4.</p>
            </div>
            <div class="card-actions">
                <a href="channel4link">Learn More</a>
            </div>
        </div>
    </div>
</div>
</div>
  <script>
    document.addEventListener("DOMContentLoaded", function () {
        const channelSection = document.getElementById("channelSection");
        const mainContent = document.querySelector(".main");
        mainContent.appendChild(channelSection);
    });
</script>
  
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
      <script src="script.js">
          const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
          const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
      </script>
      
      
  </body>
  
  </html>