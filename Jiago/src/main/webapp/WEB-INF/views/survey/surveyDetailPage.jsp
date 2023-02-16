<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>    

<style>

     

</style>

<div class="main">
	<div class="surveyDetail title">조사 참여하기</div>
	
	  <div class="surveyDetail item">
	    <table class="surveyDetail">
	        <tr>
	            <th>설문 제목</th>
	            <td>${dto.survey_title}</td>
	        </tr>
	
	        <tr>
	            <th>설문 기간</th>
	            <td>${dto.survey_date}</td>
	        </tr>
	
	        <tr>
	            <th>주요 대상</th>
	            <td>${dto.survey_targetAge} ${dto.survey_targetJob } ${dto.survey_targetGender}</td>
	        </tr>
	
	        <tr>
	            <th>예상 응답 시간</th>
	            <td>${dto.survey_time}</td>
	        </tr>
	
	        <tr>
	            <th>설문 정보</th>
	            <td>${dto.survey_info }</td>
	        </tr>
	
	        <tr>
	            <th>적립금</th>
	            <td>${dto.survey_point} POINT</td>
	        </tr>
	
	    </table>
	    
	    <a href="${cpath }/survey/surveyStart/${dto.survey_idx}"><button class="surveyDetail button surveyStart">설문 시작</button></a>
	</div>
</div>



</body>
</html>