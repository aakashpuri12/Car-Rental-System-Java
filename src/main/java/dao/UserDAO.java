package dao;

import java.sql.*;

public class UserDAO {

    public static boolean validateUser(String username, String password) throws Exception {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
            "SELECT * FROM user WHERE username=? AND password=?"
        );
        ps.setString(1, username);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();
        return rs.next();
    }
}
