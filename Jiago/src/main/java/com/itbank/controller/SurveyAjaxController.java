package com.itbank.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.itbank.service.SurveyService;

@RestController
public class SurveyAjaxController {
	
	@Autowired SurveyService surveyService;
	
	@PostMapping("/survey/surveyAnswer/{survey_idx}")
	public int surveyAnswer(@RequestBody HashMap<String, Object> ob, @PathVariable("survey_idx") int survey_idx) {
		ob.put("survey_idx", survey_idx);
		System.out.println(ob);
		
//		int user_idx = Integer.parseInt((String) ob.get("user_idx"));
//		List<HashMap<String, String>> map = (List<HashMap<String, String>>) ob.get("answer_content");
//		System.out.println("user_idx : " + user_idx);
//		System.out.println("map : " + map);
//		
//		int row = surveyService.addAnswer(ob);
		return 1;
		
	}
}
