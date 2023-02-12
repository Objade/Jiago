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
	
	@GetMapping("pwCheckEmail")
	public void pwCheckEmail() {}
	
	@GetMapping("mypage")
	public String mypage() {
		return "user/mypage"; 
	}
	
	@GetMapping("mypageHome")
	public void mypageHome() {}
	
	@GetMapping("mypageSecurity")
	public void mypageSecurity() {}
	
	@PostMapping("userModify")
	public ModelAndView userModify(HttpSession session ,UserDTO user) {
		System.out.println("여기 실행됬어요");
		
		
		ModelAndView mav = new ModelAndView("user/result");
		int row = userService.update(user);
		if(row == 1) {
			session.removeAttribute("login");
			mav.addObject("result","회원 정보 수정에 성공");
		} else {
			mav.addObject("result","오류가 발생");
			
		}
		return mav;
	}
	
}
