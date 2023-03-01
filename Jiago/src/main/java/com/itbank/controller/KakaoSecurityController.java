package com.itbank.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.service.KakaoService;

@RestController
@RequestMapping("user")
public class KakaoSecurityController {
	
	@Autowired KakaoService kakaoService;
	
	@PostMapping("kakaoCheck")
	public String kakaoCheck(@RequestBody HashMap<String, String> param) {
		String kakaoId = param.get("id");
		System.out.println("여기는 접속되니 : " + kakaoId);
		int row = kakaoService.realKakaoId(kakaoId);
		System.out.println("0이냐 1이냐 : " + row);
		
		if(row == 1) return "home";
		
		
		return "user/kakaoJoin";
	}
	
	
	
}
