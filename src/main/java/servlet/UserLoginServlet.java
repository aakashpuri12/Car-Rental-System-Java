package servlet;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/userLogin")
public class UserLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        try {
            if (UserDAO.validateUser(username, password)) {

                HttpSession session = req.getSession();
                session.setAttribute("role", "USER");
                session.setAttribute("username", username);

                res.sendRedirect(req.getContextPath() + "/home");

            } else {
                res.sendRedirect(req.getContextPath() + "/user/user-login.jsp?error=true");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
