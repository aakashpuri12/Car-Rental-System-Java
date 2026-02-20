<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
String userRole = (String) session.getAttribute("role");
String contextPath = request.getContextPath();
%>

<style>
body {
  background: linear-gradient(135deg,#0f2027,#203a43,#2c5364);
  color: white;
  min-height: 100vh;
}

.card {
  border-radius: 12px;
  box-shadow: 0 10px 30px rgba(0,0,0,.4);
}

.table {
  border-radius: 12px;
  overflow: hidden;
}

.btn {
  border-radius: 8px;
}


/* ===== NAVBAR ===== */
.navbar-main {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 14px 28px;
    background: linear-gradient(135deg, #1f2933, #111827);
    box-shadow: 0 6px 18px rgba(0,0,0,0.4);
}

.navbar-left {
    font-size: 20px;
    font-weight: bold;
    color: #ffffff;
}

.navbar-right a {
    margin-left: 14px;
    padding: 8px 14px;
    text-decoration: none;
    color: #e5e7eb;
    border-radius: 6px;
    transition: 0.3s;
}

.navbar-right a:hover {
    background-color: #374151;
}

.btn-admin {
    background-color: #facc15;
    color: #000 !important;
}

.btn-logout {
    background-color: #ef4444;
    color: #fff !important;
}

/* =========================
   MODERN NAVBAR BUTTON STYLES
   ========================= */

/* Common nav link style */
.navbar .nav-link {
    margin-left: 10px;
    padding: 8px 16px;
    border-radius: 25px;
    font-weight: 500;
    transition: all 0.3s ease;
}

/* USER buttons */
.navbar .nav-link[href*="/home"],
.navbar .nav-link[href*="/rent"],
.navbar .nav-link[href*="/return"] {
    background: linear-gradient(135deg, #2563eb, #3b82f6);
    color: #ffffff !important;
}

.navbar .nav-link[href*="/home"]:hover,
.navbar .nav-link[href*="/rent"]:hover,
.navbar .nav-link[href*="/return"]:hover {
    background: linear-gradient(135deg, #1e40af, #2563eb);
    transform: translateY(-1px);
}

/* ADMIN buttons */
.navbar .nav-link[href*="adminDashboard"],
.navbar .nav-link[href*="add-car"],
.navbar .nav-link[href*="viewRentals"] {
    background: linear-gradient(135deg, #f59e0b, #fbbf24);
    color: #111827 !important;
}

.navbar .nav-link[href*="adminDashboard"]:hover,
.navbar .nav-link[href*="add-car"]:hover,
.navbar .nav-link[href*="viewRentals"]:hover {
    background: linear-gradient(135deg, #d97706, #f59e0b);
    transform: translateY(-1px);
}

/* LOGIN buttons (guest) */
.navbar a[href*="login"] {
    background: linear-gradient(135deg, #10b981, #34d399);
    color: #064e3b !important;
    padding: 8px 16px;
    border-radius: 25px;
    margin-left: 10px;
}

.navbar a[href*="login"]:hover {
    background: linear-gradient(135deg, #059669, #10b981);
}

/* LOGOUT button */
.navbar .nav-link.text-danger {
    background: linear-gradient(135deg, #ef4444, #f87171);
    color: #ffffff !important;
}

.navbar .nav-link.text-danger:hover {
    background: linear-gradient(135deg, #dc2626, #ef4444);
    transform: translateY(-1px);
}


</style>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold" href="<%= contextPath %>/home">
      🚗 Car Rental System
    </a>

    <div class="collapse navbar-collapse justify-content-end">
      <ul class="navbar-nav mb-2 mb-lg-0">

        <!-- USER MENU -->
        <% if ("USER".equals(userRole)) { %>
          <li class="nav-item">
            <a class="nav-link" href="<%= contextPath %>/home">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%= contextPath %>/user/rent.jsp">Rent Car</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%= contextPath %>/user/return.jsp">Return Car</a>
          </li>
        <% } %>

        <!-- ADMIN MENU -->
        <% if ("ADMIN".equals(userRole)) { %>
          <li class="nav-item">
            <a class="nav-link" href="<%= contextPath %>/adminDashboard">Dashboard</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%= contextPath %>/admin/add-car.jsp">Add Car</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%= contextPath %>/viewRentals">View Rentals</a>
          </li>
        <% } %>

		<% if (userRole == null) { %>
    		<a href="<%= contextPath %>/user/user-login.jsp">User Login</a>
    		<a href="<%= contextPath %>/admin/admin-login.jsp">Admin Login</a>
		<% } %>
        <!-- LOGOUT -->
        
        <% if (userRole != null) { %>
    		<li class="nav-item">
        		<a class="nav-link text-danger fw-bold" href="<%= contextPath %>/logout">
           		Logout
        		</a>
    		</li>
		<% } %>
        

      </ul>
    </div>
  </div>
</nav>
