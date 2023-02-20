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

</head>
<body>


	<h2>설문 상세</h2>

	<div class="surveyView item">
		<table class="surveyView">
			<tr>
				<th>설문 번호</th>
				<td>${dto.survey_idx}</td>
			</tr>

			<tr>
				<th>회사 번호</th>
				<td>${dto.company_idx}</td>
			</tr>
					
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
				<td><p>연령대 : ${dto.survey_targetAge }</p> 
	            	<p>성별 : ${dto.survey_targetGender}</p>
	            	<p>직업 : ${dto.survey_targetJob }</p></td>
			</tr>

			<tr>
				<th>예상 응답 시간</th>
				<td>${dto.survey_time}분</td>
			</tr>

			<tr>
				<th>설문 정보</th>
				<td>${dto.survey_info }</td>
			</tr>

			<tr>
				<th>적립금</th>
				<td>${dto.survey_point}POINT</td>
			</tr>
			
			<tr>
				<th>삭제 여부</th>
				<td>${dto.survey_delete}</td>
			</tr>

		</table>


		<h3>질문 목록</h3>

		<c:forEach var="dto" items="${list }" varStatus="status">
			<div class="surveyList item" question_idx="${dto.question_idx}"
				index="${status.count }">
				<div class="surveyList surveyTitle question">${status.count}
					${dto.question_content}</div>
				<c:forEach var="dtoEX" items="${exList }" varStatus="status">
					<c:if test="${dto.question_idx == dtoEX.question_idx }" >
						<div class="surveyList example" question_idx="${dtoEX.question_idx}">
						<div class="surveyList surveyExample">${dtoEX.example_content }</div>
						</div>
					</c:if>
				</c:forEach>
			</div>

		</c:forEach>


		<a href="${cpath }/survey/surveyModify/${dto.survey_idx}"><button>수정</button></a>
		<button id="surveyDelete">삭제</button>
	</div>

<script>
function surveyDeleteHandler(event) {	
		const cpath = '/jiago'
		const surveyIdx = '${dto.survey_idx}'
		const surveyName = '${dto.survey_title}'
		const message = "'" + surveyName + "' 을/를 정말로 삭제하시겠습니까?'"
		const flag = confirm(message)
		if(flag) {
			const url = cpath + '/survey/surveyDelete/' + surveyIdx
			fetch(url)
			.then(resp => resp.text())
	        .then(text => {
	           alert(text)
	           location.href = cpath + '/survey/surveyManage'
	          })	
		}
	}
	
const surveyDeleteButton = document.getElementById('surveyDelete')
surveyDeleteButton.onclick = surveyDeleteHandler

</script>

</body>
</html>