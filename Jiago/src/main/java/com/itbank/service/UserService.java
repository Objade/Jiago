package com.itbank.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import com.itbank.model.UserDTO;
import com.itbank.repository.UserDAO;

@Service
public class UserService {
	
	HashMap<String, String> base =  new HashMap<String, String>();

	@Autowired UserDAO userDao;
	
	public UserDTO login(UserDTO account) {
		account.setUser_pw(sha256.encrypt(account.getUser_pw()));
		System.out.println(account.getUser_pw());
		UserDTO dto = userDao.login(account);
		
		if(dto.getUser_pw() != null) {
			int point = 0;
			if(userDao.getPoint(dto.getUser_idx()) != null) point = Integer.parseInt(userDao.getPoint(dto.getUser_idx()));
			System.out.println(point);
			if(point >= 100000 ) dto.setGrade("6단계");
			else if(point >= 50000 ) dto.setGrade("5단계");
			else if(point >= 30000 ) dto.setGrade("4단계");
			else if(point >= 10000 ) dto.setGrade("3단계");
			else if(point >= 5000 ) dto.setGrade("2단계");
			else dto.setGrade("1단계");
			
		}
		
		return dto;
	}
	
	public int join(UserDTO user) {
		user.setUser_pw(sha256.encrypt(user.getUser_pw()));
		return userDao.join(user);
	}

	public int checkId(String id) {
		HashMap<String, String> result = userDao.checkId(id);
		if(result.isEmpty()) return 0;
		String userId = result.get("USER_ID");
		String userEmail = result.get("USER_EMAIL");
		String userPhone = result.get("USER_PHONE");
		base.put("userId", userId);
		base.put("userEmail", userEmail);
		base.put("userPhone", userPhone);
		return 1; 
	}

	public List<String> getEmailAndPhone() {
		List<String> user = new ArrayList<String>();
		String email = base.get("userEmail");
		String phone = base.get("userPhone");
		// 암호화 되지 않은 이메일 추가
		user.add(email);
		
		
		// 이메일 암호화
		String[] split1 = email.split("@");
		String front = split1[0];
		char[] frontChar = front.toCharArray();
		for(int i = 0; i < frontChar.length; i++) {
			if(1 < i) frontChar[i] = '*';
		}
		
		String back = split1[1];
		char[] backChar = back.toCharArray();
		for(int i = 0; i < backChar.length; i++) {
			if(i != 0 && i < backChar.length - 4 ) {
				backChar[i] = '*';
			}
		}
 		
		email = String.valueOf(frontChar) + "@" + String.valueOf(backChar);
		
		// 전화번호 암호화
		String[] split2 = phone.split("-");
		String endNum = split2[2];
		endNum = endNum.replace(endNum, "****");
		phone = split2[0] + "-" + split2[1] + "-" + endNum;

		user.add(email);
		user.add(phone);
		return user;
	}

	public int update(UserDTO user) {
		return userDao.update(user);
	}


	public int newPasswordSet(UserDTO user) {
		user.setUser_id(base.get("userId"));
		user.setUser_pw(sha256.encrypt(user.getUser_pw()));
		return userDao.newPasswordSet(user);
	}

	public int pwUpdate(UserDTO user) {
		user.setUser_pw(sha256.encrypt(user.getUser_pw()));
		return userDao.pwUpdate(user);
	}

	public String getPoint(int idx) {
		return userDao.getPoint(idx);
	}

	public int pwCheck(HashMap<String, String> param) {
		String idx = param.get("idx");
		String getPw = userDao.getPw(idx);
		String inputPw = param.get("inputPw");
		inputPw = sha256.encrypt(inputPw);
		return getPw.equals(inputPw) ? 1 : 0;
	}

	public int quit(int idx) {
		return userDao.quit(idx);
	}

	public boolean checkPw(String loginPw, String inputPw) {
		inputPw = sha256.encrypt(inputPw);
		return loginPw.equals(inputPw);
	}

	public int joinId(String id) {
		return userDao.joinId(id);
	}

	public int joinName(String name) {
		return userDao.joinName(name);
	}

	
	

}
