<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<title>User Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-dark text-light">
<div class="container mt-5 col-md-4">

<h3 class="text-center mb-4">👤 User Login</h3>

<form action="<%= request.getContextPath() %>/userLogin" method="post">
  <div class="mb-3">
    <label>Username</label>
    <input type="text" name="username" class="form-control" required>
  </div>

  <div class="mb-3">
    <label>Password</label>
    <input type="password" name="password" class="form-control" required>
  </div>

  <button class="btn btn-primary w-100">Login</button>

  <% if (request.getParameter("error") != null) { %>
    <p class="text-danger text-center mt-3">Invalid credentials</p>
  <% } %>
</form>

</div>
</body>
</html>
