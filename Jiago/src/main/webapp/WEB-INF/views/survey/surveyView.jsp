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
				<th>설문 제목</th>
				<td>${dto.survey_title}</td>
			</tr>

			<tr>
				<th>설문 기간</th>
				<td>${dto.survey_date}</td>
			</tr>

			<tr>
				<th>주요 대상</th>
				<td>${dto.survey_targetAge}${dto.survey_targetJob }
					${dto.survey_targetGender}</td>
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
		<a href="${cpath }/survey/surveyDelete/${dto.survey_idx}"><button>삭제</button></a>
	</div>



</body>
</html>