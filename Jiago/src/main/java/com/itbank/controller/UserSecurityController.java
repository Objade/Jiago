package com.itbank.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.service.MailService;

@RestController
@RequestMapping("user")
public class UserSecurityController {
	
	@Autowired MailService mailService;
	
	private HashMap<String, String> sendNumberMap = new HashMap<String, String>();
	
	@PostMapping("sendNumber")
	public int findLoginId(@RequestBody String email) throws IOException {
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
	
	@PostMapping("sendCheckNumber")
	public String ajax03(@RequestBody HashMap<String, String> param) {
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
	
	 
}
