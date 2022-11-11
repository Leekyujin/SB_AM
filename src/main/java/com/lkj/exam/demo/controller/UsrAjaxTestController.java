package com.lkj.exam.demo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UsrAjaxTestController {
	@RequestMapping("usr/home/plus")
	String showTestPage() {
		return "usr/home/plus";
	}
	
	@RequestMapping("usr/home/doPlus")
	@ResponseBody
	String doPlus(int num1, int num2) {
		String msg = "더하기 성공!";
		int rs = num1 + num2;
		
		return rs + "/" + msg + "/S-1";
	}
	
	@RequestMapping("usr/home/doPlusJson")
	@ResponseBody
	Map doPlusJson(int num1, int num2) {
		Map rs = new HashMap<String, Object>();
		
		rs.put("rs", num1 + num2);
		rs.put("msg", "더하기 성공!");
		rs.put("code", "S-1");
		
		return rs;
	}
}


