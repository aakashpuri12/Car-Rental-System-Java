<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, model.Rental" %>
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
<title>View Rentals</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body>
<div class="container mt-5">

<h3 class="mb-3">📑 All Rentals</h3>

<table class="table table-dark table-striped text-center">
<thead>
<tr>
    <th>Rental ID</th>
    <th>Car ID</th>
    <th>Customer ID</th>
    <th>Customer Name</th>
    <th>Days</th>
</tr>
</thead>

<tbody>
<%
List<Rental> rentals = (List<Rental>) request.getAttribute("rentals");

if (rentals == null || rentals.isEmpty()) {
%>
<tr>
    <td colspan="5">No rentals found</td>
</tr>
<%
} else {
    for (Rental r : rentals) {
%>
<tr>
    <td><%= r.getRentalId() %></td>
    <td><%= r.getCarId() %></td>
    <td><%= r.getCustomerId() %></td>
    <td><%= r.getCustomerName() %></td>
    <td><%= r.getRentalDays() %></td>
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
