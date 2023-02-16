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
    <link href="https://webfontworld.github.io/yangheeryu/Dongle.css" rel="stylesheet">
    <title>자연에 설문을 담다 지아고 입니다.</title>

    <style>
    	.hidden {
    		display: none;
    	}
    	
    	header {
    	    position: fixed;
    	    width: 100%;
  			top: 0;
    		background-color: white;
    	}
    
    	body {
    		font-family: 'Dongle';
    	}
    
        #root {
            width: 1100px;
            margin: 0 auto;
            display: flex;
            justify-content: space-evenly;

        }
        
        
        .logo > a > img {
            width: 200px;
			margin-top: 30px;
			
        }

        .nav {
            display: flex;
        }
        
        .nav > ul {
        	margin: 0;
        	padding: 0;
        }
        
        .nav > ul > li {
           width: 100px;
           font-size: 25px;
           line-height: 80px;
           margin: 0 10px;
           text-align: center;
        }
        
        
        .nav > ul > li > a:hover {
        	font-size: 40px;
        	color: lightgreen;
        	transition: 0.2s ease-out;
        }
        
        .nav > ul > li > a:not(:hover) {
        	transition: 0.2s ease-out;
        }

        .loginBar > span {
        	margin: 0 10px;
        }
        
        .loginBar > span > a:hover {
        	color: lightgreen;
        	transition: 0.2s ease-out;
        }
        
        .loginBar > span > a:not(:hover) {
			transition: 0.2s ease-out;
			
		}
		
        a {
            text-decoration: none;
            color: inherit;
        }

        ul {
            display: flex;
            list-style: none;
        }
        
        .root {
        	text-align: center;
        	margin-top: 120px;
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
	         margin: 100px auto;
      	}
      	
      	.boardBox {
	         width: 500px;
	         height: 200px;
	         background: #1B434A;
	         margin: 100px auto;
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
      
    	.header > .nav a {
	         font-size: 20px;
	         color: #333333;
	         font-weight: bolder;
     	}
      	#replyWriteForm textarea {
			height: 100px;
			min-height: auto;
			width: 80%;
		}
	  
	  	.notice_name {
           display: flex;
           justify-content: space-between;
           margin-top: 50px;
           margin-bottom: 50px;
        }
        
        .notice_name > .notice_name_L {
           font-size: 30px;
           font-weight: bolder;
        }
        
        .qboard_title {
           display: flex;
           justify-content: space-between;
           margin-top: 50px;
           margin-bottom: 50px;
           
        }
        
        .qboard_title > .qboard_title_L {
           font-size: 30px;
           font-weight: bolder;
        }
        
        .page_wrap {
        	margin-top: 20px;
			text-align:center;
			font-size:0;
 		}
 		
		.page_nation {
			display:inline-block;
		}
		
		.page_nation a {
			display:block;
			margin:0 3px;
			float:left;
			border:1px solid #e6e6e6;
			width:28px;
			height:28px;
			line-height:28px;
			text-align:center;
			background-color:#fff;
			font-size:13px;
			color:#999999;
			text-decoration:none;
		}
		.page_nation .arrow {
			border:1px solid #ccc;
		}
		.page_nation .pprev {
			background:#f8f8f8 url('${cpath}/resources/img/page_pprev.png') no-repeat center center;
			margin-left:0;
		}
		.page_nation .prev {
			background:#f8f8f8 url('${cpath}/resources/img/page_prev.png') no-repeat center center;
			margin-right:7px;
		}
		.page_nation .next {
			background:#f8f8f8 url('${cpath}/resources/img/page_next.png') no-repeat center center;
			margin-left:7px;
		}
		.page_nation .nnext {
			background:#f8f8f8 url('${cpath}/resources/img/page_nnext.png') no-repeat center center;
			margin-right:0;
		}
		.page_nation .active  {
			background-color:#1B434A;
			color:#fff;
			border:1px solid #1B434A;
		}
		
		/* 설문 목록 */
		
		.main {
			margin-top: 150px;
		}
		
		.surveyList.title {
			display: flex;
			align-items: center;
			justify-content: center;
			padding: 70px;
			background-color: #1D594E;
			font-size: 30px;
			font-weight: bold;
			color: #eee;
			margin: 20px 0 0 0;
		}
		
		.surveyList.items {
			display: flex;
			flex-wrap: wrap;
			box-sizing: border-box;
			background-color: #dadada;
			padding: 50px;
			margin: 0 auto;
			justify-content: flex-start;
		}
		
		.surveyList.item {
			background-color: white;
			width: 250px;
			margin: 10px;
			box-sizing: border-box;
		}
		
		.surveyList>a:hover {
			background-color: #44A666;
			
		}
		
		.surveyList.surveyTitle {
			background-color: #1D594E;
			padding: 10px;
			box-sizing: border-box;
			text-align: center;
			color: white;
			font-size: 20px;
			font-weight: bold;
			
		}
		
		.surveyList.subject {
			padding: 10px 0 5px 0;
			box-sizing: border-box;
			text-align: center;
			font-size: 15px;
			color: #595959;
			font-weight: 700;
		}
		
		.surveyList.content {
			font-size: 15px;
			color: gray;
			font-weight: 400;
			text-align: center;
		}
		
		.surveyList.content:last-child {
			padding: 0 0 10px 0;
		}
		
		/* 설문 상세 */

	    .surveyDetail.title {
	        display: flex;
	        align-items: center;
	        justify-content: center;
	        padding: 70px;
	        background-color: #1D594E;
	        font-size: 30px;
	        font-weight: bold;
	        color: #eee;
	        margin: 20px 0 0 0;
	      }
	
	      table.surveyDetail th {
	        background-color: #1D594E;
	        padding: 30px;
	        color: white;
	      }
	
	      table.surveyDetail td {
	        background-color: white;
	        border: 1px solid 1D594E;
	        font-weight: 550;
	        padding: 30px;
	      }
	
	      table.surveyDetail {
	        margin: 50px;
	      }
	
	      .surveyDetail {
	        display: flex;
	        flex-direction: column;
	        justify-content: center;
	        align-items: center;
	        border: 0px;
	        background-color: #dadada;
	      }
	      
	       .surveyDetail.button {
	        background-color: #1D594E;
	        margin: 0 0 100px 0;
	        color: white;
	      
	        font-weight: bold;
	        font-size: 20px;
	        width: 400px;
	        box-sizing: border-box;
	
	      }
	      
	      /* 설문 시작 */

	      .surveyStart {
	        display: flex;
	        flex-direction: column;
	        padding: 50px;
	        justify-content: center;
	        align-items: center;
	      }
	
	      .button {
	        background-color: #1D594E;
	        color: white;
	        font-weight: bold;
	        font-size: 15px;
	        box-sizing: border-box;
	        width: 100px;
	        margin: 10px;
	      }
	
	      .surveyList_start > img {
	        width: 1000px;
	      }
	
	      .surveyList.question {
	        background-color: white;
	        color: black;
	      }
	      
      
    </style>

</head>
<body>

<header>

	<div id="root">
      
		<div class="logo">
		    <a href="${cpath }/"><img src="${cpath }/resources/img/logo.png" class="logoImg"></a>
		</div>
		
		
		<div class="nav">
		    <ul>
		        <li><a href="${cpath }/">홈</a></li>
		        <li><a href="${cpath }/survey/list">설문참여</a></li>
		        <li><a href="#">포인트</a></li>
		        <li><a href="#">나무심기</a></li>
		        <li><a href="${cpath }/cuscenter">고객센터</a></li>
		    </ul>
		</div>
		
		
		<div class="loginBar">
		       <c:choose>
		     <c:when test="${empty login }">
		        <span class="login"><a href="${cpath }/user/login">로그인</a></span>
		        <span class="join"><a href="${cpath }/user/join">회원가입</a></span>
		     </c:when>
		     <c:otherwise>
		        <span><a href="${cpath }/user/mypageHome"><b style="color:red">${login.user_name }</b>님 환영합니다</a></span>
		        <span><a href="${cpath }/user/logout">로그아웃</a></span>
		     </c:otherwise>
		  </c:choose>
		</div>
     
      </div> <!-- header -->
</header>   
   