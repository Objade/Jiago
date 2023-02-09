<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>    

<h2>설문 상세</h2>
<c:set var="dto" value="${dto }" />
	<div class="surveyList item">
		<div class="surveyList surveyTitle">설문 제목 : ${dto.survey_title}</div>
		<div class="surveyList surveyDate">설문 날짜 : ${dto.survey_date}</div>
		<div class="surveyList surveyTime">예상 응답 시간 : ${dto.survey_time}</div>
		<div class="surveyList surveyTarget">설문 대상 : ${dto.survey_targetAge} ${dto.survey_targetJob } ${dto.survey_targetGender} </div>
		<div class="surveyList surveyInfo">${dto.survey_info }</div>
		<div class="surveyList surveyPoint">포인트 : ${dto.survey_point}원</div>
		
		<div class="surveyList surveyPage"><a href="${cpath }/survey/surveyStart/${dto.survey_idx}">설문 시작</a></div>

	</div>


</body>
</html>