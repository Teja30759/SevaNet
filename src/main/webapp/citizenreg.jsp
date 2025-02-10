<%@ taglib uri="jakarta.tags.core" prefix="c" %>

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
<style>
    /* Feedback and Error Styling */
    .feedback {
        color: #666;
        font-size: 0.85rem;
        margin-top: 5px;
        text-align: left;
    }

    .error {
        color: red;
        font-size: 0.85rem;
        margin-top: 5px;
        display: block;
        text-align: left;
    }

    /* Progress Meter */
   meter {
        width: 100%;
        height: 10px;
        margin-top: 5px;
        border-radius: 5px;
        background-color: #e0e0e0; /* Default background */
    }

    meter::-webkit-meter-bar {
        background-color: #e0e0e0;
        border-radius: 5px;
    }

    meter::-webkit-meter-optimum-value {
        background-color: #4caf50; /* Strong */
    }

    meter::-webkit-meter-suboptimum-value {
        background-color: #ffeb3b; /* Medium */
    }

    meter::-webkit-meter-even-less-good-value {
        background-color: #f44336; /* Weak */
    }


    /* Form Container */
    .form-container {
        width: 50%;
        margin: auto;
        padding: 20px;
        border: 1px solid #ddd;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        background-color: #ffffff;
        border-radius: 8px;
    }

    /* Heading Styling */
    h3 {
        text-align: center;
        color: #333;
        font-family: 'Poppins', sans-serif;
        margin-bottom: 20px;
    }

    /* Message Styling */
    .message {
        color: red;
        text-align: center;
        font-size: 1rem;
        margin-bottom: 15px;
    }

    /* Table Layout */
    table {
        width: 100%;
        margin: 0 auto;
        border-spacing: 0 15px;
    }

    table td {
        vertical-align: middle;
        padding: 10px;
    }

    /* Input and Select Fields */
    input[type="text"], 
    input[type="email"], 
    input[type="password"], 
    input[type="number"], 
    input[type="date"], 
    select {
        width: 100%;
        padding: 12px;
        font-size: 1rem;
        border: 1px solid #ccc;
        border-radius: 6px;
        box-sizing: border-box;
        background-color: #f9f9f9;
        transition: border-color 0.3s ease-in-out;
    }

    input:focus, select:focus {
        border-color: #007bff;
        outline: none;
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
    }

    /* Button Styling */
    .button-container {
        text-align: center;
        margin-top: 20px;
    }

    input[type="submit"], input[type="reset"] {
        padding: 10px 25px;
        font-size: 14px;
        margin: 10px;
        border: none;
        border-radius: 5px;
        background-color: #007bff;
        color: #fff;
        cursor: pointer;
        transition: background-color 0.3s ease-in-out;
    }

    input[type="submit"]:hover, input[type="reset"]:hover {
        background-color: #0056b3;
    }


</style>

</head>

<body>
    <!-- Include Sidebar -->
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

        <!-- Main Content Section -->
<div class="main p-3">
    <div class="text-center">
        <h3><u>Citizen Registration</u></h3>
        <div class="form-container">
            <form method="post" action="insertcitizen" id="registrationForm">
                <table>
                    <tr>
                        <td><label for="firstName">First Name</label></td>
                        <td>
                            <input type="text" id="firstName" name="firstName" required />
                            <small class="error" id="firstNameError"></small>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="lastName">Last Name</label></td>
                        <td>
                            <input type="text" id="lastName" name="lastName" required />
                            <small class="error" id="lastNameError"></small>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="email">Email</label></td>
                        <td>
                            <input type="email" id="email" name="email" required />
                            <small class="error" id="emailError"></small>
                        </td>
                    </tr>
                    <tr>
    <td><label for="password">Password</label></td>
    <td>
        <input type="password" id="password" name="password" required />
        <meter max="4" id="passwordStrength" style="display: block; width: 100%; margin-top: 5px;"></meter>
        <div class="feedback" id="passwordFeedback"></div>
    </td>
