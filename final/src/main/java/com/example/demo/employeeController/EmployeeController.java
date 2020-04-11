package com.example.demo.employeeController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.entity.Construction;
import com.example.demo.entity.Interior;
import com.example.demo.entity.Paint;


@Controller
@RequestMapping("/employee")
public class EmployeeController {
	
	//Employee home page
	@RequestMapping("/index")
	public String homePage() {
		return "employee/employee_home_page";
	}
	
	//Construction order bill
	@RequestMapping("/construction")
	public String constructionPage(Model theModel) {
		Construction theConstruction = new Construction();
		theModel.addAttribute("construction",theConstruction);
		return "employee/construction";
	}
	
	//Interior order bill
	@RequestMapping("/interior")
	public String interiorPage(Model theModel) {
		Interior theInterior =new Interior();
		theModel.addAttribute("interior",theInterior);
		return "employee/interior";
	}
	
	//Paint order bill
	@RequestMapping("/paint")
	public String paintPage(Model theModel) {
		Paint thePaint=new Paint();
		theModel.addAttribute("paint",thePaint);
		return "employee/paint";
	}
	
}
