package com.example.demo.adminController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//admin controller-controlls the diversion of controlls in admin controll flow
@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("/index")
	public String homePage() {
		return "admin_page";
	}
	
}
