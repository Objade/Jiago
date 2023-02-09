package com.itbank.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.UserDTO;
import com.itbank.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	
	@Autowired UserService userService;

	@GetMapping("login")
	public void login() {}
	
	@PostMapping("login")
	public String login(HttpSession session, UserDTO account) {
		UserDTO userAccount = userService.login(account);
		session.setAttribute("login", userAccount);
		return "home";
	}
	
	@GetMapping("join") 
	public void join() {}
	
	@PostMapping("join")
	public ModelAndView join(UserDTO user) {
		ModelAndView mav = new ModelAndView("user/result");
		int row = userService.join(user);
		String result = row == 1 ? "회원 가입에 성공" : "오류가 발생";
		mav.addObject("result", result);
		return mav;
	}
	
	@GetMapping("logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/result");
		session.removeAttribute("login");
		mav.addObject("result","로그아웃에 성공");
		return mav;
	}
	
	@GetMapping("findLoginId")
	public void findLoginId() {}
	
	@GetMapping("findLoginPw")
	public void findLoginPw() {}
	
	
	
}
