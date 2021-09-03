// Car Bean
package com.ecar.beans;

public class CarBean {

	private String carId,modelName,manufacturingYear;
	private float mileage;
	private int seatingcapacity,pricePerDay,quantity,issued;
	
	public CarBean()
	{
		
	}

	public CarBean(String carId, String modelName, String manufacturingYear, float mileage, int seatingcapacity,
			int pricePerDay, int quantity) {
		this.carId = carId;
		this.modelName = modelName;
		this.manufacturingYear = manufacturingYear;
		this.mileage = mileage;
		this.seatingcapacity = seatingcapacity;
		this.pricePerDay = pricePerDay;
		this.quantity = quantity;
		
	}

	public String getCarId() {
		return carId;
	}

	public void setCarId(String carId) {
		this.carId = carId;
	}

	public String getModelName() {
		return modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName;
	}

	public String getManufacturingYear() {
		return manufacturingYear;
	}

	public void setManufacturingYear(String manufacturingYear) {
		this.manufacturingYear = manufacturingYear;
	}

	public float getMileage() {
		return mileage;
	}

	public void setMileage(float mileage) {
		this.mileage = mileage;
	}

	public int getSeatingcapacity() {
		return seatingcapacity;
	}

	public void setSeatingcapacity(int seatingcapacity) {
		this.seatingcapacity = seatingcapacity;
	}

	public int getPricePerDay() {
		return pricePerDay;
	}

	public void setPricePerDay(int pricePerDay) {
		this.pricePerDay = pricePerDay;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getIssued() {
		return issued;
	}

	public void setIssued(int issued) {
		this.issued = issued;
	}	
}
