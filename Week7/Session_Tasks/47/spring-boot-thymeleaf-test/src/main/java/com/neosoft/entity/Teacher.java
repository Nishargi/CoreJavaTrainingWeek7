//47) 

package com.neosoft.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name = "teachers")
public class Teacher {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "first_name",nullable = false)
	private String firstName;
	
	@Column(name = "last_name")
	private String lastName;
	
	@Column(name = "mobile_number")
	private String mobileNumber;
	
	@Column(name = "email")
	private String emailId;
	
	@Column(name = "city")
	private String cityName;
	
	@Column(name = "state")
	private String stateName;
	
	@Column(name = "pin_code")
	private String pinCode;
}

