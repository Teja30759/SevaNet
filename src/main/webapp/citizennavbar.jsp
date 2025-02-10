<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spring Boot - SevaNet</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .wrapper {
            display: flex;
            height: 100vh;
        }

        

        .main {
            flex-grow: 1;
            background-color: #f4f4f9;
            padding: 20px;
        }


        h2 {
            text-align: center;
            color: #1a1a2e;
        }
    </style>
</head>

<body>
    <div class="wrapper">
        <aside id="sidebar">
            <div class="sidebar-logo">
                SevaNet
            </div>
            <ul class="sidebar-nav">
                <li class="sidebar-item">
                    <a href="citizenhome">
                        <i class="lni lni-home"></i>
                        <span>Home</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="addissue">
                        <i class="lni lni-pencil"></i>
                        <span>Report Issue</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="trackissue">
                        <i class="lni lni-map"></i>
                        <span>Track Issue</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="citizenprofile">
                        <i class="lni lni-user"></i>
                        <span>Profile</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="citizenlogout">
                        <i class="lni lni-exit"></i>
                        <span>Logout</span>
                    </a>
                </li>
            </ul>
        </aside>
        <div class="main">
            <h2>Welcome to SevaNet</h2>
            <div class="navbar">
                <a href="citizenhome">Home</a>
                <a href="addissue">Report Issue</a>
                <a href="trackissue">Track Issue</a>
                <a href="citizenprofile">Profile</a>
                <a href="citizenlogout">Logout</a>
            </div>
        </div>
    </div>
</body>

</html>
