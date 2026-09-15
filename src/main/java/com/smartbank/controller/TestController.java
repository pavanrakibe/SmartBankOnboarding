package com.smartbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;




@Controller
public class TestController {
	
	
	@RequestMapping("/index")
	public String demoPage()
	{
		System.out.println("Demo Controller Called Successfully");
		
		return "test/demo";
	}
	

}
