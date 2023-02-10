package com.itbank.service;

import java.util.HashMap;

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
		String userId = result.get("USER_ID");
		String userEmail = result.get("USER_EMAIL");
		System.out.println(userId);
		System.out.println(userEmail);
		base.put("userId", userId);
		base.put("userEmail", userEmail);
		/* id.equals(userId) ? 1 : 0 */
		return 1; 
	}

	public String getEmailAndPhone() {
		String email = base.get("userEmail");
		
		String[] split = email.split("@");
		String front = split[0];
		char[] frontChar = front.toCharArray();
		for(int i = 0; i < frontChar.length; i++) {
			if(1 < i) frontChar[i] = '*';
		}
		
		String back = split[1];
		char[] backChar = back.toCharArray();
		for(int i = 0; i < backChar.length; i++) {
			if(i != 0 && i < backChar.length - 4 ) {
				backChar[i] = '*';
			}
		}
 		
		email = String.valueOf(frontChar) + "@" + String.valueOf(backChar);
		System.out.println(email);
		
		return email;
	}



}
