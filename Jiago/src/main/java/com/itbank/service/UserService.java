package com.itbank.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.UserDTO;
import com.itbank.repository.UserDAO;

@Service
public class UserService {
	
	HashMap<String, String> base =  new HashMap<String, String>();

	@Autowired UserDAO userDao;
	
	public UserDTO login(UserDTO account) {
		account.setUser_pw(sha256.encrypt(account.getUser_pw()));
		System.out.println(account.getUser_pw());
		System.out.println(account.getUser_id());
		UserDTO dto = userDao.login(account);
		
		if(dto != null) {
			int point = 0;
			if(userDao.getPoint(dto.getUser_idx()) != null) point = Integer.parseInt(userDao.getPoint(dto.getUser_idx()));
			System.out.println("유저 보유 포인트" + point);
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

	// 포인트 가져오기
	public String getPoint(int idx) {
		return userDao.getPoint(idx);
	}
	
	// 기부 총합포인트 갖고오기
	public String getTotalPoint(int user_idx) {
		return userDao.getTotalPoint(user_idx);
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

	public int checkPhoneNum(String phone) {
		return userDao.checkPhoneNum(phone);
	}
	

	// 등급 지정
	public int setGrade(int userIdx) {
		String gradeSet = "";
		int totalPoint = Integer.parseInt(userDao.getTotalPoint(userIdx));		// 토탈 기부 포인트를 가져오는 함수
		if(totalPoint >= 500000) gradeSet = "6단계";
		else if(totalPoint >= 300000) gradeSet = "5단계";
		else if(totalPoint >= 100000) gradeSet = "4단계";
		else if(totalPoint >= 50000) gradeSet = "3단계";
		else if(totalPoint >= 10000) gradeSet = "2단계";
		else gradeSet = "1단계";
		System.out.println("유저 총 보유 포인트 : " + gradeSet);
		// 재활용 하겠금 DB에 저장
		UserDTO user = new UserDTO();
		user.setUser_grade(gradeSet);
		user.setUser_idx(userIdx);
		int row = userDao.setGrade(user);
		System.out.println(row);
		return row;
	}


	// 사용자 등급 갖고오기
	public String getGrade(int user_idx) {
		return userDao.getGrade(user_idx);
	}


	
	

}
