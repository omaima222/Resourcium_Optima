

<%@page import="controllers.EmployeeServlet" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Signup</title>
    <link rel="stylesheet" type="text/css" href="style/main.css">
</head>
<body class="auth-body">
<div class="container">
    <h1 class="page-title">SIGN UP</h1>
    <div class="content">
        <div class="motto-container" >
            <h1>We mange<br>You<br>thrive</h1>
        </div>
        <div class="form-container signup">
            <form method="post" action="EmployeeServlet" >
                <input name="username" type="text" placeholder="Username" required>
                <input name="email" type="email" placeholder="Email" required>
                <input name="password" minlength="8" type="password" placeholder="Password" required>
                <button type="submit">SUBMIT</button>
            </form>
        </div>
    </div>
    <h1 class="app-name">RESOURCIUM OPTIMA</h1>
</div>

</body>
</html>