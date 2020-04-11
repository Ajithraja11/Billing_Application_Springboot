package com.example.demo.employeeController;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.ConstructionBillDaoImplementation;
import com.example.demo.dao.InteriorBillDaoImplementation;
import com.example.demo.dao.PaintBillDaoImplementation;
import com.example.demo.entity.Construction;
import com.example.demo.entity.Interior;
import com.example.demo.entity.Paint;

@Controller
@RequestMapping("/employee")
public class MainBill {

	//to remove empty space in text field
	@InitBinder
	public void initBinder(WebDataBinder dataBinder)
	{
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		dataBinder.registerCustomEditor(String.class,stringTrimmerEditor);
	}
	
	@Autowired
	private ConstructionBillDaoImplementation newBillDaoImplementation;
	
	//Add the order details to the construction table in the database 
	@PostMapping("/processForm")
	public String constructionformprocesscontroller(@Valid @ModelAttribute("construction") Construction theConstruction,
			BindingResult theBindingResult, Model model)
	{
		if(theBindingResult.hasErrors())
		{
			return "employee/construction";
		}
		model.addAttribute("oldtotal",0);
		newBillDaoImplementation.updatebill(theConstruction);
		return "employee/constructionBill";
	}
	
	@Autowired
	private InteriorBillDaoImplementation newInteriorBillImplementation;
	
	//Add the order details to the Interior table in the database 
	@PostMapping("/InteriorprocessForm")
	public String interiorformprocesscontroller(@Valid @ModelAttribute("interior") Interior theInterior,
			BindingResult theBindingResult, Model model)
	{
		if(theBindingResult.hasErrors())
		{
			return "employee/interior";
		}
		model.addAttribute("oldtotal",0);
		newInteriorBillImplementation.updatebill(theInterior);
		return "employee/interiorBill";
	}
	
	@Autowired
	private PaintBillDaoImplementation newPaintBillImplementation;	
	
	//Add the order details to the Paint table in the database 
	@PostMapping("/PaintprocessForm")
	public String interiorformprocesscontroller(@Valid @ModelAttribute("paint") Paint thePaint,
			BindingResult theBindingResult, Model model)
	{
		if(theBindingResult.hasErrors())
		{
			return "employee/paint";
		}
		model.addAttribute("oldtotal",0);
		newPaintBillImplementation.updatebill(thePaint);
		return "employee/paintBill";
	}
}


























