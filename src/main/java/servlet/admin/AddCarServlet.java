package servlet.admin;

import dao.CarDAO;
import model.Car;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/addCar")
public class AddCarServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        try {
            Car car = new Car(
                req.getParameter("carId"),
                req.getParameter("brand"),
                req.getParameter("model"),
                Double.parseDouble(req.getParameter("pricePerDay")),
                true
            );

            CarDAO.addCar(car);
            res.sendRedirect("adminDashboard");

        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("admin/add-car.jsp?error=true");
        }
    }
}
