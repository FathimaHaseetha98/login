<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<style>
body {
    background: #2c2c54;
    font-family: Arial;
}
.box {
    width: 300px;
    margin: 150px auto;
    padding: 25px;
    background: #40407a;
    border-radius: 10px;
    text-align: center;
    color: white;
}
input, button {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border-radius: 5px;
    border: none;
}
button {
    background: #706fd3;
    color: white;
}
.error {
    color: #ffb3b3;
}
.link {
    margin-top: 10px;
    font-size: 14px;
}
.link a {
    color: #dcdcff;
    text-decoration: none;
}
.link a:hover {
    text-decoration: underline;
}
</style>
</head>

<body>

<div class="box">
<h2>Login</h2>

<form action="LoginServlet" method="post">
    <input type="text" name="username" placeholder="Username" required>
    <input type="password" name="password" placeholder="Password" required>
    <button type="submit">Login</button>
</form>

<%
    if (request.getParameter("error") != null) {
%>
    <div class="error">Invalid Username or Password</div>
<%
    }
%>

<!-- ✅ Register link -->
<div class="link">
    Don’t have an account? <a href="register.jsp">Register</a>
</div>

</div>

</body>
</html>
