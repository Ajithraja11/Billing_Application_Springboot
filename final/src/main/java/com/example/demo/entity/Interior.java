package com.example.demo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
@Table(name="interior")
public class Interior {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	int id;
	
	@NotNull(message="is required")
	@Max(value=10,message="must be less than 10")
	@Column(name="door")
	Integer numberOfDoor;
	
	@NotNull(message="is required")
	@Max(value=10,message="must be less than 10")
	@Column(name="fan")
	Integer numberOfFan;

	@NotNull(message="is required")
	@Max(value=50,message="must be less than 50")
	@Column(name="light")
	Integer numberOfLight;
	
	@NotNull(message="is required")
	@Max(value=50,message="must be less than 50")
	@Column(name="marbel")
	Integer numberOfMarbel;
	
	@Pattern(regexp="[a-zA-Z]+",message="only characters")
	@NotNull(message="is required") 
	@Size(min=1,message="is required")
	@Column(name="customer_name")
	String customer_name;
	
	public Interior() {}
	
	public Interior( Integer numberOfDoor, Integer numberOfFan, 
			Integer numberOfLight, Integer numberOfMarbel,
			String customer_name) {

		this.numberOfDoor = numberOfDoor;
		this.numberOfFan = numberOfFan;
		this.numberOfLight = numberOfLight;
		this.numberOfMarbel = numberOfMarbel;
		this.customer_name = customer_name;
	}
	
	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	
	public Integer getNumberOfDoor() {
		return numberOfDoor;
	}
	public void setNumberOfDoor(Integer numberOfDoor) {
		this.numberOfDoor = numberOfDoor;
	}
	public Integer getNumberOfFan() {
		return numberOfFan;
	}
	public void setNumberOfFan(Integer numberOfFan) {
		this.numberOfFan = numberOfFan;
	}
	public Integer getNumberOfLight() {
		return numberOfLight;
	}
	public void setNumberOfLight(Integer numberOfLight) {
		this.numberOfLight = numberOfLight;
	}
	public Integer getNumberOfMarbel() {
		return numberOfMarbel;
	}
	public void setNumberOfMarbel(Integer numberOfMarbel) {
		this.numberOfMarbel = numberOfMarbel;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public Integer getPerMarblePrice () { return 45;}
	public Integer getTotalMarblePrice () { return numberOfMarbel*getPerMarblePrice();}
	public Integer getPerDoorPrice () { return 1200;}
	public Integer getTotalDoorPrice () { return numberOfDoor*getPerDoorPrice();}
	public Integer getPerLightPrice () { return 60;}
	public Integer getTotalLightPrice () { return numberOfLight*getPerLightPrice();}
	public Integer getPerFanPrice () { return 450;}
	public Integer getTotalFanPrice () { return numberOfFan*getPerFanPrice();}
	public int getTotalAmount()
	{
		
		return getTotalDoorPrice () + getTotalFanPrice () + getTotalLightPrice () + getTotalMarblePrice ();
	}
		
}

