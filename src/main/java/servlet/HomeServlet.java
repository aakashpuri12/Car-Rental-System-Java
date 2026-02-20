package servlet;

import java.io.IOException;
import java.util.List;

import dao.CarDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Car;



@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            List<Car> cars = CarDAO.getAvailableCars();
            req.setAttribute("cars", cars);
            req.getRequestDispatcher("/user/index.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

