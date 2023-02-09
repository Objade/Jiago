<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
	
	<h1>회원가입 페이지</h1>
	<hr>
	<form method="POST" action="${cpath }/user/join">
		<p><input type="text" name="user_id" placeholder="유저 아이디" required autocomplete="off"></p>
		<p><input type="password" name="user_pw" placeholder="유저 비밀번호" required autocomplete="off"></p>
		<p><input type="text" name="user_name" placeholder="유저 이름" required autocomplete="off"></p>
		<p><input type="date" name="user_birth">생일 입력</p>
		<p>
			<input type="radio" name="user_gender" value="남">남성
			<input type="radio" name="user_gender" value="여">여성
		</p>
		<p><input type="text" name="user_address" placeholder="주소 입력" required autocomplete="off"></p>
		<p><input type="text" name="user_phone" placeholder="전화번호 입력" required autocomplete="off"></p>
		<p><input type="email" placeholder="이메일 주소 입력" name="user_email" required autocomplete="off"></p>
		<p><input type="text" placeholder="직업" name="user_job" required autocomplete="off"></p>
		<p><input type="hidden" name="user_type" value="Admin"></p> <!-- 얘는 임시 -->
		<p><input type="submit" value="입력"></p>
	</form>


</body>
</html>