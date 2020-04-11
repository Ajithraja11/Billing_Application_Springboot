package com.example.demo.dao;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Construction;

@Service
public class ConstructionBillDaoImplementation  {
													 //construction table DAO implementation
	@Autowired
	private ConstructionBillDao constructionNewBillDao;
	
	//saves an order to the database using JPA 
	public void updatebill(Construction theconstruction) {
		constructionNewBillDao.save(theconstruction);
	}

	public Construction getbillConstruction(int receipt) {
		
		//retrieves a order details by using receipt as primary key
		Optional<Construction> result=constructionNewBillDao.findById(receipt);
		
		//checks if there is any row exists for the given receipt
		if(!result.isPresent())
		{
			System.out.println("inside null check");
			Construction check=new Construction();
			check.setId(-1);
			return check;
		}
		
		Construction theCOnstruction=result.get();
		return theCOnstruction;
	}

													
}
