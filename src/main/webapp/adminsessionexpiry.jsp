<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SESSION EXPIRED</title>
     <link rel="icon" type="image/png" href="fevi.png">
    <style>
        /* Container for success message */
        .container {
            text-align: center;
            background-color: #ffffff; /* White background */
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
            max-width: 600px;
            width: 100%;
            margin: 50px auto; /* Center the container on the page */
        }

        /* Success message header */
        h1 {
            font-size: 32px;
            color: #3a7bd5; /* Light blue to match gradient theme */
            margin-bottom: 20px;
            font-weight: bold;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1); /* Soft shadow for emphasis */
        }

        /* Paragraph text */
        p {
            font-size: 18px;
            color: #333; /* Dark gray for readability */
            margin-bottom: 30px;
        }

        /* Link button styling */
        a {
            display: inline-block;
            padding: 12px 25px;
            background-color: #3a7bd5; /* Blue button color */
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        /* Hover effect for link button */
        a:hover {
            background-color: #15537d; /* Darker blue on hover */
        }

        /* Responsive design for mobile */
        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }

            h1 {
                font-size: 28px;
            }

            p {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>OOPS ... !!! SESSION EXPIRED</h1>
        <br><br>
        <a href="adminlogin">LOGIN AGAIN</a>
    </div>
</body>
</html>

















