<%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 17/10/2023
  Time: 08:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="style/main.css">
</head>
<body class="auth-body">
<div class="container">
    <h1 class="page-title">LOG IN</h1>
    <div class="content">
        <div class="motto-container" >
            <h1>We mange<br>You<br>thrive</h1>
        </div>
        <div class="form-container">
            <div>
                <h1>Don’t have an account ? </h1>
                <a href="/views/signup.jsp">SIGN UP</a>
            </div>
            <form method="post" action="EmployeeServlet">
                <input name="email" type="email" placeholder="Email" value="${sessionScope.email}" required>
                <input name="password" type="password" placeholder="Password" required>
                <button type="submit">SUBMIT</button>
                <div class="error" >
                    ${sessionScope.error}
                </div>
            </form>
        </div>
    </div>
    <h1 class="app-name">RESOURCIUM OPTIMA</h1>
</div>

</body>
</html>
