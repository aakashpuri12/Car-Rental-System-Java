<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Admin Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body class="bg-light">
<div class="container mt-5">
<div class="row justify-content-center">
<div class="col-md-4">

<div class="card shadow p-4">
<h3 class="text-center mb-3">🔐 Admin Login</h3>

<form action="${pageContext.request.contextPath}/adminLogin" method="post">

<div class="mb-3">
<label class="form-label">Username</label>
<input type="text" name="username" class="form-control" required>
</div>

<div class="mb-3">
<label class="form-label">Password</label>
<input type="password" name="password" class="form-control" required>
</div>

<button class="btn btn-dark w-100">Login</button>

<%
if (request.getParameter("error") != null) {
%>
<div class="alert alert-danger mt-3 text-center">
Invalid credentials
</div>
<%
}
%>

</form>
</div>

</div>
</div>
</div>
</body>
</html>
