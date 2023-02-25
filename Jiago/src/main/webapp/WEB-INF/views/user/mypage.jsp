<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://webfontworld.github.io/yangheeryu/Dongle.css" rel="stylesheet">
<title>마이페이지</title>
<style>

	body {
		font-family: 'Dongle';
	}

	#location {
		width: 1600px;
		display: flex;
	}
	.myPageLogo > a > img {
		width: 300px;
	}

	a {
		text-decoration: none;
		color: #91ba6c;
	}
	
	#selectBox {
		width: 300px;
		height: 500px;
		background-color: #2b524a;
		border-radius: 25px;s
	}
	
	ul {
		list-style: none;
	}
	
	ul > li {
		padding: 10px 20px;
		font-size: 30px;
	}
	
	li > a:hover {
		color: lightgreen;
	}
		
	.hidden {
		display: none;
	}

</style>



</head>
<body>
	<div class="myPageLogo"><a href="${cpath }/"><img src="${cpath}/resources/img/logo.png"></a></div>
<div id="location">
		<div id="selectBox">
		
			<ul>
				<li><a href="${cpath }/user/mypageHome">마이페이지 홈</a></li>
				<li><a href="${cpath }/user/mypageSecurity">보안</a></li>
				<li><a href="${cpath }/user/mypageQuit">회원탈퇴</a></li>
			</ul>
		</div>
