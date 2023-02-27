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
	.profile_body {
		background-color: #f9fbfc;
		margin: 0 35px;
	}	
	#giagoid_wrap {
		display: flex;
	}
	.header_subindex {
		border-right: 1px solid #dadada;
		border-left: 1px solid #dadada;
		box-shadow: 5px 1px 8px 0 rgb(0 0 0 / 6%);
		width: 500px;
		background-color: white;
		margin: 0px;
	}

	.myPageLogo > a > img {
		width: 300px;
	}
	
	.leftmenu {
		width: 300px;
		list-style: none;
	}
	
	.leftmenu > li {
		width: 390px;
		padding: 25px 15px;
	}
	
	.leftmenu > li:last-child {
		padding-bottom: 40px;
		margin-bottom: 40px;
		border-bottom: 1px solid #dadada;
	}
	
	.leftmenu > li > a {
		text-decoration: none;
		font-size: 30px;
		color: black;
		
		
	}
	.leftmenu > li > a:hover {
		border-bottom: 3px solid black;
		font-weight: bolder;
	}
	
	.headerLeft2 {
		padding-bottom: 200px;
	}
	
	.leftmenu2 { 
		list-style: none;
	}
	
	.leftmenu2 > li {
		padding-bottom: 20px;	
	
	}
	
	.leftmenu2 > li > a {
		text-decoration: none;
		color: grey;
		font-size: 20px;
	}
	
	.leftmenu2 > li > a > img {
		width: 30px;
		padding-right: 10px;
	}
	.headerLeft3 {
		margin: auto;
		width: 450px;
		height: 70px;
		border: 1px solid rgba(3,199,90,.3);
		background-color: rgba(3,199,90,.08);
		border-radius: 20px;
		
	}
	.leftmenu3 { 
		list-style: none;
		padding-left: 15px;
	}
	
	.leftmenu3 > li {
		
		padding-bottom: 20px;
	}
	
	.leftmenu3 > li > a {
		text-decoration: none;
		color: #03C75A;
		font-weight:bolder;
		font-size: 20px;
	}
	.leftmenu3 > li > a > img {
		width: 30px;
		padding-right: 5px;
		
	}
	.headerLeft4 {
		display:flex;
		margin-right:10px;
		justify-content: center;
		text-align: center;
		padding-top: 50px;
		padding-bottom: 20px;
	}
	.leftmenu4 { 
		list-style: none;
		padding-left: 20px;
		display: flex;
	}
	
	.leftmenu4 > li {
		padding-right: 20px;
	}
	
	.leftmenu4 > li > a {
		text-decoration: none;
	}
	.li_JIAGO a{
		font-size: 20px;
		color: grey;
		font-weight: bolder;
	}
	.li_personal {
		padding-top: 4px;
	}
	.li_personal a{
		font-size:14px;
		color: grey;
		font-weight: bold;
	}
	.li_use {
		padding-top: 4px;
	}
	.li_use a{
		font-size:14px;
		color: grey;
	}
	
	
	.hidden {
		display: none;
	}
	.gnb_area {
		display: flex;
		padding-top: 20px;
	}
	.gnb_area h1 {
		margin: 5px;
		
	}
	
	.profile_logo img{
		width: 150px;
	}

	
	

</style>



</head>
<body class="profile_body">
	<div id="giagoid_wrap">
		<header class="header">
			<div class="header_subindex">
				<div class="gnb_area">
					<div class="profile_logo">
						<a href="${cpath }/"><img src="${cpath }/resources/img/logo.png"></a>
					</div>
					<div><h1>지아고ID</h1></div>	
				</div>
				<div class="headerLeft">
					<ul class="leftmenu">
						<li><a href="${cpath }/user/mypageHome">마이페이지 홈</a></li>
						<li><a href="${cpath }/user/mypageSecurity">보안</a></li>
						<li><a href="${cpath }/user/mypageQuit">회원탈퇴</a></li>	
					</ul>
				</div>
				<div class="headerLeft2">
					<ul class="leftmenu2">
						<li><a href="${cpath }/notice/list?notice_name="><img src="${cpath }/resources/img/바로가기.png">고객센터 문의하러 가기</a></li>
						<li><a href="${cpath }/board/list?qboard_title="><img src="${cpath }/resources/img/바로가기.png">공지사항 바로가기</a></li>
					</ul>
				</div>
				<div class="headerLeft3">
					<ul class="leftmenu3">
						<li><a><img src="${cpath }/resources/img/알람.png">[보안] 주기적으로 비밀번호를 바꿔주세요!</a></li>
					</ul>
				</div>
				
				<div class="headerLeft4">
					<ul class="leftmenu4">
						<li class="li_JIAGO"><a href="${cpath }/user/mypageHome">JIAGO</a></li>
						<li class="li_personal"><a href="${cpath }/footer/personalinform">개인정보처리방침</a></li>
						<li class="li_use"><a href="${cpath }/footer/termofuse">이용약관</a></li>
					</ul>
				</div>
				
			</div>
		</header>
