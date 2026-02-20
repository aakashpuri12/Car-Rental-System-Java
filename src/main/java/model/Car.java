package model;

public class Car {
    private String carId;
    private String brand;
    private String model;
    private double pricePerDay;
    private boolean available;

    public Car(String carId, String brand, String model, double pricePerDay, boolean available) {
        this.carId = carId;
        this.brand = brand;
        this.model = model;
        this.pricePerDay = pricePerDay;
        this.available = available;
    }

    public String getCarId() { return carId; }
    public String getBrand() { return brand; }
    public String getModel() { return model; }
    public double getPricePerDay() { return pricePerDay; }
    public boolean isAvailable() { return available; }
}
