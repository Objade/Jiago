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
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itbank.model.SurveyExampleDTO;
import com.itbank.model.SurveyFormDTO;
import com.itbank.model.SurveyQuestionDTO;
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
   
  
   
   @PostMapping("/survey/surveyQuestionAdd/{survey_idx}")
   public String surveyQuestionAdd(@RequestBody String question, @PathVariable("survey_idx") int survey_idx) throws JsonMappingException, JsonProcessingException {
	   
	   System.out.println(question);
	   
	   ObjectMapper mapper = new ObjectMapper();
	   List<SurveyFormDTO> list = mapper.readValue(question, new TypeReference<List<SurveyFormDTO>>() {});
	   System.out.println(list);
	   
	   int qrow = 0;
	   int erow = 0;
	   
	   HashMap<String, String> addMap = new HashMap<String, String>();
	   addMap.put("survey_idx", survey_idx+"");
	   
	   // 이미 있는 질문을 추가한 경우
	   for(int i = 0; i < list.size(); i++) {
		   SurveyFormDTO dto = list.get(i);
		   String question_content = dto.getQuestion_content();
		   int idx = dto.getQuestion_idx();
		   
		   System.out.println(idx);
		   System.out.println("질문 : " + question_content);
		   
		   List<String> example = dto.getExample_content();
		   
		   
		   
		   if(idx != 0) {
			   addMap.put("question_idx", idx+"");
			   addMap.put("question_content", question_content);
			   qrow = surveyService.addQuestion(addMap);
			   
			   for(int j = 0; j < example.size(); j++) {
				   System.out.println("보기 [" + j + "]" + example.get(j));
				   String example_content = example.get(j);
				   addMap.put("example_content", example_content);
				  
				   erow = surveyService.addExample(addMap);
				   
				   System.out.println("기존 질문 추가 성공 : " + qrow);
				   System.out.println("보기 추가 성공 : " + erow);
		
			   }
			   
		  }
		   
		// 새로운 질문을 추가한 경우
		   
		   HashMap<String, String> addNewMap = new HashMap<String, String>();
		   addNewMap.put("survey_idx", survey_idx+"");
		   
		   if(idx == 0) {
			   addNewMap.put("question_content", question_content);
			   qrow = surveyService.addNewQuestion(addNewMap);
			   System.out.println("질문 : " + question_content);
			   
			   for(int j = 0; j < example.size(); j++) {
				   System.out.println("보기 [" + j + "]" + example.get(j));
				   String example_content = example.get(j);
				   addNewMap.put("example_content", example_content);
				  
				   erow = surveyService.addNewExample(addNewMap);
				   
				   System.out.println("새 질문 추가 성공 : " + qrow);
				   System.out.println("보기 추가 성공 : " + erow);
		
			   }
			   
		  }
		   
	   }
	   
	   return "설문이 추가되었습니다.";
   }
   
      
   @GetMapping("/survey/surveyQuestionModify/{survey_idx}")
   public ModelAndView surveyQuestionUpdate(@PathVariable("survey_idx") int survey_idx) {
	   ModelAndView mav = new ModelAndView("/survey/surveyQuestionModify");
	   List<SurveyQuestionDTO> list = surveyService.selectQuestionList();
	   mav.addObject("list", list);

	   List<SurveyQuestionDTO> qList = surveyService.getSurveyQuestion(survey_idx);
	   List<SurveyExampleDTO> exList = surveyService.getSurveyExample(survey_idx);
	   
	   mav.addObject("qList", qList);
	   mav.addObject("exList", exList);
	   return mav;
   }
 
   
   @PostMapping("/survey/surveyQuestionModify/{survey_idx}")
   public String surveyQuestionModify(@RequestBody String question, @PathVariable("survey_idx") int survey_idx) throws JsonMappingException, JsonProcessingException {  
	   
	   System.out.println(question);
	   
	   ObjectMapper mapper = new ObjectMapper();
	   List<SurveyFormDTO> list = mapper.readValue(question, new TypeReference<List<SurveyFormDTO>>() {});
	   System.out.println(list);
	   
	   int qrow = 0;
	   int erow = 0;
	   
	   HashMap<String, String> addMap = new HashMap<String, String>();
	   addMap.put("survey_idx", survey_idx+"");
	   
	   // 기존 보기는 날려주기
	   int resetExample = surveyService.resetSurveyExample(survey_idx);
	   int resetQuestion = surveyService.resetSurveyQuestion(survey_idx);	 
	  
	  // 질문 상자 기준으로, 질문 번호가 같은데 내용이 다름 -> 질문을 수정한 경우임
	  // 질문을 수정한 경우에는 그 질문을 새로 질문상자에 추가해줘야 하기 때문에 question_idx를 0으로 처리하고 새롭게 insert
	   
	   for(int o = 0; o< list.size(); o++) {
		   SurveyFormDTO dto = list.get(o);
		   
		   if(dto.getQuestion_idx() != 0) {
			   SurveyQuestionDTO old = surveyService.checkQuestion(dto.getQuestion_idx());
				   if(old.getQuestion_idx() == dto.getQuestion_idx()) {
					   if(!old.getQuestion_content().equals(dto.getQuestion_content())) {
						   dto.setQuestion_idx(0);	   
					   }   
				   }
		   	}
		   
	
		   String question_content = dto.getQuestion_content();
		   int idx = dto.getQuestion_idx();
		   
		   System.out.println(idx);
		   System.out.println("질문 : " + question_content);
		   
		   
		   if(idx != 0) {
			   List<String> example = dto.getExample_content();
			   addMap.put("question_idx", idx+"");
			   addMap.put("question_content", question_content);
			   qrow = surveyService.addQuestion(addMap);
			   		   
			   for(int j = 0; j < example.size(); j++) {
				   System.out.println(example.get(j));
				   String example_content = example.get(j);
				   addMap.put("example_content", example_content);
				  
				   erow = surveyService.addExample(addMap);
		
			   }
			   
		   }	  
			   		   
			// 새로운 질문을 추가한 경우
			   
			   HashMap<String, String> addNewMap = new HashMap<String, String>();
			   addNewMap.put("survey_idx", survey_idx+"");
			   
			   if(idx == 0) {
				   List<String> example = dto.getExample_content();
				   addNewMap.put("question_content", question_content);
				   qrow = surveyService.addNewQuestion(addNewMap);
				   
				   for(int j = 0; j < example.size(); j++) {
					   System.out.println("보기 " + j + ":" + example.get(j));
					   String example_content = example.get(j);
					   addNewMap.put("example_content", example_content);				  
					   erow = surveyService.addNewExample(addNewMap);
				   } 
			  }   
		   }
		  
	   return "설문이 수정되었습니다.";
   }
      
   
   @GetMapping("/survey/surveyDelete/{survey_idx}")
   public String surveyDelete(@PathVariable("survey_idx") int survey_idx) {
	   int row = surveyService.deleteSurvey(survey_idx);
	   
	   return "설문이 삭제 되었습니다.";
   }
   
}
























