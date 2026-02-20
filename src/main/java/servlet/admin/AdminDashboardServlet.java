package servlet.admin;

import dao.CarDAO;
import model.Car;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;

import java.io.IOException;
import java.util.List;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        if (req.getSession().getAttribute("admin") == null) {
            res.sendRedirect("admin/admin-login.jsp");
            return;
        }

        try {
            List<Car> cars = CarDAO.getAllCars();
            req.setAttribute("cars", cars);
            req.getRequestDispatcher("/admin/admin-dashboard.jsp")
               .forward(req, res);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
