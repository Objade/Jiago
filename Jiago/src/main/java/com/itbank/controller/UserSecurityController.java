package com.itbank.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
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
		if(mailService.checkRealMail(email) == 0) {
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
	public List<String> checkNumber(@RequestBody HashMap<String, String> param) {
		System.out.println("키 벨류 값 ===================");
		System.out.println(param);

		String saveCheckNumber = sendNumberMap.get(param.get("email"));
		System.out.println("저장된 번호 : " + saveCheckNumber);
		
		String inputCheckNumber = param.get("checkNumber");
		System.out.println("입력 받은 번호 : " + inputCheckNumber);
		
		List<String> userId = null;
		boolean flag = saveCheckNumber.equals(inputCheckNumber);
		if(flag) {
			userId = mailService.getId(param.get("email"));
		
			return userId;
		} 
		else {
			userId = new ArrayList<String>();
			userId.add("없음");
		}
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
			sendNumberMap.put("saveCheckNumber", sendNumber);
		}
		return type;
	}
	
	@PostMapping("pwFindMailNumber")
	public int pwFindMailNumber(@RequestBody String number) {
		String saveCheckNumber = sendNumberMap.get("saveCheckNumber");
		System.out.println(saveCheckNumber);
		String inputCheckNumber = number;
		
		if(saveCheckNumber.equals(inputCheckNumber)) {
			return 1;
		}
		
		return 0;
	}
	

	// 회원가입 아이디 중복 검사
	@GetMapping("joinId/{joinId}")
	public int joinId(@PathVariable("joinId") String id) {
		System.out.println(id);
		int row = userService.joinId(id);
		System.out.println(row);
		return row;
	}
	
	// 회원가입 유저명 중복 검사
	@GetMapping("joinName/{joinName}")
	public int joinName(@PathVariable("joinName") String name) {
		System.out.println(name);
		int row = userService.joinName(name);
		return row;
	}
	
	@GetMapping("sendJoinEmail/{email}")
	public String sendJoinEmail(@PathVariable("email") String email) throws IOException{
		System.out.println(email);
		Random ran = new Random();
		String sendNumber = ran.nextInt(100000) + 100000 + "";
		String result = "";
		System.out.println("인증 메일 전송시 번호 : " + sendNumber);
		int row = mailService.sendMail(email, sendNumber);
		if(row == 1)  {
			sendNumberMap.put("saveCheckNumber", sendNumber);
			result = "인증메일을 전송했습니다. 이메일을 확인해주세요";
		} 
		else if(row == -1) result = "중복되거나 잘못된 주소 입니다";
		else result = "메세지 전송에 문제가 발생했습니다";
		
		return result;
	}
	
	@GetMapping("equalCheckNumber/{number}")
	public String equalCheckNumber(@PathVariable("number") String number) {
		String saveCheckNumber = sendNumberMap.get("saveCheckNumber");
		System.out.println(saveCheckNumber);
		System.out.println(number);
		return saveCheckNumber.equals(number) ? "인증완료" : "인증실패";
	}
	
	@GetMapping("checkPhoneNum/{phone}")
	public int checkPhoneNum(@PathVariable("phone") String phone) {
		int row = userService.checkPhoneNum(phone);
		return row;
	}
	
	
	 
}
