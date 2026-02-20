package servlet.admin;

import dao.RentalDAO;
import model.Rental;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;

import java.io.IOException;
import java.util.List;

@WebServlet("/viewRentals")
public class ViewRentalsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        if (req.getSession().getAttribute("admin") == null) {
            res.sendRedirect("admin/admin-login.jsp");
            return;
        }

        try {
            List<Rental> rentals = RentalDAO.getAllRentals();
            req.setAttribute("rentals", rentals);
            req.getRequestDispatcher("/admin/view-rentals.jsp")
               .forward(req, res);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
