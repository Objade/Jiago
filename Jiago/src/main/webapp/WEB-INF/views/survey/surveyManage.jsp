<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="cpath"  value="${pageContext.request.contextPath }"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문 전체 목록</title>
</head>
<body>

	<h1>설문 관리</h1>
	
	<h2><a href="${cpath }/survey/surveyAdd">설문 추가</a></h2>
	
	<h3>설문 전체 목록</h3>
		<table>
			<thead>
				<tr>
					<th>설문 번호</th>
					<th>회사 번호</th>
					<th>설문 제목</th>
					<th>조사 기간</th>
					<th>수정</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="dto" items="${list }">
					<tr>
						<td>${dto.survey_idx}</td>
						<td>${dto.company_idx}</td>
						<td>${dto.survey_title}</td>
						<td>${dto.survey_date}</td>
						<td><button>수정</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	


</body>
</html>