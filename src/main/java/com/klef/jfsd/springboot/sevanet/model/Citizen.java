package com.klef.jfsd.springboot.sevanet.model;

import java.util.Date;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "citizen_table")
public class Citizen 
{
    @Id
    @Column(name = "citizen_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "citizen_firstname", nullable = false, length = 50)
    private String firstname;

    @Column(name = "citizen_lastname", nullable = false, length = 50)
    private String lastname;

    @Column(name = "citizen_email", nullable = false, unique = true, length = 50)
    private String email;

    @Column(name = "citizen_password", nullable = false)
    private String password;

    @Column(name = "citizen_address", nullable = false)
    private String address;

    @Column(name = "citizen_contact", nullable = false, unique = true)
    private String contact;

    @Column(name = "citizen_aadharnumber", nullable = false, unique = true)
    private String aadharnumber;

    @Column(name = "citizen_constituency", nullable = false, length = 50)
    private String constituency;

    @Column(name = "citizen_dob",nullable =false)
    private Date dateofbirth;

    @Column(name = "citizen_maritalstatus",nullable = false, length = 20)
    private String maritalstatus;

    @Column(name = "citizen_gender",nullable = false, length = 10)
    private String gender;

    @Column(name = "citizen_status", length = 20)
    private String status;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getAadharnumber() {
		return aadharnumber;
	}

	public void setAadharnumber(String aadharnumber) {
		this.aadharnumber = aadharnumber;
	}

	public String getConstituency() {
		return constituency;
	}

	public void setConstituency(String constituency) {
		this.constituency = constituency;
	}

	public Date getDateofbirth() {
		return dateofbirth;
	}

	public void setDateofbirth(Date dateofbirth) {
		this.dateofbirth = dateofbirth;
	}

	public String getMaritalstatus() {
		return maritalstatus;
	}

	public void setMaritalstatus(String maritalstatus) {
		this.maritalstatus = maritalstatus;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

   
   
}
