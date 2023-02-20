<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="cpath"  value="${pageContext.request.contextPath }"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 전체 목록</title>
<style>
	
	.surveyManage.surveyList {
		border: 1px solid black;
		border-collapse: collapse;

	}
	
	.surveyManage.surveyList > thead > tr > th {
		background-color: #648C85;
	}
	
	.surveyManage.surveyList  th, td {
		border: 1px solid black;
		padding: 10px;
		text-align: center;
	}
	
	.surveyManage.surveyList tr:hover td {
		background-color: #dadada;
		cursor: pointer;
	}


</style>

</head>
<body>

	<h1>설문 관리</h1>
	
	<h2><a href="${cpath }">홈</a></h2>
	<h2><a href="${cpath }/survey/surveyAdd">설문 추가</a></h2>
	
	<h3>설문관리</h3>
	
		<table class="surveyManage surveyList">
			<thead>
				<tr>
					<th>설문 번호</th>
					<th>회사 번호</th>
					<th>설문 제목</th>
					<th>조사 기간</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="dto" items="${list }">
					<tr onclick="location.href = '${cpath }/survey/surveyView/${dto.survey_idx}'">
						<td>${dto.survey_idx}</td>
						<td>${dto.company_idx}</td>
						<td>${dto.survey_title}</td>
						<td>${dto.survey_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	


</body>
</html>