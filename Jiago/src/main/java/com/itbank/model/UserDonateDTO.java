package com.itbank.model;

public class UserDonateDTO {

	private int survey_idx;
	private int user_idx;
	private	int total_donate;
			
	public int getSurvey_idx() {
		return survey_idx;
	}
	public void setSurvey_idx(int survey_idx) {
		this.survey_idx = survey_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public int getTotal_donate() {
		return total_donate;
	}
	public void setTotal_donate(int total_donate) {
		this.total_donate = total_donate;
	}

	
}
