<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://webfontworld.github.io/yangheeryu/Dongle.css" rel="stylesheet">
<title>비밀번호 찾기</title>
<style>
	html {
		font-family: 'Dongle';
	}

	#findUserPw {
		width: 800px;
		margin: 0 auto;
	}
	
	.imglogo {
		display: flex;
		justify-content: center;
		margin-top: 70px;
	}

	.imglogo > img {
		width: 300px;
	}
	
	.message {
		font-weight: bolder;
		font-size: 35px;
	 	text-align: center;
	 	margin-top: 10px;
	}
	
	#inputId {
		display: flex;
		justify-content: center;
		margin-top: 30px;
	}
	
	input {
		width: 450px;
		font-size: 30px;
		padding: 5px 10px;
		box-sizing: border-box;
		margin: 10px;
		border: solid 1px #bbbbbd;
		border-radius: 10px;
		box-shadow: 0 1px 5px 0 rgb(0 0 0 / 5%);
		font-family: 'Dongle';
	}
	
	
	input:focus {
		outline-color: #008037;
	}
	
	input[type="text"] {
		background-image: url(${cpath}/resources/loginImg/아이디확인.png);
  		background-position: 20px center;
  		background-size: 30px;
 		background-repeat: no-repeat;
		text-indent: 50px;
	}
	
	input:not([type="text"]) {
		border: solid 1px rgba(0,0,0,.05);
		background-color: #008037;
		color: white;
		cursor: pointer;
	}
	
	.otherlink {
		text-align: center;
		margin-top: 30px;
		font-size: 25px;
	}
	
	a {
		text-decoration: none; 
		color: #008037;
	}
	
	.foot {
		margin-top: 50px;
		font-size: 20px;
		text-align: center;
		color: rgba(0,0,0,.6);
	}
	.foot > a {
		color: rgba(0,0,0,.6);
	}
</style>
</head>
<body>


<div id="findUserPw">
	<div class="imglogo"><img src="${cpath }/resources/img/로고.png"></div>
	<div class="message">비밀번호를 찾고자 하는 아이디를 입력해주세요</div>
	<div id="inputId">
		<form id="idForm">
			<div><input type="text" name="id" placeholder="지아고 아이디  또는 단체 아이디"></div>
			<div><input type="submit" value="입력"></div>
		</form>
	</div>	
	<div class="otherlink">아이디가 기억나지 않는다면?&nbsp; &nbsp;<a href="${cpath }/user/findLoginId">아이디 찾기</a></div>
</div>

<div class="foot"><a href="#" style="font-weight: bolder;">JIAGO</a><span style="margin: 0 5px;">|</span><a href="${cpath }/cuscenter">회원정보 고객센터</a></div>		


<script>
	// ID 존재 확인
	const inputId = document.getElementById('inputId')
	const sendId = document.forms[0]
	console.log(inputId)
	console.log(sendId)
	
	function checkUserId(event) {
		event.preventDefault()
		const url = '${cpath}/user/sendId'
		const id = document.querySelector('input[name="id"]').value
		console.log(id)
		
		const opt1 = {
			method: 'POST',
			body: id,
			headers: { 
				'Content-Type': 'application/json; charset=utf-8'
			}
		}
		
		fetch(url,opt1)
		.then(response => response.text())
		.then(text => {
			console.log(text)
			if(text == 1) {
				location.href ='${cpath}/user/pwCheckEmail'
			}
			else {
				alert('잘못된 형식의 아이디입니다.')
			}
		})
	}
	sendId.onsubmit = checkUserId
</script>

</body>
</html>