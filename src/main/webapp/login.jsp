<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Login | Car Rental System</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script>
function toggleLogin(role){
    document.getElementById("role").value = role;
    document.getElementById("title").innerText =
        role === 'ADMIN' ? 'Admin Login' : 'User Login';
}
</script>
</head>

<body class="bg-dark text-light">
<div class="container mt-5 col-md-4">

<h3 id="title" class="text-center mb-4">User Login</h3>

<form action="<%= request.getContextPath() %>/login" method="post">
    <input type="hidden" name="role" id="role" value="USER">

    <div class="mb-3">
        <label>Username</label>
        <input name="username" class="form-control" required>
    </div>

    <div class="mb-3">
        <label>Password</label>
        <input type="password" name="password" class="form-control" required>
    </div>

    <button class="btn btn-primary w-100">Login</button>
</form>

<div class="text-center mt-3">
    <button class="btn btn-sm btn-outline-warning"
            onclick="toggleLogin('ADMIN')">Login as Admin</button>
    <button class="btn btn-sm btn-outline-info"
            onclick="toggleLogin('USER')">Login as User</button>
</div>

<% if (request.getParameter("error") != null) { %>
<p class="text-danger text-center mt-2">Invalid credentials</p>
<% } %>

</div>
</body>
</html>
