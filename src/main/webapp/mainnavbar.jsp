<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sidebar With Bootstrap</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="wrapper">
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
                <!-- Main Nav Links -->
                <li class="sidebar-item">
                    <a href="/" class="sidebar-link">
                        <i class="lni lni-home"></i>
                        <span>Home</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="adminlogin" class="sidebar-link">
                        <i class="lni lni-key"></i>
                        <span>Admin Login</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="politicianlogin" class="sidebar-link">
                        <i class="lni lni-user"></i>
                        <span>Politician Login</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="departmentlogin" class="sidebar-link">
                        <i class="lni lni-briefcase"></i>
                        <span>Department Login</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="citizenlogin" class="sidebar-link">
                        <i class="lni lni-users"></i>
                        <span>Citizen Login</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="citizenreg" class="sidebar-link">
                        <i class="lni lni-pencil"></i>
                        <span>Citizen Registration</span>
                    </a>
                </li>
                
              
        </aside>
        <div class="main p-3">
            <div class="text-center">
                <h1>
                    
                    
                    
                </h1>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
    <script src="script.js"></script>
</body>

</html>
