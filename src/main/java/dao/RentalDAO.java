package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Rental;

public class RentalDAO {

    /* ================================
       ADD RENTAL
       ================================ */
    public static void addRental(String carId, String customerName, int rentalDays) throws Exception {

        int customerId = CustomerDAO.getOrCreateCustomer(customerName);

        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO rental (carId, customerId, rentalDays) VALUES (?, ?, ?)"
        );

        ps.setString(1, carId);
        ps.setInt(2, customerId);
        ps.setInt(3, rentalDays);

        ps.executeUpdate();
    }

    /* ================================
       DELETE RENTAL (RETURN CAR)
       ================================ */
    public static void deleteRentalByCarId(String carId) throws Exception {

        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
            "DELETE FROM rental WHERE carId = ?"
        );

        ps.setString(1, carId);
        ps.executeUpdate();
    }

    /* ================================
       VIEW ALL RENTALS (ADMIN)
       ================================ */
    public static List<Rental> getAllRentals() throws Exception {
        List<Rental> list = new ArrayList<>();

        Connection con = DBConnection.getConnection();
        String sql = """
            SELECT r.rentalId,
                   r.carId,
                   r.customerId,
                   c.name AS customerName,
                   r.rentalDays
            FROM rental r
            JOIN customer c ON r.customerId = c.customerId
        """;

        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            list.add(new Rental(
                rs.getInt("rentalId"),
                rs.getString("carId"),
                rs.getInt("customerId"),
                rs.getString("customerName"),
                rs.getInt("rentalDays")
            ));
        }
        return list;
    }

}
