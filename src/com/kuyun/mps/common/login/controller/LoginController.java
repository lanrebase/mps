package com.kuyun.mps.common.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("/home")
	public String index(){
		return "/home/indexPage";
	}
}
