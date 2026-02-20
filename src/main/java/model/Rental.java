package model;

public class Rental {
    private int rentalId;
    private String carId;
    private int customerId;
    private String customerName;
    private int rentalDays;

    public Rental(int rentalId, String carId, int customerId, String customerName, int rentalDays) {
        this.rentalId = rentalId;
        this.carId = carId;
        this.customerId = customerId;
        this.customerName = customerName;
        this.rentalDays = rentalDays;
    }

    public int getRentalId() { return rentalId; }
    public String getCarId() { return carId; }
    public int getCustomerId() { return customerId; }
    public String getCustomerName() { return customerName; }
    public int getRentalDays() { return rentalDays; }
}
