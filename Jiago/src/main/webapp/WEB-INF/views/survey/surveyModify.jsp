<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table.surveyView {
	border-collapse: collapse;
}

.surveyView  th, td {
	border: 1px solid black;
	padding: 10px;
	text-align: center;
}
</style>

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

</head>
<body>

<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>



<form method="POST">
   <h2>설문 수정</h2>
   
   <p>회사 번호 <input type="number" placeholder="회사 번호" name="company_idx" min="0" value="${dto.company_idx}" required></p> 

   <p>설문 제목 <input type="text" placeholder="설문 제목" name="survey_title" value="${dto.survey_title}" required></p> 

   <p>설문 기간 <input type="text" id="survey_date" name="survey_date" value="${dto.survey_date}" required /></p>

   <p>적립금 <input type="number" name="survey_point" placeholder="적립금" min="0" step="100" value="${dto.survey_point}" required/> POINT

   <p>예상 소요 시간 <input type="number" name="survey_time" placeholder="예상 소요 시간" min="1" value="${dto.survey_time}" required/> 분
   

   <p>타겟 연령대 
      <select name="survey_targetAge">
         <option value="">== 타겟 연령대 ==</option>
         <option value="10대 이전" ${dto.survey_targetAge == '10대 이전' ? 'selected' : ''} >10대 이전</option>
         <option value="10대" ${dto.survey_targetAge == '10대' ? 'selected' : ''}>10대</option>
         <option value="20대" ${dto.survey_targetAge == '20대' ? 'selected' : ''}>20대</option>
         <option value="30대" ${dto.survey_targetAge == '30대' ? 'selected' : ''}>30대</option>
         <option value="40대" ${dto.survey_targetAge == '40대' ? 'selected' : ''}>40대</option>
         <option value="50대" ${dto.survey_targetAge == '50대' ? 'selected' : ''}>50대</option>
         <option value="60대" ${dto.survey_targetAge == '60대' ? 'selected' : ''}>60대</option>
         <option value="70대 이상" ${dto.survey_targetAge == '70대 이상' ? 'selected' : ''}>70대 이상</option>
      </select></p> 

   <p>타겟 성별
      <select name="survey_targetGender">
         <option value="">== 타겟 성별 ==</option>
         <option value="남성" ${dto.survey_targetGender == '남성' ? 'selected' : ''}>남성</option>
         <option value="여성" ${dto.survey_targetGender == '여성' ? 'selected' : ''}>여성</option>
      </select>
   </p> 

   <p>타겟 직업 
      <select name="survey_targetJob">
         <option value="">== 타겟 직업 ==</option>
         <option value="전문직" ${dto.survey_targetJob == '전문직' ? 'selected' : ''}>전문직</option>
         <option value="경영직" ${dto.survey_targetJob == '경영직' ? 'selected' : ''}>경영직</option>
         <option value="사무직" ${dto.survey_targetJob == '사무직' ? 'selected' : ''}>사무직</option>
         <option value="서비스/영업/판매직" ${dto.survey_targetJob == '서비스/영업/판매직' ? 'selected' : ''}>서비스/영업/판매직</option>
         <option value="생산/기술직/노무직" ${dto.survey_targetJob == '생산/기술직/노무직' ? 'selected' : ''}>생산/기술직/노무직</option>
         <option value="교사/학원강사" ${dto.survey_targetJob == '교사/학원강사' ? 'selected' : ''}>교사/학원강사</option>
         <option value="공무원(공기업 포함)" ${dto.survey_targetJob == '공무원(공기업 포함)' ? 'selected' : ''}>공무원(공기업 포함)</option>
         <option value="학생" ${dto.survey_targetJob == '학생' ? 'selected' : ''}>학생</option>
         <option value="전업주부" ${dto.survey_targetJob == '전업주부' ? 'selected' : ''}>전업주부</option>
         <option value="농/임/어업" ${dto.survey_targetJob == '농/임/어업' ? 'selected' : ''}>농/임/어업</option>
         <option value="자영업" ${dto.survey_targetJob == '자영업' ? 'selected' : ''}>자영업</option>
         <option value="자유직/프리랜서" ${dto.survey_targetJob == '자유직/프리랜서' ? 'selected' : ''}>자유직/프리랜서</option>
         <option value="무직" ${dto.survey_targetJob == '무직' ? 'selected' : ''}>무직</option>
         <option value="기타" ${dto.survey_targetJob == '기타' ? 'selected' : ''}>기타</option>
      </select></p> 

   <p>설문 정보</p>
   <p><textarea rows="10" cols="30" placeholder="설문 정보를 입력하세요" name="survey_info">${dto.survey_info}</textarea></p>
   <p><input type="submit" value="수정"></p>
   
   <p><a href="${cpath }/survey/surveyQuestionModify/${dto.survey_idx}"><button type="button">질문 수정하기</button></a></p>
</form>










<script>


$('#survey_date').daterangepicker({
    "locale": {
        "format": "YY/MM/DD",
        "separator": "~",
        "applyLabel": "확인",
        "cancelLabel": "취소",
        "fromLabel": "From",
        "toLabel": "To",
        "customRangeLabel": "Custom",
        "weekLabel": "W",
        "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
        "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
    },
    "startDate": new Date(),
    "endDate": new Date(),
    "drops": "auto"
}, function (start, end, label) {
    console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
});
</script>




</body>
</html>