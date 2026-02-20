package servlet;

import dao.CarDAO;
import dao.RentalDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/return")
public class ReturnCarServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) {
        try {
            String carId = req.getParameter("carId");

            RentalDAO.deleteRentalByCarId(carId);
            CarDAO.updateAvailability(carId, true);

            res.sendRedirect("home");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
