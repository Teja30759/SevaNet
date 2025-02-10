<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SevaNet</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
          crossorigin="anonymous">
    <link rel="icon" type="image/png" href="fevi.png">
    <style>
        /* Global Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f6f9;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .message-container {
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 40px;
            text-align: center;
            max-width: 600px;
            width: 100%;
            border-top: 4px solid #0078D4;
        }

        .message-container a {
            display: inline-block;
            margin-top: 30px;
            text-decoration: none;
            font-weight: 600;
            color: #fff;
            background-color: #0078D4;
            padding: 12px 25px;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .message-container a:hover {
            background-color: #005A9C;
        }

        .message {
            font-size: 20px;
            font-weight: 600;
            color: #333;
            margin-bottom: 20px;
        }

        h1 {
            font-size: 24px;
            color: #0078D4;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .footer {
            font-size: 14px;
            color: #555;
            margin-top: 30px;
        }

        .footer a {
            color: #0078D4;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="message-container">
        <h1>SevaNet - Citizen Portal</h1>
        <p class="message">${message}</p>
        <a href="addissue">Back to Report Issue</a>
       
    </div>
</body>
</html>
