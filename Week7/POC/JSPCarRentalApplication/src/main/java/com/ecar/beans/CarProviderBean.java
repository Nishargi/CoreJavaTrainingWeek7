// Car Provider Bean
package com.ecar.beans;

public class CarProviderBean {

	private int id;
	private String fullName,email,password;
	private String  mobile;
	
	public CarProviderBean()
	{
		
	}

	public CarProviderBean(int id, String fullName, String email, String password, String mobile) {
		this.id = id;
		this.fullName = fullName;
		this.email = email;
		this.password = password;
		this.mobile = mobile;
	}

	public CarProviderBean(String fullName, String email, String password, String mobile) {
		this.fullName = fullName;
		this.email = email;
		this.password = password;
		this.mobile = mobile;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	
}
