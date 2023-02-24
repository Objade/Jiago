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
#companyAdd_root {
   width: 550px;
   margin: auto;
   justify-content: center;
   padding: 10px;
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
.company_Add input {
   width: 450px;
   height: 45px;   
   border: 1px solid #dadada;
   margin-bottom: 10px;
   font-size: 15px;
   color: grey;
}
.company_Add select {
   width: 450px;
   height: 45px;
   border: 1px solid #dadada;
   margin-bottom: 10px;
}
.company_Add option {
   color: grey;
}
.company_Add span {
   padding-left: 5px;
   font-weight: bolder;
      
}
.company_Add p {
   margin: 5px;
}
.company_Add p textarea{
   width: 443px;
   height: 250px;
   border: 1px solid #dadada;      
}
.companyAdd_button input{
   width: 450px;
   height: 45px;
   background-color: #1B434A;
   border: 1px solid #1B434A;
   text-align: center;
   color: white;
   font-size: 20px;
   cursor: pointer;
}

.company_Add h1 {
   padding-bottom: 20px;
}
.companyAdd_button button {
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
   <a href="javascript:history.back(-1)"><img src="${cpath }/resources/img/뒤로가기.png">뒤로가기</a>
</div>
<div id="companyAdd_root">
	<form class="company_Add" method="POST">
		<h1>회사 추가</h1>
		
		<span>회사 번호</span>
		<p><input type="number" placeholder="회사 번호" name="company_id" min="0" required></p> 
		
		<span>회사 이름</span>
	    <p><input type="text" placeholder="회사 이름" name="company_name" required></p> 
		
		<span>회사 전화번호</span>
	    <p><input type="text" placeholder="회사 전화번호" name="company_num" required /></p>
	
		<span>사업자등록번호</span>
	    <p><input type="text" name="company_registnum" placeholder="사업자등록번호"required/></p>
	
		<span>주소</span>
	    <p><input type="text" name="company_address" placeholder="주소"required/></p>
	    
	    <span>이메일</span>
	    <p><input type="text" name="company_email" placeholder="이메일"required/></p>
	    
		<p class="companyAdd_button"><input type="submit" value="회사 추가하기"></p>
	</form>
</div>

</body>
</html>