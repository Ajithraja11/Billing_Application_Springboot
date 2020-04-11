package com.example.demo.publiccontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/public")
public class CommonController {

	@RequestMapping("/index")
	public String homePage() {
		return "home_page";
	}
	
	@RequestMapping("/login")
	public String loginPage() {
		return "login_page";
	}
	
	@RequestMapping("/access-denied")
	public String accessDeniedPage() {
		return "access-denied_page";
	}
	
	@RequestMapping("/contactPage")
	public String contactPage() {
		return "contact";
	}
	
	@RequestMapping("/construction")
	public String constructionPage() {
		return "/public/construction";
	}
	
	@RequestMapping("/interior")
	public String interiorPage() {
		return "/public/interior";
	}
	
	@RequestMapping("/paint")
	public String paintPage() {
		return "/public/paint";
	}
	
}
