package com.example.demo.publiccontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmptyController {

	@RequestMapping("/")
	public String emptyPage() {
		return "home_page";
	}
}
