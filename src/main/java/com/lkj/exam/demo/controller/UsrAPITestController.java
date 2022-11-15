package com.lkj.exam.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrAPITestController {
	
	@RequestMapping("/usr/home/APITest")
	public String showAPI() {
		return "usr/home/APITest";
	}
	
	@RequestMapping("/usr/home/APITest2")
	public String showAPI2() {
		return "usr/home/APITest2";
	}
	
}
