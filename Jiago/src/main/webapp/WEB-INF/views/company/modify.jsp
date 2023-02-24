<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath"  value="${pageContext.request.contextPath }"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
background-color: #f5f6f7;
}
#company_root {
   width: 550px;
   margin: auto;
   justify-content: center;
   padding: 10px;
}
table.companyView {
   border-collapse: collapse;
}

.companyView  th, td {
   border: 1px solid black;
   padding: 10px;
   text-align: center;
}
.img_back {
   padding-bottom: 20px;
}

.img_back>a {
   font-size: 25px;
   text-decoration-line: none;
   color: black;
}

.img_back>a>img {
   padding-right: 5px;
   width: 25px;
}
.company_Modify input {
   width: 450px;
   height: 45px;   
   border: 1px solid #dadada;
   margin-bottom: 10px;
   font-size: 15px;
   color: grey;
}
.company_Modify select {
   width: 450px;
   height: 45px;
   border: 1px solid #dadada;
   margin-bottom: 10px;
}
.company_Modify option {
   color: grey;
}
.company_Modify span {
   padding-left: 5px;
   font-weight: bolder;
      
}
.company_Modify p {
   margin: 5px;
}
.company_Modify p textarea{
   width: 443px;
   height: 250px;
   border: 1px solid #dadada;      
}
.companyModi_button input{
   width: 450px;
   height: 45px;
   background-color: #1B434A;
   border: 1px solid #1B434A;
   text-align: center;
   color: white;
   font-size: 20px;
   cursor: pointer;
}
.companymodi_option {
   color: grey;
   font-size: 15px;
}
.company_Modify h1 {
   padding-bottom: 20px;
}
.companyModi_button button {

   width: 450px;
   height: 45px;
   background-color: #1B434A;
   border: 1px solid #1B434A;
   text-align: center;
   color: white;
   font-size: 20px;
   cursor: pointer;
   margin-bottom: 70px;
}

</style>
</head>
<body>

<div class="img_back">
   <a href="javascript:history.back(-1)"><img src="${cpath }/resources/img/뒤로가기.png" >뒤로가기</a>
</div>
<div id="company_root">
   <form class="company_Modify" method="POST">
      <h1>회사 수정</h1>
         
      <span>회사 번호</span>
      <p><input type="number" name="company_idx" min="0" value="${dto.company_idx}" readonly="readonly"></p>	
      
      <span>회사 아이디</span>
      <p><input type="text" name="company_id" value="${dto.company_id}" readonly="readonly"></p>
       
      <span>회사 이름</span>
      <p><input type="text" name="company_name" value="${dto.company_name}" readonly="readonly" ></p>
       
      <span>회사 전화번호</span>
      <p><input type="text" name="company_num" value="${dto.company_num}" required ></p>
      
      <span>사업자등록번호</span>   
      <p><input type="text" name="company_registnum" value="${dto.company_registnum}" required ></p>
      
      <span>주소</span>
      <p><input type="text" name="company_address" value="${dto.company_address}" required></p>
      
      <span>이메일</span>
      <p><input type="text" name="company_email" value="${dto.company_email}" required></p>
      
      
      <p class="companyModi_button"><input type="submit" value="회사 정보 수정하기"></p>
      
   </form>
</div>

</body>
</html>