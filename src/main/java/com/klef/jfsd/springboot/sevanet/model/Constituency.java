package com.klef.jfsd.springboot.sevanet.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="constituency_table")
public class Constituency 
{ 
  @Id
  
  private int pincode;
  
  public int getPincode() {
	return pincode;
}

public void setPincode(int pincode) {
	this.pincode = pincode;
}

@Column(name ="constituency_name",length = 50)
  private String name;

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}
  

}
