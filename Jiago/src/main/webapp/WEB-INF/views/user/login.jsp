<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style type="text/css">
	#loginLogo > img {
		width: inherit;
		
	}
	
	#loginLogo {
		width: 400px;
		margin: 0 auto;
		margin-top: 50px;
	}
	
	#accountInput {
		box-sizing: border-box;
		width: 500px;
		margin: 0 auto;
		margin-top: 50px;
		border: 3px solid darkgrey;
		border-radius: 25px;
	}
	
	.idForm {
		box-sizing: border-box;
		width: 400px;
		margin: 50px auto;
	}
	

	.id , .password {
		width: 300px;
		display: flex;
		justify-content: center;
		align-items: center;
		z-index: 1;
  		opacity: 1;	
		border: 1px solid #ccc;
		box-sizing: border-box;
		margin: 0 auto;
		cursor: text;
	}
	
	.idText , .pwText {
		width: 200px;
	}
	
	.idForm > div > input {
		font-size: 20px;
		padding: 10px 20px;
		border:0 solid black;
	}
	
	.idForm > div > input:focus {
		outline-style: none;
	}
	
	.idForm > div:focus {
		outline-color: #008037;
	}
</style>
</head>
<body>
	<div id="loginLogo"><img src="${cpath}/resources/img/로고.png "></div>
	
	<form method="POST">
		<div id="accountInput">
			<div class="idForm">
				<div class="id">
					<img src="${cpath }/resources/loginImg/login.png">
					<input class="idText" type="text" name="id" placeholder="아이디" autocomplete="off" required>
				</div>
				<div class="password">
					<img src="${cpath }/resources/loginImg/password.png">
					<input class="pwText" type="password" name="pw" placeholder="비밀번호" autocomplete="off" required>
				</div>
			</div>		
		</div>
	</form>
	

	<script>
		function outlineSet(event) {
			const idsolid = document.querySelector('.id')
			const pwsolid = document.querySelector('.password')
			
			idsolid.style.border = '1px solid #ccc'
			pwsolid.style.border = '1px solid #ccc'
			
			console.log(event.target.name)
			if(event.target.name == 'id') {
				idsolid.style.border = '2px solid #008037'
			}
			else {
				pwsolid.style.border = '2px solid #008037'			
			}
			
		}
	
		const inputId = document.querySelector('.idText')
		const inputPw = document.querySelector('.pwText');
		console.log(inputId)
		console.log(inputPw)
		
		
		
		inputId.onfocus = outlineSet
		inputPw.onfocus = outlineSet
		
		
	</script>
	
	
</body>
</html>