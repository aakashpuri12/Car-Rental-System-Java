<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/navbar.jsp" %>


<%
if (session.getAttribute("admin") == null) {
    response.sendRedirect(request.getContextPath() + "/admin/admin-login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Add Car</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>
<div class="container mt-5">
<div class="row justify-content-center">
<div class="col-md-5">

<div class="card shadow p-4">
<h3 class="text-center mb-3">➕ Add New Car</h3>

<form action="${pageContext.request.contextPath}/addCar" method="post">

<input class="form-control mb-3" name="carId" placeholder="Car ID" required>
<input class="form-control mb-3" name="brand" placeholder="Brand" required>
<input class="form-control mb-3" name="model" placeholder="Model" required>
<input class="form-control mb-3" name="pricePerDay" placeholder="Price Per Day" type="number" required>

<button class="btn btn-success w-100">Add Car</button>

</form>
</div>

</div>
</div>
</div>
</body>
</html>
