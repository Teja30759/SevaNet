package com.klef.jfsd.springboot.sevanet.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "party_table")
public class Party 
{
	 @Id
	 @Column(name = "party_name", length = 50)
	 private String name;

	 public String getName() {
		 return name;
	 }

    public void setName(String name) {
        this.name = name;
    }
}
