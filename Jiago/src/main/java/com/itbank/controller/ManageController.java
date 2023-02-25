package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.Paging;
import com.itbank.model.SurveyDTO;
import com.itbank.service.SurveyService;

@Controller
@RequestMapping("/manage")
public class ManageController {
	
	@Autowired
	private SurveyService surveyService;

	@GetMapping("manageHome")
	public void manageHome() {}
	
	@GetMapping("surveyResultList")
	public ModelAndView surveyResultList(@RequestParam(defaultValue = "1") Integer page) {

		ModelAndView mav = new ModelAndView();

		int count = surveyService.getSurveyCount();
		Paging paging = new Paging(page, count);

		System.out.println(paging);

		List<SurveyDTO> list = surveyService.selectAllList(paging);

		mav.addObject("list", list);
		mav.addObject("paging", paging);

		return mav;
	}
	
	@GetMapping("surveyDetailResult/{survey_idx}")
	public ModelAndView surveyDetailResult(@PathVariable("survey_idx") int survey_idx) {
		
		ModelAndView mav = new ModelAndView("/manage/surveyDetailResult");
		
		mav.addObject("survey_idx", survey_idx);
		
		return mav;
	}
	
	@GetMapping("surveyUserJoin")
	public ModelAndView surveyUserJoin() {
		ModelAndView mav = new ModelAndView("/manage/surveyUserJoin");
		
		return mav;
	}
	
	@GetMapping("surveyUserDonateRank")
	public ModelAndView surveyUserDonateRank() {
		ModelAndView mav = new ModelAndView("/manage/surveyUserDonateRank");
		
		return mav;
	}
	
	@GetMapping("surveyPreferQuestion")
	public ModelAndView surveyPreferQuestion() {
		ModelAndView mav = new ModelAndView("/manage/surveyPreferQuestion");
		
		return mav;
	}
}
