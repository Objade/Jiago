package com.itbank.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
      System.out.println(1);
      ob.put("survey_idx", survey_idx);
      System.out.println(ob);
      
      int user_idx = Integer.parseInt((String) ob.get("user_idx"));
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
      
      System.out.println("user_idx : " + user_idx);
      System.out.println("answerList : " + answerList);
      System.out.println(answer_content);
      
      HashMap<String, String> map = new HashMap<String, String>();
      
      map.put("survey_idx", survey_idx + "");
      map.put("user_idx", ob.get("user_idx") + "");
      map.put("answer_content", answer_content);
      
      int row = surveyService.addAnswer(map);
   
      List<Integer> questionIdx = new ArrayList<Integer>(); 
      questionIdx = surveyService.getQuestionIDX(map);
      System.out.println(questionIdx);

      
      HashMap<String, Object> resultMap = new HashMap<String, Object>();
      resultMap.put("survey_idx", survey_idx);
      resultMap.put("user_idx", ob.get("user_idx"));
      resultMap.put("questionIdx", questionIdx);
      System.out.println(resultMap);
      
      int answerSub = surveyService.answerSubstr(resultMap);
      int deleteAnswerResult = surveyService.deleteAnswerResult(resultMap);
      
      return 1;
      
   }
}