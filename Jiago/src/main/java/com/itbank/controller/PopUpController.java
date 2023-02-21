package com.itbank.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class PopUpController {
	
	@RequestMapping("/popUp/pwmodify/{idx}")
	public String pwmodify(Model model, @PathVariable("idx") String idx) {
		model.addAttribute("idx",idx);
		return "user/pwmodify";
	}
	
	@RequestMapping("/popUp/emailCheckMail/{email}")
	public ModelAndView emailCheckMail(@PathVariable("email") String email) {
		ModelAndView mav = new ModelAndView("user/joinCheckEmail");
		mav.addObject("email", email);
		System.out.println(email);
		return mav;
	}


}
