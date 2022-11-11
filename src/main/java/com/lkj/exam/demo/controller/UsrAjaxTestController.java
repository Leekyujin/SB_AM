package com.lkj.exam.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lkj.exam.demo.vo.Rq;

@Controller
public class UsrAjaxTestController {
	@RequestMapping("usr/home/plus")
	String showTestPage() {
		return "usr/home/plus";
	}
	
	@RequestMapping("usr/home/doPlus")
	@ResponseBody
	int doPlus(int num1, int num2) {
		return num1 + num2;
	}
}


