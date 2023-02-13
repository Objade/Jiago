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
    	.hidden {
    		display: none;
    	}
    	
        #root {
            width: 1000px;
            margin: auto;
        }
        .header {
            display: flex;
        }
        
        .logo > a > img {
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
	         font-family: '맑은고딕';
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
		
   	    
    </style>

</head>
<body>

    <div id="root">

        <div class="header">
            <div class="logo">
                <a href="${cpath }/"><img src="${cpath }/resources/img/로고.png"></a>
            </div>

       
            <div class="nav">
                <ul>
                    <li><a href="${cpath }/">홈</a></li>
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
                       <span><a href="${cpath }/user/mypage"><b style="color:red">${login.user_name }</b>님 환영합니다</a></span>
                       <span><a href="${cpath }/user/logout">로그아웃</a></span>
                    </c:otherwise>
                 </c:choose>
                </div>
            </div>

        </div>
    
    </div>
    <hr>