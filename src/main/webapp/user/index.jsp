<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, model.Car" %>
<%@ include file="/common/navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Car Rental | Home</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

</head>

<body>
<div class="container mt-5">

<h2 class="text-center mb-4">🚗 Available Cars</h2>

<div class="row">
<%
List<Car> cars = (List<Car>) request.getAttribute("cars");
if (cars == null || cars.isEmpty()) {
%>
  <div class="alert alert-warning text-center">No cars available</div>
<%
} else {
  for (Car car : cars) {
%>
  <div class="col-md-4 mb-4">
    <div class="card shadow">
      <div class="card-body">
        <h5 class="card-title"><%= car.getBrand() %> <%= car.getModel() %></h5>
        <p class="card-text">
          <strong>Car ID:</strong> <%= car.getCarId() %><br>
          <strong>Price / Day:</strong> ₹ <%= car.getPricePerDay() %>
        </p>
        <a href="${pageContext.request.contextPath}/user/rent.jsp?carId=<%= car.getCarId() %>"
           class="btn btn-primary w-100">Rent Now</a>
      </div>
    </div>
  </div>
<%
  }
}
%>
</div>
</div>
</body>
</html>
