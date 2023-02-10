<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 이메일 찾기 페이지</title>
</head>
	<style>
		#mainForm {
			width: 800px;
		}
		
		
		
	</style>
<body>
	<%-- <h1>이메일 = ${email }</h1> --%>
	
	
	
	
	<div id="mainForm">
		<div class="select">
			<input type="radio" value="phone"> 회원정보에 등록한 휴대전화로 인증 ()
			<input type="radio" value="email"> 본인확인 이메일로 인증 ()
		</div>
	
	</div>
	
	
</body>
</html>