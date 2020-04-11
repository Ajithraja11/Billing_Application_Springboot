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
@Table(name="construction")
public class Construction {

	public Construction()
	{
		
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="transactionId")
	int id;
	
	@NotNull(message="is required")
	@Max(value=4,message="must be less than 5")
	@Column(name="sand")
	Integer sand_unit;
	
	@NotNull(message="is required")
	@Max(value=500,message="must be less than 500")
	@Column(name="brick6")
	Integer bricks_6;
	
	@NotNull(message="is required")
	@Max(value=500,message="must be less than 500")
	@Column(name="brick10")
	Integer bricks_10;
	
	@NotNull(message="is required")
	@Max(value=100,message="must be less than 100")
	@Column(name="cement")
	Integer cementBag;
	
	
	@Pattern(regexp="[a-zA-Z]+",message="only characters")
	@NotNull(message="is required")
	@Size(min=1,message="is required")
	@Column(name="customerName")
	String customer_name;
	
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Construction(Integer sand_unit, Integer bricks_6, Integer bricks_10, Integer cementBag) {
		
		this.sand_unit = sand_unit;
		this.bricks_6 = bricks_6;
		this.bricks_10 = bricks_10;
		this.cementBag = cementBag;
	}
	
	public Integer getSand_unit() {
		return sand_unit;
	}
	public void setSand_unit(Integer sand_unit) {
		this.sand_unit = sand_unit;
	}
	public Integer getBricks_6() {
		return bricks_6;
	}
	public void setBricks_6(Integer bricks_6) {
		this.bricks_6 = bricks_6;
	}
	public Integer getCementBag() {
		return cementBag;
	}
	public void setCementBag(Integer cementBag) {
		this.cementBag = cementBag;
	}
	public Integer getBricks_10() {
		return bricks_10;
	}
	public void setBricks_10(Integer bricks_10) {
		this.bricks_10 = bricks_10;
	}
	//setting individual prices
	//sand
	public Integer getSand_perunit_price() {
		return 2000;
	}
	public Integer getSand_price() {
		return sand_unit*getSand_perunit_price();
	}
	//cement
	public Integer getCement_perunit_price() {
		return 420;
	}
	public Integer getCement_price() {
		return cementBag*getCement_perunit_price();
	}
	//bricks10
	public Integer getBricks10_perunit_price() {
		return 21;
	}
	public Integer getBricks10_price() {
		return bricks_10*getBricks10_perunit_price();
	}
	//bricks6
	public Integer getBricks6_perunit_price() {
		return 15;
	}
	public Integer getBricks6_price() {
		return bricks_6*getBricks6_perunit_price();
	}
	public Integer getTotalAmount() {
	return   getSand_price() + getBricks6_price() + getBricks10_price() + getCement_price();
	}
	
}

