package com.itbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PopUpController {

	@RequestMapping("/popup/pwmodify")
	public String pwmodify() {
		return "user/pwmodify";
	}
	
}
