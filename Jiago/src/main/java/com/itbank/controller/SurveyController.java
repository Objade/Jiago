package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.SurveyDTO;
import com.itbank.model.SurveyExampleDTO;
import com.itbank.model.SurveyQuestionDTO;
import com.itbank.model.UserDTO;
import com.itbank.model.UserDonateDTO;
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
	

	@GetMapping("surveyComplete/{survey_idx}")
	public ModelAndView surveyComplete(@PathVariable("survey_idx") int survey_idx, HttpSession session) {
		ModelAndView mav = new ModelAndView("/survey/surveyComplete");
		UserDTO login = (UserDTO)session.getAttribute("login");
		System.out.println("login : " + login.getUser_idx());
		String userName = login.getUser_name();
		int user_idx = login.getUser_idx();
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("survey_idx", survey_idx);
	    resultMap.put("user_idx", user_idx);
		
		int userPoint = surveyService.addpoint(resultMap);	// 포인트 적립
		int getPoint = surveyService.getUserPoint(user_idx); // 적립 포인트 들고 오기
		System.out.println(userPoint);
		
		mav.addObject("userName", userName);		
		mav.addObject("userPoint", getPoint);
		return mav;
	}
	
	@PostMapping("surveyComplete")
	public String surveyPointComplete(UserDonateDTO dto) {
		System.out.println(dto.getUser_idx());
		System.out.println(dto.getTotal_donate());
		System.out.println(dto.getSurvey_idx());
		
		int row = surveyService.addUserDonate(dto);
		int minus = surveyService.minusUserPoint(dto);
		return "redirect:/";
	}
	
	@GetMapping("surveyAdd")
	   public void surveyAdd() {}
	   
	   @PostMapping("surveyAdd") 
	   public String surveyAdd(SurveyDTO dto) {
	      int row = surveyService.insertSurvey(dto);
	      System.out.println(row == 1 ? "추가 성공" : "추가 실패");
	      
	      int surveyIdx = surveyService.selectSurveyIdx();
	      
	      return "redirect:/survey/surveyQuestionAdd/" + surveyIdx;
	   }

	   @GetMapping("surveyQuestionAdd/{surveyIdx}")
	   public ModelAndView surveyQuestionAdd(@PathVariable("surveyIdx") int surveyIdx) {
	      ModelAndView mav = new ModelAndView("/survey/surveyQuestionAdd");
	      List<SurveyQuestionDTO> list = surveyService.selectQuestionList();
	      mav.addObject("list", list);
	      

	      return mav;
	   }
	

}
