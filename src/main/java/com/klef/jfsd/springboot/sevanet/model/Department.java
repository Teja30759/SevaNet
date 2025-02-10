package com.klef.jfsd.springboot.sevanet.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "department_table")
public class Department {
	
	    @Id
	    @Column(name = "Depid",length = 50,nullable = false,unique = true)
	    private String Departmentid;
	    
	    @Column(name = "dname",length = 50,nullable = false)
	    private String name;
	    
	    @Column(name = "pconstituency",nullable = false,length = 50)
	    private String constituency;

	    @Column(name = "ddescription",length = 150,nullable = false)
	    private String description;

	    @Column(name = "dcontact_email",length = 50,nullable = false)
	    private String contactEmail;

	    @Column(name = "dpassword",length = 50,nullable = false)
	    private String password;

		

		public String getDepartmentid() {
			return Departmentid;
		}

		public void setDepartmentid(String departmentid) {
			Departmentid = departmentid;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getConstituency() {
			return constituency;
		}

		public void setConstituency(String constituency) {
			this.constituency = constituency;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public String getContactEmail() {
			return contactEmail;
		}

		public void setContactEmail(String contactEmail) {
			this.contactEmail = contactEmail;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

	

}
