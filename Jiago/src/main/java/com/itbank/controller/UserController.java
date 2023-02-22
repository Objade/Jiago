package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	
	@Autowired UserService userService;

	@GetMapping("login")
	public void login() {}
	
	@PostMapping("login")
	public ModelAndView login(HttpSession session, UserDTO account) {
		ModelAndView mav = new ModelAndView();
		UserDTO userAccount = userService.login(account);
		mav.setViewName("user/result");
		if(userAccount == null) {
			mav.addObject("result","아이디 혹은 비밀번호가 잘못되었습");
			mav.addObject("address","user/login");
			return mav;
		}
		mav.addObject("result","로그인에 성공 했습");
		session.setAttribute("login", userAccount);	
		return mav;
	}
	
	@GetMapping("join") 
	public void join() {}
	
	@PostMapping("join")
	public ModelAndView join(UserDTO user) {
		ModelAndView mav = new ModelAndView("user/result");
		int row = userService.join(user);
		String result = row == 1 ? "회원 가입에 성공했습" : "오류가 발생했습";
		mav.addObject("result", result);
		return mav;
	}
	
	@GetMapping("logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("user/result");
		session.removeAttribute("login");
		mav.addObject("result","로그아웃에 성공했습");
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
		System.out.println(user);
		 mav.addObject("user",user);
		return mav;
	}
	
	@GetMapping("mypageHome")
	public ModelAndView mypage(HttpSession session) {
		ModelAndView mav = new ModelAndView("user/mypageHome");
		UserDTO user = (UserDTO)session.getAttribute("login");
		System.out.println(user.getUser_idx());
		String point = userService.getPoint(user.getUser_idx());
		if(point != null) mav.addObject("point",point);
		return mav; 
	}
	
	
	@GetMapping("mypageSecurity")
	public void mypageSecurity() {}
	
	@PostMapping("userModify")
	public ModelAndView userModify(HttpSession session ,UserDTO user) {
		
		ModelAndView mav = new ModelAndView("user/result");
		int row = userService.update(user);
		if(row == 1) {
			mav.addObject("result","회원 정보 수정에 성공했습");
		} else {
			mav.addObject("result","오류가 발생했습");
			
		}
		return mav;
	}
	
	@PostMapping("newPasswordSet")
	public ModelAndView newPasswordSet(@RequestParam("password") String first, @RequestParam("passwordCheck") String second) {
		ModelAndView mav = new ModelAndView("user/result");
		if(first.equals(second)) {
			UserDTO user = new UserDTO();
			user.setUser_pw(first);
			int row = userService.newPasswordSet(user);
			if(row == 1) mav.addObject("result","비밀번호가 변경되었습");
			return mav;
		}
		mav.addObject("result","오류가 발생했습");
		mav.addObject("address","user/findLoginPw");
		return mav;
	}
	
	@GetMapping("mypageQuit")
	public void mypageQuit() {}
	
	@PostMapping("mypageQuit")
	public ModelAndView mypageQuit(HttpSession session, @RequestParam("input_pw") String inputPw) {
		ModelAndView mav = new ModelAndView("user/result");
		String loginPw = (String)((UserDTO)session.getAttribute("login")).getUser_pw();
		System.out.println("세션 비밀번호" + loginPw);
		boolean flag = userService.checkPw(loginPw ,inputPw);
		if(flag) {
			int idx = (int)((UserDTO)session.getAttribute("login")).getUser_idx();
			System.out.println("유저 인덱스" + idx);
			int row = userService.quit(idx);
			if(row == 1) {
				mav.addObject("result","회원 탈퇴가 성공적으로 이뤄졌습니다. 이용해주셔서 감사합");
				session.removeAttribute("login");
				return mav;
			}
		}
		mav.addObject("result","오류가 발생했습");
		mav.addObject("address","user/mypageQuit");
		return mav;
	}
	
}
