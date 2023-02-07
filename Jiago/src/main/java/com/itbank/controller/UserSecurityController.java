package com.itbank.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.service.MailService;

@RestController
@RequestMapping("user")
public class UserSecurityController {
	
	@Autowired MailService mailService;
	
	private HashMap<String, String> sendNumberMap = new HashMap<String, String>();
	
	@GetMapping("sendNumber")
	public String findLoginId(String email) throws IOException {
		Random ran = new Random();
		String sendNumber = ran.nextInt(10000000) + 10000000 + "";
		System.out.println(sendNumber);
		int row = mailService.sendMail(email, sendNumber);
		if(row == 1) {
			sendNumberMap.put(email, sendNumber);
		}
		
		return row == 1 ? "메세지 보내기 성공" : "메세지 보내기 실패";
	}
	 
}
