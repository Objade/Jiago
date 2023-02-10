package com.itbank.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.SurveyDTO;
import com.itbank.model.SurveyExampleDTO;
import com.itbank.model.SurveyQuestionDTO;
import com.itbank.service.SurveyService;

@Controller
@RequestMapping("/survey")
public class SurveyController {

	@Autowired private SurveyService surveyService;

	@GetMapping("list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		List<SurveyDTO> list = surveyService.selectList();
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("surveyDetailPage/{survey_idx}")
	public ModelAndView detail(@PathVariable ("survey_idx") int survey_idx) {
		ModelAndView mav = new ModelAndView("/survey/surveyDetailPage");
		SurveyDTO dto = surveyService.getSurveyDetail(survey_idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@GetMapping("surveyStart/{survey_idx}")
	public ModelAndView surveyStart(@PathVariable("survey_idx") int survey_idx) {
		ModelAndView mav = new ModelAndView("/survey/surveyStart");
		
		List<SurveyQuestionDTO> list = surveyService.getSurveyQuestion(survey_idx);		
		List<SurveyExampleDTO> exList = surveyService.getSurveyExample(survey_idx);
		
		mav.addObject("list", list);
		mav.addObject("exList", exList);
		
		return mav;
		
	}
	
	
	
	
}