// Issue Car Bean
package com.ecar.beans;

import java.sql.Date;

public class IssueCarBean {

	private String carId, customerId,customerName,licenseNumber;
	private long customerMobile;
	private Date issuedDate;
	private String returnStatus;
	
	public IssueCarBean(){
		
	}

	
	public IssueCarBean(String carId, String customerId, String customerName, String licenseNumber,
			long customerMobile) {
		this.carId = carId;
		this.customerId = customerId;
		this.customerName = customerName;
		this.licenseNumber = licenseNumber;
		this.customerMobile = customerMobile;
	}


	public String getCarId() {
		return carId;
	}

	public void setCarId(String carId) {
		this.carId = carId;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getLicenseNumber() {
		return licenseNumber;
	}

	public void setLicenseNumber(String licenseNumber) {
		this.licenseNumber = licenseNumber;
	}

	public long getCustomerMobile() {
		return customerMobile;
	}

	public void setCustomerMobile(long customerMobile) {
		this.customerMobile = customerMobile;
	}

	public Date getIssuedDate() {
		return issuedDate;
	}

	public void setIssuedDate(Date issuedDate) {
		this.issuedDate = issuedDate;
	}

	public String getReturnStatus() {
		return returnStatus;
	}

	public void setReturnStatus(String returnStatus) {
		this.returnStatus = returnStatus;
	}
	
	
	
	
}

