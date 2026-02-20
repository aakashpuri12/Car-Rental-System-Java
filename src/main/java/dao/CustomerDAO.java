package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class CustomerDAO {

    public static int getOrCreateCustomer(String name) throws Exception {

        Connection con = DBConnection.getConnection();

        // Check existing
        PreparedStatement ps = con.prepareStatement(
            "SELECT customerId FROM customer WHERE name = ?"
        );
        ps.setString(1, name);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getInt("customerId");
        }

        // Insert new
        ps = con.prepareStatement(
            "INSERT INTO customer (name) VALUES (?)",
            Statement.RETURN_GENERATED_KEYS
        );
        ps.setString(1, name);
        ps.executeUpdate();

        rs = ps.getGeneratedKeys();
        rs.next();

        return rs.getInt(1);
    }
}
