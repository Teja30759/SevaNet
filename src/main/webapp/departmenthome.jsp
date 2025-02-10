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
    <link rel="stylesheet" href="style.css">
    <link rel="icon" type="image/png" href="fevi.png">
    <style>
        /* Flexbox Layout for Pie Chart and Calendar */
        .overview-container {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            margin-bottom: 30px;
        }

        .statistics, .calendar-container {
            width: 48%;
            min-height: 300px;
        }

        .statistics {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        #overviewChart {
            width: 100%;
            height: 100%;
        }

        .calendar-container iframe {
            width: 100%;
            height: 100%;
            border: 0;
        }

        /* Other sections */
        .event-cards, .latest-news, .award-cards, .channel-cards {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .event-card, .news-item, .award-card, .channel-card {
            flex: 1;
            min-width: 250px;
            max-width: 300px;
            margin-bottom: 15px;
        }

        .event-card .card-body, .news-item img, .award-card .card-body, .channel-card .card-body {
            padding: 15px;
        }

        /* Awards Section */
        .award-card .card-header {
            font-size: 1.5rem;
            background-color: #f8f9fa;
        }

        .award-card i {
            font-size: 2rem;
            margin-right: 10px;
        }

        /* Channels Section */
        .channel-card .card-header {
            font-size: 1.5rem;
            background-color: #f8f9fa;
        }

        .channel-card i {
            font-size: 2rem;
            margin-right: 10px;
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
                    <a href="departmenthome">SevaNet</a>
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
        <div class="main">
            <div class="username">
                <p align="right">Logged in as: <strong><%= dep.getName() %></strong></p>
                <h3 align="center">Welcome To <%= dep.getName() %> DashBoard</h3>
            </div>

            <!-- Overview Container: Pie Chart and Calendar -->
            <div class="overview-container">
                <!-- Pie Chart Section -->
                <div class="statistics">
                    <h4>Overview</h4>
                    <canvas id="overviewChart" width="400" height="400"></canvas>
                </div>
                <!-- Calendar Section -->
                <div class="calendar-container">
                    <h4>Calendar</h4>
                    <iframe src="https://calendar.google.com/calendar/embed?src=your_calendar_id&ctz=Asia%2FCalcutta"></iframe>
                </div>
            </div>

            <!-- Awards Section -->
            <div class="awards-section">
                <h4 align="center">Awards</h4>
                <div align="center" class="award-cards">
                    <!-- Award Card 1 -->
                    <div class="award-card card">
                        <div class="card-header">
                            <i class="lni lni-trophy"></i> Best Department Award
                        </div>
                        <div class="card-body">
                            <p>This award is given to the department that has shown outstanding performance in community engagement and development.</p>
                        </div>
                    </div>
                    <!-- Award Card 2 -->
                    <div class="award-card card">
                        <div class="card-header">
                            <i class="lni lni-crown"></i> Excellence in Service
                        </div>
                        <div class="card-body">
                            <p>Awarded for exceptional service and commitment to improving citizen welfare.</p>
                        </div>
                    </div>
                    <!-- Award Card 3 -->
                    <div class="award-card card">
                        <div class="card-header">
                            <i class="lni lni-leaf"></i> Green Initiative Award
                        </div>
                        <div class="card-body">
                            <p>Recognizes the department's efforts in promoting sustainability and environmental conservation.</p>
                        </div>
                    </div>
                </div>
            </div>

   <!-- Latest News Section -->
<h4 align="center">Latest News</h4>
<div class="latest-news d-flex flex-wrap justify-content-center">
    <div class="news-item card text-center mx-2 my-2" style="width: 18rem;">
        <img src="ndtv.png" class="card-img-top mx-auto mt-3" alt="NDTV">
        <div class="card-body">
            <h5 class="card-title">NDTV</h5>
            <p class="card-text">Get the latest updates on politics, economy, and society.</p>
            <a href="https://www.ndtv.com" target="_blank" class="btn btn-primary">Visit NDTV</a>
        </div>
    </div>
    <div class="news-item card text-center mx-2 my-2" style="width: 18rem;">
        <img src="hindhu.jpeg" class="card-img-top mx-auto mt-3" alt="The Hindu">
        <div class="card-body">
            <h5 class="card-title">The Hindu</h5>
            <p class="card-text">Explore the latest news on national and international topics.</p>
            <a href="https://www.thehindu.com" target="_blank" class="btn btn-primary">Visit The Hindu</a>
        </div>
    </div>
    <div class="news-item card text-center mx-2 my-2" style="width: 18rem;">
        <img src="indiatoday.png" class="card-img-top mx-auto mt-3" alt="India Today">
        <div class="card-body">
            <h5 class="card-title">India Today</h5>
            <p class="card-text">Breaking news on current affairs and exclusive interviews.</p>
            <a href="https://www.indiatoday.in" target="_blank" class="btn btn-primary">Visit India Today</a>
        </div>
    </div>
    <div class="news-item card text-center mx-2 my-2" style="width: 18rem;">
        <img src="toi.png" class="card-img-top mx-auto mt-3" alt="TOI">
        <div class="card-body">
            <h5 class="card-title">Times of India</h5>
            <p class="card-text">Daily highlights from one of India's leading news portals.</p>
            <a href="https://timesofindia.indiatimes.com" target="_blank" class="btn btn-primary">Visit TOI</a>
        </div>
    </div>
    <div class="news-item card text-center mx-2 my-2" style="width: 18rem;">
        <img src="bbc.png" class="card-img-top mx-auto mt-3" alt="BBC">
        <div class="card-body">
            <h5 class="card-title">BBC News</h5>
            <p class="card-text">World news and analysis from the BBC newsroom.</p>
            <a href="https://www.bbc.com/news" target="_blank" class="btn btn-primary">Visit BBC</a>
        </div>
    </div>
<div class="news-item card text-center mx-2 my-2" style="width: 18rem;">
    <img src="tv9.png" class="card-img-top mx-auto mt-3" alt="TV9 Telugu">
    <div class="card-body">
        <h5 class="card-title">TV9 Telugu</h5>
        <p class="card-text">Latest news and updates from Andhra Pradesh and Telangana.</p>
        <a href="https://www.tv9telugu.com" target="_blank" class="btn btn-primary">Visit TV9 Telugu</a>
    </div>
</div>
<div class="news-item card text-center mx-2 my-2" style="width: 18rem;">
    <img src="ntv.png" class="card-img-top mx-auto mt-3" alt="NTV Telugu">
    <div class="card-body">
        <h5 class="card-title">NTV Telugu</h5>
        <p class="card-text">24/7 coverage of news from Telangana, Andhra Pradesh, and beyond.</p>
        <a href="https://www.ntvtelugu.com" target="_blank" class="btn btn-primary">Visit NTV Telugu</a>
    </div>
</div>
<div class="news-item card text-center mx-2 my-2" style="width: 18rem;">
    <img src="abn.jpeg" class="card-img-top mx-auto mt-3" alt="ABN Andhrajyothi">
    <div class="card-body">
        <h5 class="card-title">ABN Andhrajyothi</h5>
        <p class="card-text">News and analysis on politics, business, and entertainment from Andhra Pradesh and Telangana.</p>
        <a href="https://www.andhrajyothy.com" target="_blank" class="btn btn-primary">Visit ABN Andhrajyothi</a>
    </div>
</div>
<div class="news-item card text-center mx-2 my-2" style="width: 18rem;">
    <img src="tv5.jpeg" class="card-img-top mx-auto mt-3" alt="TV5 Telugu">
    <div class="card-body">
        <h5 class="card-title">TV5 Telugu</h5>
        <p class="card-text">Your source for the latest news from across Andhra Pradesh and Telangana.</p>
        <a href="https://www.tv5news.in" target="_blank" class="btn btn-primary">Visit TV5 Telugu</a>
    </div>
</div>

</div>

        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
 // Function to generate random values that sum up to 50
    function generateRandomStats(total) {
        let resolved = Math.floor(Math.random() * total);
        let ongoing = Math.floor(Math.random() * (total - resolved));
        let assigned = total - resolved - ongoing; // Ensure the total is 50

        return [assigned, resolved, ongoing];
    }

    // Overview Pie Chart Data
    const data = {
        labels: ['Assigned Issues', 'Resolved Issues', 'Ongoing Issues'],
        datasets: [{
            data: generateRandomStats(50),
            backgroundColor: ['#ff9999', '#66b3ff', '#99ff99'],
            hoverOffset: 4
        }]
    };

    const config = {
        type: 'pie',
        data: data,
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                tooltip: {
                    callbacks: {
                        label: function(tooltipItem) {
                            let label = data.labels[tooltipItem.dataIndex] || '';
                            if (label) {
                                label += ': ';
                            }
                            label += tooltipItem.raw || 0;
                            return label;
                        }
                    }
                }
            }
        }
    };

    // Initialize the Pie Chart
    const overviewChart = new Chart(
        document.getElementById('overviewChart'),
        config
    );

    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8g4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="script.js"></script>
</body>
</html>
