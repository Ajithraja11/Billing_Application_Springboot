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
@Table(name="paint")
public class Paint {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	int id;
	
	@NotNull(message="is required")
	@Max(value=10,message="must be less than 10")
	@Column(name="size30ml")
	Integer size30ml;
	
	@NotNull(message="is required")
	@Max(value=10,message="must be less than 10")
	@Column(name="size100ml")
	Integer size100ml;
	
	@NotNull(message="is required")
	@Max(value=10,message="must be less than 10")
	@Column(name="size500ml")
	Integer size500ml;
	
	@NotNull(message="is required")
	@Max(value=10,message="must be less than 10")
	@Column(name="size1l")
	Integer size1l;
	
	@Pattern(regexp="[a-zA-Z]+",message="only characters")
	@NotNull(message="is required") 
	@Size(min=1,message="is required")
	@Column(name="customer_name")
	String customer_name;
	
	public Paint() {}
	
	public Paint( Integer size30ml, Integer size100ml, Integer size500ml, 
			Integer size1l, String customer_name) {
		
		this.size30ml = size30ml;
		this.size100ml = size100ml;
		this.size500ml = size500ml;
		this.size1l = size1l;
		this.customer_name = customer_name;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public Integer getSize30ml() {
		return size30ml;
	}
	public void setSize30ml(Integer size30ml) {
		this.size30ml = size30ml;
	}
	public Integer getSize100ml() {
		return size100ml;
	}
	public void setSize100ml(Integer size100ml) {
		this.size100ml = size100ml;
	}
	public Integer getSize500ml() {
		return size500ml;
	}
	public void setSize500ml(Integer size500ml) {
		this.size500ml = size500ml;
	}
	public Integer getSize1l() {
		return size1l;
	}
	public void setSize1l(Integer size1l) {
		this.size1l = size1l;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public Integer getPrice500ml() {return 140;}
	public Integer getTotalprice500ml() {return size500ml*getPrice500ml(); }
	public Integer getPrice100ml() {return 80;}
	public Integer getTotalprice100ml() {return size100ml*getPrice100ml(); }
	public Integer getPrice30ml() {return 30;}
	public Integer getTotalprice30ml() {return size30ml*getPrice30ml(); }
	public Integer getPrice1l() {return 220;}
	public Integer getTotalprice1l() {return size1l*getPrice1l(); }
	public int getTotalAmount()
	{
		
		return getTotalprice30ml() +getTotalprice100ml() +getTotalprice500ml() +getTotalprice1l();
	}
}

