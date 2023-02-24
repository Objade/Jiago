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
          z-index: 2;
       }
    
       body {
          font-family: 'Dongle';
          font-size: 25px;
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
        	margin: 50px 0;
            width: 900px;
        }
        
        .banner3 > img {
            width: 900px;
            padding-bottom: 20px;
        }
        
        .s3_top {
            font-weight: bolder;
            text-align: center;
            font-size: 50px;
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
            font-size: 25px;
            padding: 10px;
            margin-right: 2px;  
            width: 325px;
            box-sizing: border-box;  
        }
        
        .write_mid {
            font-weight: bolder;
            font-size: 25px;
            padding: 5px;
        }
        
        .write_bottom {
            color: grey;
        }
        
        .minipont {
            font-size: small;
            text-align: center;
            font-weight: bolder;
            color: grey;
            padding-top: 20px;
            padding-bottom: 20px;
        }
        
        .minipont > a {
        	font-size: 40px;
        }
        
        .surveys.surveyItem {
        	background-color: white;
        }
        
        .s4_top{
            font-weight: bolder;
            text-align: center;
            font-size: 50px;
            color: white;
            padding-top: 30px;

        }
        
        .s4_mid{
            text-align: center;
            font-size: 30px;
            color: white;
            margin-bottom: 10px;

        }
        
        .s4_bottom {
            margin: auto;
            text-align: center;
            font-size: 40px;
            color: #319482;
            width: 300px;
            height: 20px;
            padding-bottom: 30px;
            
        }
        
        #section3 {
            background-color: #dadada;
            width: 100%;
        
        }
        
        #section4 {
            background-color: #1D594E;
            text-align: center;
            width: 100%;
            padding-bottom: 20px;
        }
        

        
        /*  게시판  */ 
        #bBody {
           padding-top: 30px;
        } 
        #bRoot {
           
           width: 1000px;
            margin: 100px auto;
        }
        #vBody {
           padding-top: 40px;
        }
        #vRoot {
           width: 800px;
           margin: 100px auto;
        }
        .vMDL {
           padding-bottom: 10px;
           padding-top: 10px;
           display: flex;
           justify-content: space-between;
           border-bottom: 2px solid #7d8389;
        }
        
        #lRoot {
           background-color: white;
        }
        #mdiRoot {
           padding-top: 100px; 
        }
        #boardList {
           border-collapse: collapse;
            width: 100%;
            margin: auto;
           
       }
       
       #boardList th {
          padding: 8px;
          text-align: center;
          background-color: #1B434A;
          font-size: 25px;
          color: #eee;
          
       }
       
         #boardList  td {
           border-bottom: 1px solid #7d8389;
            padding: 10px;
            text-align: center;
            font-size: 20px;
         }
         #viewList {
            border-collapse: collapse;
            width: 100%;
            margin: auto;
            
         }
         .viewListTop {
            border-bottom: 2px solid #1B434A;
         }
         .bTitle {
            font-size: 50px;
            width: 600px;
         }
         
         .bWriter {
         font-size: 30px;
         width: 100px;
         text-align: right;
         }
         .bView {
            font-size: 30px;
            width: 100px;
            text-align: center;
         }
         .bContent {
            height: 450px;
            padding-top: 10px;
            border-bottom: 2px solid #1B434A;
            vertical-align: top;
            text-align: left;
            font-size: 25px;
         }
         .bContent pre {
            font-size: 25px;
            font-family: 'Dongle';
         }

         .write_button {
            width: 100px;
            height: 30px;
            background-color: #1B434A;
            float: right;
            
         }
         
         .write_button > a {
            display: flex;
            width: 100px;
            height: 30px;
            text-align: center;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            font-weight: bolder;
            color: #eee;
         }
         .write_button2 {
            width: 100px;
            height: 30px;
            background-color: #1B434A;
            float: right;
            
         }
         
         .write_button2 > a {
            display: flex;
            width: 100px;
            height: 30px;
            text-align: center;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            font-weight: bolder;
            color: #eee;
         }
         
         .search {
            padding-top: 20px;
            padding-bottom: 50px;
            z-index: 1;
         }
         .search > form {
            position: relative;
           width: 100%;
           display: flex;
         }
          #input1 {
            width: 90%;
            height: 30px;
           border: 1px solid #bbb;
           border-right: none;
           padding: 10px 12px;
           font-size: 14px;
           border-bottom: 2px solid #bbb;
         }
         #input2 {
            width:10%; 
            border-left: none;
            border: 1px solid #bbb;
            font-family: 'Dongle';
            font-size: 25px;
            background-color: #1B434A;
            color: white;
            cursor: pointer;
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
      .reply {
         border-right: 1px solid grey;
         border-left: 1px solid grey;
         border-bottom: 1px solid grey;
         padding: 10px;
         
      }
      .replyTop {
         display: flex;
         justify-content: space-between;
      }
      
      .replyTop .reply_writer {
         font-size: 20px;
      }
      .reply_content {
         font-size: 20px;
      }
     
        .notice_name {
           display: flex;
           justify-content: space-between;
           margin-top: 30px;
        }
        
        .notice_name > .notice_name_L {
           font-size: 40px;
           font-weight: bolder;
        }
        
        .qboard_title {
           display: flex;
           justify-content: space-between;
           margin-top: 30px;           
        }
        
        .qboard_title > .qboard_title_L {
           font-size: 40px;
           font-weight: bolder;
        }
        .reply_title {
           font-size: 40px;
           font-weight: bolder;
        }
        
        .write_title {
           display: flex;
           justify-content: space-between;
           margin-top: 30px;
           border-bottom: 2px solid #1B434A;
        }
        
        .write_title > .write_title_L {
           font-size: 40px;
           font-weight: bolder;
        }
        
        .write_title > .write_title_R input{
           width: 70px;
           height: 40px;
           border: 1px solid #1B434A;
           background-color: #1B434A;
           color: white;
           font-family: 'Dongle';
           font-size: 30px;    
           cursor: pointer;
        
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
         padding: 30px;
         background-color: #1D594E;
         font-size: 70px;
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
      
      .all_surveyList.item {
         background-color: white;
         width: 250px;
         margin: 10px;
         box-sizing: border-box;
      }
      
      .surveyList.item {
         background-color: white;
         width: 330px;
         margin: 10px;
         box-sizing: border-box;
      }
      
      .surveyList.items >a:hover {
         background-color: #44A666;
         
      }
      
      .surveyList.surveyTitle {
         background-color: #1D594E;
         padding: 10px;
         box-sizing: border-box;
         text-align: center;
         color: white;
         font-size: 30px;
         font-weight: bold;
         
      }
      
      .surveyList.subject {
         padding: 10px 0 5px 0;
         box-sizing: border-box;
         text-align: center;
         font-size: 25px;
         color: #595959;
         font-weight: 700;
      }
      
      .surveyList.content {
         font-size: 25px;
         color: gray;
         font-weight: 400;
         text-align: center;
      }
      
      .surveyList.content:last-child {
         padding: 0 0 10px 0;
      }
      
      .survey_filter {
         display: flex;
         justify-content: flex-end;
         align-items: flex-end;
         text-align: right;
         margin-right: 5px;
         }
         #filter_all {
            display: flex;
         }
         #filter {
            margin-right: 20px;
            
         }
         #filter2 {
            margin-right: 20px;
         }
         #filter3 {
            margin-right: 20px;
         }
         .filter_targetAge select {
            width: 196px;
            height: 41px;
            font-size: 15px;
            color: #999;
            border: 2px solid #ddd;
         }
         .filter_targetGender select {
            width: 196px;
            height: 41px;
            font-size: 15px;
            color: #999;
            border: 2px solid #ddd;
         }
         .filter_targetJob select {
            width: 196px;
            height: 41px;
            font-size: 15px;
            color: #999;
            border: 2px solid #ddd;
         }
         #survey_filter_input {
           width: 70px;
           height: 41px; 
            border-left: none;
            border: 1px solid #1D594E;
            font-family: 'Dongle';
            font-size: 25px;
            background-color: #1D594E;
            color: white;
            cursor: pointer;
            margin-top: 25px;
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
         
         .s3_mid {
            width: 100%;
               
         }
   
         .customer {
            display: flex;
            width: 72%;
            text-align: center;
            margin: 0 auto;
            flex-flow: wrap;
            justify-content: left;
         }
   
         .surveys {
            width: 325px;
            margin: 5px;
         }
           
           
         .banner3 {
            width: 52%;
            margin: 10px auto;
            position: relative;            
         }
         
         .banner3_img {
            width: 1000px;               
         }
           
         .banner3_text {
         	display: flex;
         	width: 100%;
            padding: 5px 10px;
            text-align: center;
            color: white;
            font-size: 60px;
            position: absolute;
            top: 10%;
            left: 20%;
         }
         
         .home_totalDonate {
         	margin-left: 100px;
         }
        
        .home_totalPerson {
        	margin-left: 100px;
        	width: 300px;
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
              <li><a href="${cpath }/survey/list?survey_targetAge=&survey_targetGender=&survey_targetJob=">설문참여</a></li>
              <li><a href="${cpath }/donate/donateList">나무심기</a></li>
              <li><a href="${cpath }/cuscenter">고객센터</a></li>
              <c:choose>
                    <c:when test="${login.user_type eq 'Admin'}"><li><a href="${cpath }/manage/manageHome">설문관리</a></li></c:when>
                  <c:otherwise><li><a href="${cpath }/survey/surveyManage">설문관리</a></li></c:otherwise>
              </c:choose>
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
     
      </div>
</header>   
   