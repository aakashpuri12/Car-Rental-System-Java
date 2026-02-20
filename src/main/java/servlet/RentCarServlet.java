package servlet;

import dao.CarDAO;
import dao.RentalDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/rent")
public class RentCarServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) {
        try {
            String customerName = req.getParameter("name");
            String carId = req.getParameter("carId");
            int rentalDays = Integer.parseInt(req.getParameter("days"));

            RentalDAO.addRental(carId, customerName, rentalDays);
            CarDAO.updateAvailability(carId, false);

            res.sendRedirect("home");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
