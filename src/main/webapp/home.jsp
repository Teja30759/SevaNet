<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to SevaNet</title>
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <link rel="icon" type="image/png" href="fevi.png">
    <style>
        .login-card {
            background-color: #26384B;
            color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .login-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }

        .login-card i {
            font-size: 40px;
            margin-bottom: 10px;
            color: #f0f0f0;
        }

        .login-card h4 {
            margin-top: 10px;
            font-weight: bold;
            color: #e4e7ec;
        }

        .login-card p {
            color: #d1d7db;
        }

        .login-card a {
            text-decoration: none;
            color: #ffb84d;
            display: block;
            margin-top: 10px;
            font-size: 18px;
            font-weight: 500;
        }

        .login-card a:hover {
            text-decoration: underline;
        }

        .achievement-card {
            background-color: #515f6e;
            color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .achievement-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }

        .achievement-card i {
            font-size: 50px;
            margin-bottom: 10px;
            color: #f0f0f0;
        }

        .achievement-card h4 {
            margin-top: 10px;
            font-weight: bold;
            color: #f0f0f0;
        }

        .achievement-card p {
            color: #e4e7ec;
        }

        .achievement-card a {
            text-decoration: none;
            color: #ffb84d;
            display: block;
            margin-top: 10px;
            font-size: 18px;
            font-weight: 500;
        }

        .achievement-card a:hover {
            text-decoration: underline;
        }

        .contributor-card {
            background-color: #f1f1f1;
            color: #333;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .contributor-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }

        .contributor-card i {
            font-size: 40px;
            margin-bottom: 10px;
            color: #ffb84d;
        }

        .contributor-card h4 {
            margin-top: 10px;
            font-weight: bold;
        }

        .contributor-card p {
            color: #666;
        }
        
        .contact-us a {
        font-size: 36px;
        color: #ffb84d;
        margin: 0 15px;
        transition: transform 0.3s, color 0.3s;
    }

    .contact-us a:hover {
        color: #26384B;
        transform: scale(1.1);
    }

    .contact-us i {
        transition: transform 0.3s;
    }

    .contact-us a:hover i {
        transform: rotate(10deg);
    }

    /* Add tooltip styling */
    .contact-us a:hover::after {
        content: attr(data-tooltip);
        position: absolute;
        background-color: rgba(0, 0, 0, 0.7);
        color: #fff;
        padding: 5px 10px;
        border-radius: 5px;
        font-size: 14px;
        bottom: 40px;
        left: 50%;
        transform: translateX(-50%);
        white-space: nowrap;
        opacity: 1;
        visibility: visible;
        z-index: 100;
    }

    /* Optional: style for the social media icons' tooltips */
    .contact-us a[data-tooltip="Email"] {
        color: #ffb84d;
    }

    .contact-us a[data-tooltip="LinkedIn"] {
        color: #0077b5;
    }

    .contact-us a[data-tooltip="Twitter"] {
        color: #1da1f2;
    }

    .contact-us a[data-tooltip="Facebook"] {
        color: #1877f2;
    }
    </style>
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
            </ul>
        </aside>

        <!-- Main Content -->
        <div class="main p-3">
            <div class="text-center">
                <h2>Welcome to SevaNet</h2>
            </div>
            <div class="container mt-5">
                <!-- Login Tiles -->
                <div class="row text-center g-4">
                    <div class="col-md-4">
                        <div class="login-card">
                            <i class="lni lni-key"></i>
                            <h4>Admin Portal</h4>
                            <p>Manage users, departments, and politicians seamlessly.</p>
                            <a href="adminlogin">Go to Admin Login</a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="login-card">
                            <i class="lni lni-user"></i>
                            <h4>Politician Gateway</h4>
                            <p>Connect with citizens and respond to their concerns effortlessly.</p>
                            <a href="politicianlogin">Go to Politician Login</a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="login-card">
                            <i class="lni lni-briefcase"></i>
                            <h4>Department Access</h4>
                            <p>Oversee and manage department-related activities efficiently.</p>
                            <a href="departmentlogin">Go to Department Login</a>
                        </div>
                    </div>
                </div>
                <div class="row text-center g-4 mt-3">
                    <div class="col-md-6">
                        <div class="login-card">
                            <i class="lni lni-users"></i>
                            <h4>Citizen Login</h4>
                            <p>Engage with your local representatives and raise issues directly.</p>
                            <a href="citizenlogin">Go to Citizen Login</a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="login-card">
                            <i class="lni lni-pencil"></i>
                            <h4>Citizen Registration</h4>
                            <p>Join SevaNet to make your voice heard and improve your community.</p>
                            <a href="citizenreg">Register as a Citizen</a>
                        </div>
                    </div>
                </div>

                <!-- Roles Section -->
                <div class="row text-center g-4 mt-5">
                            <div class="text-center">
                <h2>Roles</h2>
            </div>
                
                    <div class="col-md-3">
                        <div class="contributor-card">
                            <i class="lni lni-key"></i>
                            <h4>Admin</h4>
                            <p>Manage user accounts, oversee departments, and handle governance tasks.</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="contributor-card">
                            <i class="lni lni-user"></i>
                            <h4>Politician</h4>
                            <p>Engage with citizens, respond to their concerns, and manage constituencies.</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="contributor-card">
                            <i class="lni lni-briefcase"></i>
                            <h4>Department</h4>
                            <p>Oversee department activities and assist in governance tasks.</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="contributor-card">
                            <i class="lni lni-users"></i>
                            <h4>Citizen</h4>
                            <p>Engage with politicians, raise issues, and contribute to the community.</p>
                        </div>
                    </div>
                </div>

                <!-- Achievement Tiles -->
                <div class="row text-center g-4 mt-5">
                            <div class="text-center">
                <h2>Achievement</h2>
            </div>
                
                    <div class="col-md-4">
                        <div class="achievement-card">
                            <i class="lni lni-checkmark-circle"></i>
                            <h4>Achievement 1</h4>
                            <p>Recognized for excellence in governance and service delivery.</p>
                            <a href="#">Learn More</a>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="achievement-card">
                            <i class="lni lni-heart"></i>
                            <h4>Achievement 2</h4>
                            <p>Committed to citizen welfare and enhancing public engagement.</p>
                            <a href="#">Learn More</a>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="achievement-card">
                            <i class="lni lni-checkmark-circle"></i>
                            <h4>Achievement 3</h4>
                            <p>Improved transparency and accountability in government operations.</p>
                            <a href="#">Learn More</a>
                        </div>
                    </div>
                </div>

                        <!-- Roles Section -->
                <div class="text-center mt-5">
                    <h2>Contributers</h2>
                </div>
                <div class="row mt-4">
                    <div class="col-md-4">
                        <div class="role-card">
                            <h4>Leela Sanjay Kumar</h4>
                            <p><strong>Role:</strong> Backend Developer</p>
                            <p>Responsible for the server-side development and database management of SevaNet.</p>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="role-card">
                            <h4>Teja Srikiran</h4>
                            <p><strong>Role:</strong> Frontend Developer</p>
                            <p>Handles the user interface design and client-side scripting for SevaNet.</p>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="role-card">
                            <h4>Margani Venkat</h4>
                            <p><strong>Role:</strong> Project Manager</p>
                            <p>Coordinates the team, manages the project timeline, and ensures smooth execution of SevaNet.</p>
                        </div>
                    </div>
                </div>
   <!-- Contact Us Section -->
                <div class="text-center mt-5">
                    <h2>Contact Us</h2>
                </div>
                <div class="text-center contact-us mt-4">
    <a href="mailto:sevanet@example.com" data-tooltip="Email"><i class="lni lni-envelope"></i></a>
    <a href="https://www.linkedin.com" target="_blank" data-tooltip="LinkedIn"><i class="lni lni-linkedin-original"></i></a>
    <a href="https://www.twitter.com" target="_blank" data-tooltip="Twitter"><i class="lni lni-twitter-original"></i></a>
    <a href="https://www.facebook.com" target="_blank" data-tooltip="Facebook"><i class="lni lni-facebook-original"></i></a>
</div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <script src="script.js"></script>
</body>

</html>
