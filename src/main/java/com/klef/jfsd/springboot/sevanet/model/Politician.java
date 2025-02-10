package com.klef.jfsd.springboot.sevanet.model;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "politician_table")
public class Politician 
{
	    @Id
	    @GeneratedValue(strategy = GenerationType.AUTO)
	    @Column(name = "pid")
	    private int id;

	    @Column(name = "pname",nullable = false,length = 50)
	    private String name;

	    @Column(name = "pparty",nullable = false,length = 50)
	    private String party;

	    @Column(name = "pconstituency",nullable = false,length = 50,unique = true)
	    private String constituency;

	    @Column(name = "pposition",nullable = false,length = 50)
	    private String position;

	    @Column(name = "pcontact_info",nullable = false,length = 100)
	    private String contactInfo;
	    

	    @Column(name = "ppassword",nullable = false,length = 20)
	    private String password;

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getParty() {
			return party;
		}

		public void setParty(String party) {
			this.party = party;
		}

		public String getConstituency() {
			return constituency;
		}

		public void setConstituency(String constituency) {
			this.constituency = constituency;
		}

		public String getPosition() {
			return position;
		}

		public void setPosition(String position) {
			this.position = position;
		}

		public String getContactInfo() {
			return contactInfo;
		}

		public void setContactInfo(String contactInfo) {
			this.contactInfo = contactInfo;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

}
