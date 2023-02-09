package com.itbank.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.SurveyDTO;
import com.itbank.model.SurveyExampleDTO;
import com.itbank.model.SurveyQuestionDTO;
import com.itbank.repository.SurveyDAO;

@Service
public class SurveyService {

	@Autowired private SurveyDAO dao;

	public List<SurveyDTO> selectList() {
		return dao.selectList();
	}

	public SurveyDTO getSurveyDetail(int survey_idx) {
		return dao.selectOneDetail(survey_idx);
	}

	public List<SurveyQuestionDTO> getSurveyQuestion(int survey_idx) {
		return dao.selectSurveyQuestion(survey_idx);
	}

	public List<SurveyExampleDTO> getSurveyExample(int survey_idx) {
		return dao.selectSurveyExample(survey_idx);
	}

//	public int addAnswer(HashMap<String, Object> ob) {
//		return dao.insertAnswer(ob);
//	}

	

	

	
	
}
