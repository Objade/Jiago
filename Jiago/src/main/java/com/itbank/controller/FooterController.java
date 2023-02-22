package com.itbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FooterController {
	
	@GetMapping("/termofuse")
	public void termofuse() {}
	
	@GetMapping("/waytocome")
	public void waytocome() {}
	
	@GetMapping("personalinform")
	public void personalinform() {}
	
	@GetMapping("introcompany")
	public void introcompany() {}
	
	@GetMapping("sitemap")
	public void sitemap() {}
}
