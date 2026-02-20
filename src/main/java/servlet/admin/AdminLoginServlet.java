package servlet.admin;

import java.io.IOException;

import dao.AdminDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // ✅ Validate admin credentials
        if (AdminDAO.validateAdmin(username, password)) {

            HttpSession session = req.getSession();
            session.setAttribute("role", "ADMIN");
            session.setAttribute("admin", username);

            res.sendRedirect(req.getContextPath() + "/adminDashboard");

        } else {
            // ❌ Invalid login
            res.sendRedirect(req.getContextPath()
                    + "/admin/admin-login.jsp?error=true");
        }
    }
}
