package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.NoticeDTO;
import com.itbank.model.Paging;
import com.itbank.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired private NoticeService noticeService;
	
	@GetMapping("/list")
	public ModelAndView list(@RequestParam(defaultValue="1") Integer page) {	
		
		ModelAndView mav = new ModelAndView();	

		int boardCount = noticeService.getNoticeCount();
		Paging paging = new Paging(page, boardCount);
		
		List<NoticeDTO> list = noticeService.getListAll(paging);
		
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		
		return mav;	
	}
}
