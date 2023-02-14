package com.itbank.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class PopUpController {
	
	@RequestMapping("/popUp/pwmodify/{idx}")
	public String pwmodify(Model model, @PathVariable("idx") String idx) {
		model.addAttribute("idx",idx);
		return "user/pwmodify";
	}


}
