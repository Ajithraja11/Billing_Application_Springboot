package com.example.demo.dao;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Paint;

@Service
public class PaintBillDaoImplementation {
	 //Paint table DAO implementation
	@Autowired
	private PaintBillDao paintNewBillDao;
	
	public void updatebill(Paint thePaint) {
		paintNewBillDao.save(thePaint);
	}

	public Paint getbillPaint(int receipt) {
		
		//retrieves a order details by using receipt as primary key
		Optional<Paint> result=paintNewBillDao.findById(receipt);
		
		//checks if there is any row exists for the given receipt
		if(!result.isPresent())
		{
			System.out.println("inside null check");
			Paint check=new Paint();
			check.setId(-1);
			return check;
		}
		Paint thePaint=result.get();
		return thePaint;
	}

}
