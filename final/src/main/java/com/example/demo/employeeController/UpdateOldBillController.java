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
public class UpdateOldBillController {
	
	@Autowired
	private ConstructionBillDaoImplementation newBillDaoImplementation;
	@Autowired
	private InteriorBillDaoImplementation newInteriorBillImplementation;
	@Autowired
	private PaintBillDaoImplementation newPaintBillImplementation;
	
	//Get receipt number from user to update old bill
	@RequestMapping("/updateConstructionOldBill")
	public String getIDConstructionUpdatecontroller(Model theModel )
	{
		Receipt theReceipt=new Receipt();
		theModel.addAttribute("receipt",theReceipt);
		theModel.addAttribute("show",0);
		return "employee/constructionOldBill";
	}
	
	//Get receipt number from user to update old bill
	@RequestMapping("/updateinteriorOldBill")
	public String getIDInteriorupdatecontroller(Model theModel )
	{
		Receipt theReceipt=new Receipt();
		theModel.addAttribute("receipt",theReceipt);
		theModel.addAttribute("show",0);
		return "employee/interiorOldBill";
	}
	
	//Get receipt number from user to update old bill
	@RequestMapping("/updatepaintOldBill")
	public String getIDPaintupdatecontroller(Model theModel )
	{
		Receipt theReceipt=new Receipt();
		theModel.addAttribute("receipt",theReceipt);
		theModel.addAttribute("show",0);
		return "employee/paintOldBill";
	}
	
	//form to update existing order
	@PostMapping("/getUpdateConstructionBill")
	public String getOldConstructionBillUpdatecontroller( 
			@Valid @ModelAttribute("receipt") Receipt thereceipt,BindingResult theBindingResult, Model model)
	{
		if(theBindingResult.hasErrors())
		{
			model.addAttribute("show",0);
			return "employee/constructionOldBill";
		}
		
		Construction newConstruction=newBillDaoImplementation.getbillConstruction(thereceipt.getReceipt());
		if( newConstruction.getId()==-1 ) 
				{
			model.addAttribute("show",0);
			return "employee/constructionOldBill";
			}
			
		model.addAttribute("receiptNumber",thereceipt.getReceipt());
		model.addAttribute("name",newConstruction.getCustomer_name());
		Construction newonstruction=new Construction(newConstruction.getSand_unit(),
				newConstruction.getBricks_6(),newConstruction.getBricks_10(),
				newConstruction.getCementBag()
				);
		model.addAttribute("constructionupdate",newonstruction);
		
		return "employee/constructionUpdate";
		
	}
	
	//form to update existing order
	@RequestMapping("/getUpdateInteriorBill")
	public String getOldInteriorBillcontroller( 
			@Valid @ModelAttribute("receipt") Receipt thereceipt,BindingResult theBindingResult, Model model)
	{
		if(theBindingResult.hasErrors())
		{
			model.addAttribute("show",0);
			return "employee/interiorOldBill";
		}
		
		Interior newInterior=newInteriorBillImplementation.getbillInterior(thereceipt.getReceipt());
		if(newInterior.getId()==-1)
			{
			model.addAttribute("show",0);
			return "employee/interiorOldBill";
			}
		model.addAttribute("receiptNumber",thereceipt.getReceipt());
		
		Interior newinterior=new Interior(newInterior.getNumberOfDoor(),newInterior.getNumberOfFan(),
				newInterior.getNumberOfLight(),newInterior.getNumberOfMarbel(),newInterior.getCustomer_name()
				);
		model.addAttribute("interior",newinterior);
		return "employee/interiorUpdate";
	}
	
	//form to update existing order
	@RequestMapping("/getUpdatePaintBill")
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
		return "employee/paintUpdate";
	}
	
	@PostMapping("/constructioUpdateForm")
	public String constructionformprocesscontroller(@Valid @ModelAttribute("construction") Construction theConstruction,
			BindingResult theBindingResult, Model model)
	{
		if(theBindingResult.hasErrors())
		{
			return "employee/constructionUpdate";
		}
		Construction newConstruction=newBillDaoImplementation.getbillConstruction(theConstruction.getId());
		model.addAttribute("oldtotal",newConstruction.getTotalAmount());
		newBillDaoImplementation.updatebill(theConstruction);
		return "employee/constructionBill";
	}
	
	@PostMapping("/InteriorUpdateForm")
	public String interiornformprocesscontroller(@Valid @ModelAttribute("interior") Interior theInterior,
			BindingResult theBindingResult, Model model)
	{
		if(theBindingResult.hasErrors())
		{
			return "employee/interiorUpdate";
		}
		Interior newInterior=newInteriorBillImplementation.getbillInterior(theInterior.getId());
		model.addAttribute("oldtotal",newInterior.getTotalAmount());
		newInteriorBillImplementation.updatebill(theInterior);
		return "employee/interiorBill";
	}
	
	@PostMapping("/PaintUpdateForm")
	public String interiorformprocesscontroller(@Valid @ModelAttribute("paint") Paint thePaint,
			BindingResult theBindingResult, Model model)
	{
		if(theBindingResult.hasErrors())
		{
			return "employee/paintUpdate";
		}
		Paint newPaint=newPaintBillImplementation.getbillPaint(thePaint.getId());
		model.addAttribute("oldtotal",newPaint.getTotalAmount());
		newPaintBillImplementation.updatebill(thePaint);
		return "employee/paintBill";
	}
	
}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	



