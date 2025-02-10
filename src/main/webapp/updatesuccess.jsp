<!-- updatesuccess.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Success</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: #212529;
            margin: 0;
            padding: 0;
        }

        .container {
            text-align: center;
            margin-top: 10%;
            padding: 20px;
            background-color: #ffffff;
            border: 1px solid #dee2e6;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            max-width: 500px;
            margin-left: auto;
            margin-right: auto;
        }

        h2 {
            color: #198754; /* Success green color */
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            text-decoration: none;
            color: #fff;
            background-color: #007bff; /* Blue button */
            border-radius: 5px;
            transition: background-color 0.3s ease-in-out;
        }

        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>${message}</h2>
        <a href="citizenprofile">Back to Profile</a>
    </div>
</body>
</html>
