package com.itbank.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.BoardDTO;
import com.itbank.model.Paging;
import com.itbank.service.BoardService;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired private BoardService boardService;
	
	@GetMapping("/list")						
	public ModelAndView list(@RequestParam(defaultValue="1") Integer page) {	
		
		ModelAndView mav = new ModelAndView();	

		int boardCount = boardService.getBoardCount();
		Paging paging = new Paging(page, boardCount);
		
		List<BoardDTO> list = boardService.getListAll(paging);
		
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		
		return mav;	
	}
	@GetMapping("/view/{qboard_idx}")
	public ModelAndView view(@PathVariable("qboard_idx") int qboard_idx) {
		ModelAndView mav = new ModelAndView("/board/view");
		BoardDTO dto = boardService.get(qboard_idx);
		mav.addObject("dto", dto);
		return mav;
	}
		

}
