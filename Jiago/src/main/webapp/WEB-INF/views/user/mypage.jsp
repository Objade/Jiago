<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
	a {
		text-decoration: none;
		color: green;
	}
	
	ul {
		width: 300px;
		list-style: none;
		border: 1px solid black;
	}
	
	ul > li {
		padding: 10px 20px;
	}
	
	.hidden {
		display: none;
	}

</style>



</head>
<body>


	<div id="selectBox">
	
		<ul>
			<li><a href="${cpath }/user/mypageHome">나무 보여줄 홈</a></li>
			<li><a href="${cpath }/user/mypageSecurity">보안</a></li>
			<li><a href="${cpath }/user/mypageQuit">회원탈퇴</a></li>
		</ul>
	</div>
