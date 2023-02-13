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
		return userDao.login(account);
	}
	
	public int join(UserDTO user) {
		return userDao.join(user);
	}

	public int checkId(String id) {
		HashMap<String, String> result = userDao.checkId(id);
		if(result.isEmpty()) return 0;
		/* String userId = result.get("USER_ID"); */
		String userEmail = result.get("USER_EMAIL");
		String userPhone = result.get("USER_PHONE");
		/* System.out.println(userId); */
		/* System.out.println(userEmail); */
		/* System.out.println(userPhone); */
		/* base.put("userId", userId); */
		base.put("userEmail", userEmail);
		base.put("userPhone", userPhone);
		/* id.equals(userId) ? 1 : 0 */
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
//		System.out.println(email);
//		System.out.println(phone);

		user.add(email);
		user.add(phone);
		
		return user;
	}

	public int update(UserDTO user) {
		return userDao.update(user);
	}



}
