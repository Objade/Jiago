package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.UserDonateDTO;

@Repository
public interface DonateDAO {

	HashMap<String, UserDonateDTO> selectDonateList();


	
	
}
