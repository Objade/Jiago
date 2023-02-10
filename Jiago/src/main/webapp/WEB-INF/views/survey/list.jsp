<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>



<div class="surveyList title">설문 목록</div>
<div>-----------------------------------</div>
<div class="surveyList items">
	<c:forEach var="dto" items="${list }">
	<div class="surveyList item">
		<div class="surveyList surveyTitle">설문 제목 : ${dto.survey_title}</div>
		<div class="surveyList surveyDate">설문 날짜 : ${dto.survey_date}</div>
		<div class="surveyList surveyTime">예상 응답 시간 : ${dto.survey_time}</div>
		<div class="surveyList surveyPoint">포인트 : ${dto.survey_point}원</div>
		<div class="surveyList surveyPage"><a href="${cpath }/survey/surveyDetailPage/${dto.survey_idx}">페이지 이동</a></div>
		<div>-----------------------------------</div>
	</div>
	</c:forEach>
</div>




</body>
</html>