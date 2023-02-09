<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath"  value="${pageContext.request.contextPath }"/>
    
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지아고</title>

    <style>
        #root {
            width: 1000px;
            margin: auto;
        }
        .header {
            display: flex;
        }

        .logo > img {
            width: 250px;
        }

        .nav {
            display: flex;
        }

        .loginBar > span {
           
            padding: 10px;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        ul {
            display: flex;
        }

        ul {
            list-style: none;
        }

        ul > li {
            padding: 10px;
        }
        .banner >img {
            width: 900px;
        }
        .banner2 > img {
            width: 900px;
        }
        .banner3 > img {
            width: 900px;
            padding-bottom: 20px;
        }
        .s3_top {
            font-weight: bolder;
            text-align: center;
            font-size: 27px;
            color: darkgreen;
            padding: 10px;
        }
        .s3_mid {
            display: flex;
            justify-content: center;
            text-align: center;
            
        }
        .s3_bottom {
            display: flex;
            justify-content: center;
            text-align: center;
        }
        .write_top {
            background-color: grey;
            font-weight: bolder;
            color: white;
            font-size: 20px;
            padding: 10px;
            margin-right: 2px;    
        }
        .write_mid {
            font-weight: bolder;
            font-size: 15px;
            padding: 5px;
        }
        .write_bottom {
            color: grey;
        }
        .customer {
            width: 300px;
        }
        .minipont {
            font-size: small;
            text-align: center;
            font-weight: bolder;
            color: grey;
            padding-top: 20px;
            padding-bottom: 20px;
        }
        .s4_top{
            font-weight: bolder;
            text-align: center;
            font-size: 27px;
            color: white;
            padding: 10px;

        }
        .s4_mid{
            text-align: center;
            font-size: 15px;
            color: white;
            margin-bottom: 10px;

        }
        .s4_bottom {
            margin: auto;
            text-align: center;
            font-size: 15px;
            color: white;
            width: 100px;
            height: 20px;
            background-color: #2B7C6F;
            padding: 20px;
        }
        #section3 {
            background-color: #dadada;
            width: 100%;
        
        }
        #section4 {
            background-color: #1B434A;
            text-align: center;
            width: 100%;
            padding-bottom: 20px;
        }
        table {
			border: 2px solid black;
			border-collapse: collapse;
			min-width: 500px;
			margin: 0 auto;
		}
		td, th {
			border: 1px solid darkgrey;
			padding: 5px 10px;
		}
		.serviceBox {
			width: 900px;
			margin: auto;
		}
		.noticeBox {
			width: 500px;
			height: 200px;
			background: #1B434A;
		}
		.boardBox {
			width: 500px;
			height: 200px;
			background: #1B434A;
		}
		
		.serviceBox > .noticeBox > a {
            display: flex;
            width: 500px;
            height: 200px;
            text-align: center;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            font-weight: bolder;
            color: #eee;
        }
        
        .serviceBox > .boardBox > a {
            display: flex;
            width: 500px;
            height: 200px;
            text-align: center;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            font-weight: bolder;
            color: #eee;
        }
		
		
		.hidden {
			display: none;
		}
    	
    </style>

</head>
<body>

    <div id="root">

        <div class="header">
            <div class="logo">
                <img src="${cpath }/resources/img/로고.png">	
            </div>

       
            <div class="nav">
                <ul>
                    <li><a href="">홈</a></li>
                    <li><a href="${cpath }/survey/list">설문참여</a></li>
                    <li><a href="">포인트</a></li>
                    <li><a href="">나무심기</a></li>
                    <li><a href="${cpath }/cuscenter">고객센터</a></li>
                </ul>

                <div class="loginBar">
                 <c:choose>
                 	<c:when test="${empty login }">
                    	<span class="login"><a href="${cpath }/user/login">로그인</a></span>
                    	<span class="join"><a href="${cpath }/user/join">회원가입</a></span>
                 	</c:when>
                 	<c:otherwise>
                    	<span><b style="color:red">${login.user_name }</b>님 환영합니다</span>
                    	<span><a href="${cpath }/user/logout">로그아웃</a></span>
                    </c:otherwise>
                 </c:choose>
                </div>
            </div>

        </div>
    
    </div>