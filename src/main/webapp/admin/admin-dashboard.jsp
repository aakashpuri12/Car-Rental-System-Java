<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, model.Car" %>
<%@ include file="/common/navbar.jsp" %>

<%
/* 🔐 ADMIN AUTH CHECK */
String role = (String) session.getAttribute("role");
if (role == null || !"ADMIN".equals(role)) {
    response.sendRedirect(request.getContextPath() + "/admin/admin-login.jsp");
    return;
}
%>



<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">


</head>

<body>
<div class="container mt-5">

<div class="d-flex justify-content-between mb-3">
<h3>📋 Manage Cars</h3>
<div>
<a href="${pageContext.request.contextPath}/admin/add-car.jsp"
   class="btn btn-success me-2">Add Car</a>

<a href="${pageContext.request.contextPath}/viewRentals"
   class="btn btn-warning">View Rentals</a>
</div>
</div>

<table class="table table-dark table-striped text-center">
<thead>
<tr>
<th>Car ID</th>
<th>Brand</th>
<th>Model</th>
<th>Price / Day</th>
<th>Status</th>
<th>Action</th>
</tr>
</thead>

<tbody>
<%
List<Car> cars = (List<Car>) request.getAttribute("cars");

if (cars == null || cars.isEmpty()) {
%>
<tr><td colspan="6">No cars found</td></tr>
<%
} else {
    for (Car c : cars) {
%>
<tr>
<td><%= c.getCarId() %></td>
<td><%= c.getBrand() %></td>
<td><%= c.getModel() %></td>
<td>₹ <%= c.getPricePerDay() %></td>
<td>
<span class="badge <%= c.isAvailable() ? "bg-success" : "bg-danger" %>">
<%= c.isAvailable() ? "Available" : "Rented" %>
</span>
</td>
<td>
<% if (c.isAvailable()) { %>
<a href="${pageContext.request.contextPath}/deleteCar?carId=<%= c.getCarId() %>"
   class="btn btn-sm btn-danger"
   onclick="return confirm('Delete this car?');">
   Delete
</a>

<% } else { %>
<button class="btn btn-sm btn-secondary" disabled>Locked</button>
<% } %>
</td>
</tr>
<%
    }
}
%>
</tbody>
</table>

</div>
</body>
</html>
