package dao;

import java.sql.*;
import java.util.*;
import model.Car;

public class CarDAO {
	public static List<Car> getAvailableCars() throws Exception {
	    List<Car> list = new ArrayList<>();
	    Connection con = DBConnection.getConnection();

	    PreparedStatement ps = con.prepareStatement(
	        "SELECT * FROM car WHERE available = true"
	    );

	    ResultSet rs = ps.executeQuery();

	    while (rs.next()) {
	        list.add(new Car(
	            rs.getString("carId"),
	            rs.getString("brand"),
	            rs.getString("model"),
	            rs.getDouble("pricePerDay"),
	            rs.getBoolean("available")
	        ));
	    }
	    return list;
	}


    public static List<Car> getAllCars() throws Exception {
        List<Car> list = new ArrayList<>();
        Connection con = DBConnection.getConnection();
        ResultSet rs = con.prepareStatement("SELECT * FROM car").executeQuery();

        while (rs.next()) {
            list.add(new Car(
                rs.getString("carId"),
                rs.getString("brand"),
                rs.getString("model"),
                rs.getDouble("pricePerDay"),
                rs.getBoolean("available")
            ));
        }
        return list;
    }

    public static void addCar(Car car) throws Exception {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO car VALUES (?,?,?,?,?)");
        ps.setString(1, car.getCarId());
        ps.setString(2, car.getBrand());
        ps.setString(3, car.getModel());
        ps.setDouble(4, car.getPricePerDay());
        ps.setBoolean(5, true);
        ps.executeUpdate();
    }

    public static void deleteCar(String carId) throws Exception {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
            "DELETE FROM car WHERE carId=?");
        ps.setString(1, carId);
        ps.executeUpdate();
    }

    public static void updateAvailability(String carId, boolean status) throws Exception {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
            "UPDATE car SET available=? WHERE carId=?");
        ps.setBoolean(1, status);
        ps.setString(2, carId);
        ps.executeUpdate();
    }
}
