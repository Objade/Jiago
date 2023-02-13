package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.UserDTO;
import com.itbank.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	
	HashMap<String, String> repository = new HashMap<String, String>();
	
	@Autowired UserService userService;

	@GetMapping("login")
	public void login() {}
	
	@PostMapping("login")
	public ModelAndView login(HttpSession session, UserDTO account) {
		ModelAndView mav = new ModelAndView();
		UserDTO userAccount = userService.login(account);
		mav.setViewName("user/result");
		if(userAccount == null) {
			mav.addObject("result","아이디 혹은 비밀번호가 잘못되었");
			mav.addObject("address","user/login");
			return mav;
		}
		mav.addObject("result","로그인에 성공 했");
		session.setAttribute("login", userAccount);	
		return mav;
	}
	
	@GetMapping("join") 
	public void join() {}
	
	@PostMapping("join")
	public ModelAndView join(UserDTO user) {
		ModelAndView mav = new ModelAndView("user/result");
		int row = userService.join(user);
		String result = row == 1 ? "회원 가입에 성공했" : "오류가 발생했";
		mav.addObject("result", result);
		return mav;
	}
	
	@GetMapping("logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/result");
		session.removeAttribute("login");
		mav.addObject("result","로그아웃에 성공했");
		return mav;
	}
	
	@GetMapping("findLoginId")
	public void findLoginId() {}
	
	@GetMapping("findLoginPw")
	public void findLoginPw() {}
	
	@GetMapping("pwCheckEmail")
	public ModelAndView pwCheckEmail() {
		ModelAndView mav = new ModelAndView("user/pwCheckEmail");
		List<String> user = userService.getEmailAndPhone();
		 mav.addObject("user",user);
		return mav;
	}
	
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
			mav.addObject("result","회원 정보 수정에 성공했");
		} else {
			mav.addObject("result","오류가 발생했");
			
		}
		return mav;
	}
	
	@PostMapping("newPasswordSet")
	public ModelAndView newPasswordSet(@RequestParam("password") String first, @RequestParam("passwordCheck") String second) {
		System.out.println("앞" + first);
		System.out.println("뒤" + second);
		ModelAndView mav = new ModelAndView("user/result");
		//if(first.equals(second)) {
		UserDTO user = new UserDTO();
		user.setUser_pw(first);
		int row = userService.newPasswordSet(user);
		if(row == 1) mav.addObject("result","비밀번호가 변경되었");
		else {
			mav.addObject("result","오류가 발생했");
			mav.addObject("address","user/findLoginPw");
		}
		//}
		return mav;
	}
	
}
