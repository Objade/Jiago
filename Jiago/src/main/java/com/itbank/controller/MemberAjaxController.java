package com.itbank.controller;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.itbank.service.CompanyService;
import com.itbank.service.MemberService;

@RestController
public class MemberAjaxController {

	
	@Autowired MemberService memberService;
	@Autowired CompanyService companyService;
	
	
	
	@GetMapping("/company/companyDelete/{company_idx}")
	public String companyDelete(@PathVariable("company_idx") int company_idx) {
		int row = companyService.deleteCompany(company_idx);
		
		return "회사가 삭제 되었습니다.";
	}
}
