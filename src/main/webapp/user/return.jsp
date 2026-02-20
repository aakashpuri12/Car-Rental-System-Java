<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Return Car</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>
<div class="container mt-5">
<div class="row justify-content-center">
<div class="col-md-4">

<div class="card shadow p-4">
<h4 class="text-center mb-3">🔄 Return Car</h4>

<form action="${pageContext.request.contextPath}/return" method="post">

<div class="mb-3">
<label class="form-label">Car ID</label>
<input type="text" name="carId" class="form-control" required>
</div>

<button class="btn btn-danger w-100">Return</button>

</form>
</div>

</div>
</div>
</div>
</body>
</html>