</tr>
                    <tr>
                        <td><label for="address">Address</label></td>
                        <td>
                            <input type="text" id="address" name="address" required />
                            <small class="error" id="addressError"></small>
                        </td>
                    </tr>
                  <tr>
    <td><label for="contact">Contact</label></td>
    <td>
        <div style="display: flex; align-items: center;">
            <span style="padding: 8px 12px; background-color: #f1f1f1; border: 1px solid #ccc; border-radius: 4px 0 0 4px;">+91</span>
            <input 
                type="text" 
                id="contact" 
                name="contact" 
                placeholder="Enter 10-digit number starting with 6-9" 
                pattern="[6-9][0-9]{9}" 
                maxlength="10" 
                required 
                style="border-radius: 0 4px 4px 0; border-left: none; width: 100%;"
            />
        </div>
        <small class="error" id="contactError"></small>
        
    </td>
</tr>

              <tr>
    <td><label for="aadharNumber">Aadhar Number</label></td>
    <td>
        <input type="text" id="aadharNumber" name="aadharNumber" pattern="\d{12}" required />
        <div class="error" id="aadharError"></div>
    </td>
</tr>
                    <tr>
    <td><label for="constituency">Select Constituency</label></td>
    <td>
        <select id="constituency" name="constituency" class="form-control" required>
            <option value="">---Select Constituency---</option>
            <c:forEach var="constituency" items="${constituencies}">
                <option value="${constituency.name}">${constituency.name}</option>
            </c:forEach>
        </select>
        <small class="error" id="constituencyError"></small>
    </td>
</tr>
                    <tr>
                        <td><label for="gender">Gender</label></td>
                        <td>
                            <input type="radio" id="male" name="gender" value="MALE" required />
                            <label for="male">Male</label>
                            <input type="radio" id="female" name="gender" value="FEMALE" required />
                            <label for="female">Female</label>
                            <input type="radio" id="others" name="gender" value="OTHERS" required />
                            <label for="others">Others</label>
                            <small class="error" id="genderError"></small>
                        </td>
                    </tr>
                   <tr>
    <td><label for="maritalStatus">Marital Status</label></td>
    <td>
        <select id="maritalStatus" name="maritalStatus" class="form-control" required>
            <option value="">---Select Marital Status---</option>
            <option value="Single">Single</option>
            <option value="Married">Married</option>
            <option value="Divorced">Divorced</option>
            <option value="Widowed">Widowed</option>
        </select>
        <small class="error" id="maritalStatusError"></small>
    </td>
</tr>
                    <tr>
    <td><label for="dateOfBirth">Date of Birth</label></td>
    <td>
        <input type="date" id="dateOfBirth" name="dateOfBirth" class="form-control" required />
        <small class="error" id="dobError"></small>
    </td>
</tr>
                        <td colspan="2" class="button-container">
                            <input type="submit" value="Register" />
                            <input type="reset" value="Clear" />
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<script>
    document.getElementById('password').addEventListener('input', function () {
        const password = this.value;
        const strengthMeter = document.getElementById('passwordStrength');
        const feedback = document.getElementById('passwordFeedback');
        let strength = 0;

        if (/[a-z]/.test(password)) strength++; 
        if (/[A-Z]/.test(password)) strength++; 
        if (/[0-9]/.test(password)) strength++; 
        if (/[@$!%*?&#]/.test(password)) strength++; 

        strengthMeter.value = strength;

        if (strength === 0) feedback.textContent = "Too weak";
        else if (strength === 1) feedback.textContent = "Weak";
        else if (strength === 2) feedback.textContent = "Moderate";
        else if (strength === 3) feedback.textContent = "Strong";
        else feedback.textContent = "Very Strong";
    });

    document.getElementById('email').addEventListener('input', function () {
        const email = this.value;
        const error = document.getElementById('emailError');
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!emailRegex.test(email)) {
            error.textContent = "Invalid email format.";
        } else {
            error.textContent = "";
        }
    });
    document.getElementById('aadharNumber').addEventListener('input', function () {
        const aadhar = this.value;
        const error = document.getElementById('aadharError');

        if (aadhar.length < 12) {
            error.textContent = "Aadhar number must be exactly 12 digits.";
        } else if (!/^\d{12}$/.test(aadhar)) {
            error.textContent = "Aadhar number can only contain digits.";
        } else {
            error.textContent = ""; 
        }
    });
    document.getElementById('contact').addEventListener('input', function () {
        const contact = this.value;
        const error = document.getElementById('contactError');

        if (!/^[6-9][0-9]{9}$/.test(contact)) {
            error.textContent = "Invalid contact number. It must start with 6-9 and have 10 digits.";
        } else {
            error.textContent = "";
        }
    });

</script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
        <script src="script.js"></script>
    </body>

</html>
