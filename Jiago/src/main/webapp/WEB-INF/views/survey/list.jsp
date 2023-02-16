<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


<div class="main">
	<div class="surveyList title">설문 목록</div>
	
	<div class="surveyList items">
		<c:forEach var="dto" items="${list }">
			<a href="${cpath }/survey/surveyDetailPage/${dto.survey_idx}">
				<div class="surveyList item">
					<div class="surveyList surveyTitle">${dto.survey_title}</div>
					<div class="surveyList surveyDate subject">조사기간</div>
					<div class="surveyList surveyDate content">${dto.survey_date}</div>
					<div class="surveyList surveyTime subject">응답시간</div>
					<div class="surveyList surveyTime content">${dto.survey_time}</div>
					<div class="surveyList surveyPoint subject">포인트</div>
					<div class="surveyList surveyPoint content">${dto.survey_point}</div>
	
				</div>
			</a>
		</c:forEach>
	</div>
</div>



</body>
</html>