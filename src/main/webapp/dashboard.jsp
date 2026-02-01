<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            background: #2c2c54;
            font-family: Arial, sans-serif;
        }

        .dashboard {
            width: 350px;
            margin: 150px auto;
            background: #40407a;
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.4);
        }

        h2 {
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            background: #706fd3;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 15px;
        }

        a:hover {
            background: #5f5fc4;
        }
    </style>
</head>

<body>

<div class="dashboard">
    <h2>Welcome <%= user %></h2>
    <a href="LogoutServlet">Logout</a>
</div>

</body>
</html>
