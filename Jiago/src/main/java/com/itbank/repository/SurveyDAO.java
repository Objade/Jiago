package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.SurveyDTO;
import com.itbank.model.SurveyExampleDTO;
import com.itbank.model.SurveyQuestionDTO;

@Repository
public interface SurveyDAO {

	List<SurveyDTO> selectList();

	SurveyDTO selectOneDetail(int survey_idx);

	List<SurveyQuestionDTO> selectSurveyQuestion(int survey_idx);

	List<SurveyExampleDTO> selectSurveyExample(int survey_idx);

	int insertAnswer(HashMap<String, Object> ob);



	
}
