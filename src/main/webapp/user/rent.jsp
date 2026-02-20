<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Rent Car</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>
<div class="container mt-5">
<div class="row justify-content-center">
<div class="col-md-5">

<div class="card shadow p-4">
<h3 class="text-center mb-3">🚘 Rent a Car</h3>

<form action="${pageContext.request.contextPath}/rent" method="post">

<div class="mb-3">
<label class="form-label">Customer Name</label>
<input type="text" name="name" class="form-control" required>
</div>

<div class="mb-3">
<label class="form-label">Car ID</label>
<input type="text" name="carId" class="form-control"
       value="<%= request.getParameter("carId") != null ? request.getParameter("carId") : "" %>"
       required>
</div>

<div class="mb-3">
<label class="form-label">Rental Days</label>
<input type="number" name="days" min="1" class="form-control" required>
</div>

<button class="btn btn-success w-100">Confirm Rent</button>

</form>
</div>

</div>
</div>
</div>
</body>
</html>
