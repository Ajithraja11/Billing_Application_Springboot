package com.example.demo.dao;

import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Interior;

@Service
public class InteriorBillDaoImplementation {
	//Interior table DAO implementation
	@Autowired
	private InteriorBillDao interiorNewBillDao;
	//saves an order to the database using JPA 
	public void updatebill(Interior theInterior) {
		interiorNewBillDao.save(theInterior);
	}
	
	public Interior getbillInterior(int receipt) {
		
		//retrieves a order details by using receipt as primary key
		Optional<Interior> result=interiorNewBillDao.findById(receipt);
		
		//checks if there is any row exists for the given receipt
		if(!result.isPresent())
		{
			Interior check=new Interior();
			check.setId(-1);
			return check;
		}
		
		Interior theInterior=result.get();
		return theInterior;
	}
}