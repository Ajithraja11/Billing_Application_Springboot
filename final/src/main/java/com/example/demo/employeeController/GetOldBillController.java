package com.example.demo.employeeController;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.ConstructionBillDaoImplementation;
import com.example.demo.dao.InteriorBillDaoImplementation;
import com.example.demo.dao.PaintBillDaoImplementation;
import com.example.demo.entity.Construction;
import com.example.demo.entity.Interior;
import com.example.demo.entity.Paint;
import com.example.demo.entity.Receipt;

@Controller
@RequestMapping("/employee")
public class GetOldBillController {
	
	//Autowire for database access 
	@Autowired
	private ConstructionBillDaoImplementation newBillDaoImplementation;
	@Autowired
	private InteriorBillDaoImplementation newInteriorBillImplementation;
	@Autowired
	private PaintBillDaoImplementation newPaintBillImplementation;
	
	//form to get the receipt number to retrieve the order from database
	@RequestMapping("/constructionOldBill")
	public String getIDConstructioncontroller(Model theModel )
	{
		Receipt theReceipt=new Receipt();
		theModel.addAttribute("receipt",theReceipt);
		theModel.addAttribute("show",1);
		return "employee/constructionOldBill";
	}
	
	//get construction order from database using the receipt user provided.
	@PostMapping("/getConstructionBill")
	public String getOldConstructionBillcontroller( 
			@Valid @ModelAttribute("receipt") Receipt thereceipt,BindingResult theBindingResult, Model model)
	{
		if(theBindingResult.hasErrors())
		{
			model.addAttribute("show",1);
			return "employee/constructionOldBill";
		}
		
		Construction newConstruction=newBillDaoImplementation.getbillConstruction(thereceipt.getReceipt());
		if( newConstruction.getId()==-1 ) 
				{
			model.addAttribute("show",1);
			return "employee/constructionOldBill";}
			
		
		model.addAttribute("receiptNumber",thereceipt.getReceipt());
		model.addAttribute("name",newConstruction.getCustomer_name());
		Construction newonstruction=new Construction(newConstruction.getSand_unit(),
				newConstruction.getBricks_6(),newConstruction.getBricks_10(),
				newConstruction.getCementBag()
				);
		model.addAttribute("construction",newonstruction);
		
		return "employee/constructionOldBilldisplay";
		
	}
	
	//get Interior order from database using the receipt user provided.
	@RequestMapping("/getInteriorBill")
	public String getOldInteriorBillcontroller( 
			@Valid @ModelAttribute("receipt") Receipt thereceipt,BindingResult theBindingResult, Model model)
	{
		if(theBindingResult.hasErrors())
		{
			model.addAttribute("show",1);
			return "employee/interiorOldBill";
		}
		
		Interior newInterior=newInteriorBillImplementation.getbillInterior(thereceipt.getReceipt());
		if(newInterior.getId()==-1)
			{
			model.addAttribute("show",1);
			return "employee/interiorOldBill";
			}
		model.addAttribute("receiptNumber",thereceipt.getReceipt());
		
		Interior newinterior=new Interior(newInterior.getNumberOfDoor(),newInterior.getNumberOfFan(),
				newInterior.getNumberOfLight(),newInterior.getNumberOfMarbel(),newInterior.getCustomer_name()
				);
		model.addAttribute("interior",newinterior);
		return "employee/interiorOldBilldisplay";
	}
	//form to get the receipt number to retrieve the order from database
	@RequestMapping("/interiorOldBill")
	public String getIDInteriorcontroller(Model theModel )
	{
		Receipt theReceipt=new Receipt();
		theModel.addAttribute("receipt",theReceipt);
		return "employee/interiorOldBill";
	}
	
	//get Paint order from database using the receipt user provided.
	@RequestMapping("/getPaintBill")
	public String getOldPaintBillcontroller( 
			@Valid @ModelAttribute("receipt") Receipt thereceipt,BindingResult theBindingResult, Model model)
	{
		
		if(theBindingResult.hasErrors())
		{
			model.addAttribute("show",1);
			return "employee/paintOldBill";
		}
		Paint newPaint=newPaintBillImplementation.getbillPaint(thereceipt.getReceipt());
		if(newPaint.getId()==-1)
			{
			model.addAttribute("show",1);
			return "employee/paintOldBill";
			}
		model.addAttribute("receiptNumber",thereceipt.getReceipt());
		
		Paint newpaint=new Paint(newPaint.getSize30ml(),newPaint.getSize100ml(),newPaint.getSize500ml(),
				newPaint.getSize1l(),newPaint.getCustomer_name());
		model.addAttribute("paint",newpaint);
		return "employee/paintOldBilldisplay";
	}
	
	//form to get the receipt number to retrieve the order from database
	@RequestMapping("/paintOldBill")
	public String getIDPaintcontroller(Model theModel )
	{
		Receipt theReceipt=new Receipt();
		theModel.addAttribute("receipt",theReceipt);
		return "employee/paintOldBill";
	}
	
}
