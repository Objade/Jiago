package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import com.itbank.model.AnswerDTO;
import com.itbank.service.SurveyService;

@RestController
@RequestMapping("/manage")
public class ManageAjaxController {
	
	@Autowired
	private SurveyService surveyService;
	
	
	@GetMapping("getSurveyDetailResult/{survey_idx}")
	public JSONObject surveyDetailJson(@PathVariable("survey_idx") int survey_idx) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("survey_idx", survey_idx+"");
		
		List<Integer> list = surveyService.getQuestionIDX(map);
		System.out.println(list);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		for(int i = 0; i < list.size(); i++) {
			map.put("question_idx", list.get(i)+"");
			List<AnswerDTO> answerList = surveyService.getSurveyResult(map);
			result.put(i + "", answerList);
		}
		
		System.out.println("dddd : " +result);
		
		JSONObject json = new JSONObject(result);
		System.out.println(json);
		
		return json;
	}
	
	
	
	
}
