package servlet.admin;

import dao.CarDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/deleteCar")
public class DeleteCarServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        try {
            String carId = req.getParameter("carId");
            CarDAO.deleteCar(carId);
            res.sendRedirect("adminDashboard");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
