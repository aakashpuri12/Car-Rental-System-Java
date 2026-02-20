package servlet;

import java.io.IOException;

import dao.AdminDAO;
import dao.UserDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    // 🔹 SHOW LOGIN PAGE
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {
        res.sendRedirect(req.getContextPath() + "/login.jsp");
    }

    // 🔹 PROCESS LOGIN
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        String role = req.getParameter("role"); // USER / ADMIN
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        HttpSession session = req.getSession();

        try {
            if ("ADMIN".equals(role)) {
                if (AdminDAO.validateAdmin(username, password)) {
                    session.setAttribute("role", "ADMIN");
                    session.setAttribute("admin", username);
                    res.sendRedirect(req.getContextPath() + "/adminDashboard");
                    return;
                }
            } else {
                if (UserDAO.validateUser(username, password)) {
                    session.setAttribute("role", "USER");
                    session.setAttribute("username", username);
                    res.sendRedirect(req.getContextPath() + "/home");
                    return;
                }
            }

            // ❌ Invalid credentials
            res.sendRedirect(req.getContextPath() + "/login.jsp?error=true");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
