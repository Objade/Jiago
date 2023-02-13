package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.UserDTO;
import com.itbank.repository.UserDAO;

@Service
public class UserService {

	@Autowired UserDAO userDao;
	
	public UserDTO login(UserDTO account) {
		return userDao.login(account);
	}
	
	public int join(UserDTO user) {
		return userDao.join(user);
	}

	public int checkId(String id) {	
		return id.equals(userDao.checkId(id)) == true ? 1 : 0;
	}

	public int update(UserDTO user) {
		return userDao.update(user);
	}



}
