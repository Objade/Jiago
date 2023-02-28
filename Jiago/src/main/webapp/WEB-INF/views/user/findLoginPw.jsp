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

<link rel="stylesheet" href="${cpath }/resources/css/user/findLoginPw.css" type="text/css">

</head>
<body>


<div id="findUserPw">
	<div class="imglogo"><img src="${cpath }/resources/img/logo.png"></div>
	<div class="message">비밀번호를 찾고자 하는 아이디를 입력해주세요</div>
	<div id="inputId">
		<form id="idForm">
			<div><input type="text" name="id" placeholder="지아고 아이디  또는 단체 아이디"></div>
			<div><input type="submit" value="입력"></div>
		</form>
	</div>	
	<div class="otherlink">아이디가 기억나지 않는다면?&nbsp; &nbsp;<a href="${cpath }/user/findLoginId">아이디 찾기</a></div>
</div>

<div class="foot"><a href="${cpath }/" style="font-weight: bolder;">JIAGO</a><span style="margin: 0 5px;">|</span><a href="${cpath }/cuscenter">회원정보 고객센터</a></div>		


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