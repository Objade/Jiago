package com.itbank.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.service.MailService;
import com.itbank.service.UserService;

@RestController
@RequestMapping("user")
public class UserSecurityController {
	
	@Autowired MailService mailService;
	@Autowired UserService userService;
	
	private HashMap<String, String> sendNumberMap = new HashMap<String, String>();
	
	@PostMapping("sendNumber")
	public int findLoginId(@RequestBody String email) throws IOException {
		System.out.println(email);
		if(mailService.checkRealMail(email) == false) {
			return 0;
		}
		
		Random ran = new Random();
		String sendNumber = ran.nextInt(100000) + 100000 + "";
		System.out.println("인증 메일 전송시 번호 : " + sendNumber);
		int row = mailService.sendMail(email, sendNumber);
		if(row == 1) {
			sendNumberMap.put(email, sendNumber);

		}
		return row;
	}
	
	
	// 아이디 인증번호
	@PostMapping("sendCheckNumber")
	public String checkNumber(@RequestBody HashMap<String, String> param) {
		System.out.println("키 벨류 값 ===================");
		System.out.println(param);

		String saveCheckNumber = sendNumberMap.get(param.get("email"));
		System.out.println("저장된 번호 : " + saveCheckNumber);
		
		String inputCheckNumber = param.get("checkNumber");
		System.out.println("입력 받은 번호 : " + inputCheckNumber);
		
		String userId = ""; 
		boolean flag = saveCheckNumber.equals(inputCheckNumber);
		if(flag) {
			userId = mailService.getId(param.get("email"));
		}
		System.out.println("유저 아이디 : " + userId);
		return userId;
	}
	
	@PostMapping("sendId")
	public int realLogin(@RequestBody String id) {
		return userService.checkId(id);
	}
	
	@PostMapping("findType")
	public String findType(@RequestBody HashMap<String, String> item) throws IOException {
		String type = item.get("type");
		System.out.println(type);
//		if(mailService.checkRealMail(email) == false) {
//			return 0;
//		}
		
		if(type.equals("email")) {
			System.out.println(item.get("email"));  	
			String email = item.get("email");
			Random ran = new Random();
			String sendNumber = ran.nextInt(100000) + 100000 + "";
			System.out.println("인증 메일 전송시 번호 : " + sendNumber);
			int row = mailService.sendMail(email, sendNumber);
			if(row == 1) sendNumberMap.put("saveCheckNumber", sendNumber);
		}
		return type;
	}
	
	@PostMapping("pwFindMailNumber")
	public int pwFindMailNumber(@RequestBody String number) {
		String saveCheckNumber = sendNumberMap.get("saveCheckNumber");
		String inputCheckNumber = number;
		
		if(saveCheckNumber.equals(inputCheckNumber)) {
			return 1;
		}
		
		return 0;
	}
	
	

	
	 
}
