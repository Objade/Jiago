package com.itbank.repository;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.itbank.model.UserDTO;

@Repository
public interface UserDAO {
	
	
	UserDTO login(UserDTO account);

	int join(UserDTO user);

	String checkRealMail(String email);

	String getId(String email);

	HashMap<String, String> checkId(String id);

	int update(UserDTO user);

	int newPasswordSet(UserDTO user);

	int pwUpdate(UserDTO user);
	
	String getPoint(int idx);

	String getPw(String idx);

	int quit(int idx);

	
}
