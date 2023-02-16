package com.itbank.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itbank.model.SurveyFormDTO;
import com.itbank.model.SurveyFormDTOBox;
import com.itbank.service.SurveyService;

@RestController
public class SurveyAjaxController {
   
   @Autowired SurveyService surveyService;
   
   @PostMapping("/survey/surveyAnswer/{survey_idx}")
   public int surveyAnswer(@RequestBody HashMap<String, Object> ob, @PathVariable("survey_idx") int survey_idx) {
//      System.out.println(1);
      ob.put("survey_idx", survey_idx);
//      System.out.println(ob);
      
      int user_idx = Integer.parseInt((String) ob.get("user_idx"));
      @SuppressWarnings("unchecked")
      List<String> answerList = (List<String>) ob.get("answer_content");
      String answer_content = "";
      
      for(int i = 0; i < answerList.size(); i++) {
         if(i == answerList.size() - 1) {
            answer_content += answerList.get(i);
         }
         else { 
            answer_content += answerList.get(i) + ",";
         }
         
      }
      
//      System.out.println("user_idx : " + user_idx);
//      System.out.println("answerList : " + answerList);
//      System.out.println(answer_content);
      
      HashMap<String, String> map = new HashMap<String, String>();
      
      map.put("survey_idx", survey_idx + "");
      map.put("user_idx", ob.get("user_idx") + "");
      map.put("answer_content", answer_content);
      
      int row = surveyService.addAnswer(map);
   
      List<Integer> questionIdx = new ArrayList<Integer>(); 
      questionIdx = surveyService.getQuestionIDX(map);
//      System.out.println(questionIdx);

      
      HashMap<String, Object> resultMap = new HashMap<String, Object>();
      resultMap.put("survey_idx", survey_idx);
      resultMap.put("user_idx", ob.get("user_idx"));
      resultMap.put("questionIdx", questionIdx);
//      System.out.println(resultMap);
      
      int answerSub = surveyService.answerSubstr(resultMap);
      int deleteAnswerResult = surveyService.deleteAnswerResult(resultMap);
//      int userPoint = surveyService.addpoint(resultMap);
      
      return answerSub;
   }
   
   
//   @PostMapping("/survey/surveyQuestionAdd/{survey_idx}")
//   public int surveyQuestionAdd(@RequestBody String json, @PathVariable("survey_idx") int survey_idx) {
//  
//      System.out.println(json);
//      
//      return 1;
//   }
   
//   @PostMapping("/survey/surveyQuestionAdd/{survey_idx}")
//   public int surveyQuestionAdd(@RequestBody List<SurveyFormDTO> json, @PathVariable("survey_idx") int survey_idx) {
//	   
//	   System.out.println(json);
//	   
//	   return 1;
//   }
   
   @PostMapping("/survey/surveyQuestionAdd/{survey_idx}")
   public int surveyQuestionAdd(@RequestBody String question, @PathVariable("survey_idx") int survey_idx) throws JsonMappingException, JsonProcessingException {
	   
	   System.out.println(question);
	   
	   ObjectMapper mapper = new ObjectMapper();
	   List<SurveyFormDTO> list = mapper.readValue(question, new TypeReference<List<SurveyFormDTO>>() {});
	   System.out.println(list);
	   
	   list.forEach(System.out::println);
	   
	   for(int i = 0; i < list.size(); i++) {
		   SurveyFormDTO dto = list.get(i);
		   String question_content = dto.getQuestion_content();
		   int idx = dto.getQuestion_idx();
		   System.out.println(idx);
		   System.out.println(question_content);
		   
		   List<String> example = dto.getExample_content();
		   for(int j = 0; j < example.size(); j++) {
			   System.out.println(example.get(j));
		   }
		   System.out.println("==================================");
	   }
	   
	   return 1;
   }
      
      
   
}
























