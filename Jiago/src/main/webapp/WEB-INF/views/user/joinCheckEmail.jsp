<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://webfontworld.github.io/yangheeryu/Dongle.css" rel="stylesheet">
<title>이메일 인증</title>
<style>
	.hidden {
		display: none;
	}
	
	#emailForm {
		width: 500px;
		margin: 100px auto;
	}
	
	form {
		width: 300px;
		margin: 0 auto;
	}
	
	input {
		width: 300px;
		font-size: 30px;
		font-family: 'Dongle';
		box-sizing: border-box;
	}
	
	input[type="text"] {
		border: 3px solid #2b524a;
		border-radius: 15px;
	}
	
	input[type="text"]:focus {
		outline: 3px solid lightgreen;
	}
	
	input[type="submit"] {
		margin-top:10px;
		border: none;
		border-radius: 15px;
		cursor: pointer;
	}
	
	input[type="submit"]:hover {
		background-color: #2b524a;
	}
</style>
</head>


<body>
	<div id="emailForm" class="hidden">
		<form class="form">
			<input id="inputNum" type="text" placeholder="인증번호 입력" required><br>
			<input type="submit" value="입력">
		</form>
	</div>
	
	
<script>
	const url = '${cpath}/user/sendJoinEmail/${email}/'
	const emailForm = document.getElementById('emailForm')
	
	fetch(url)
	.then(response => response.text())
	.then(text => {
		if(text.includes('중복') == true || text.includes('문제') == true) {
			if(window.confirm(text + ' 창을 닫으시겠습니까?')) window.close();
		}
		else {
			alert(text)
			emailForm.classList.remove('hidden')
		}
	})
	
	const form = document.querySelector('.form')
	console.log(form)
	
	function formHandler(event) {
		event.preventDefault()
		const inputNum = document.getElementById('inputNum').value
		const url = '${cpath}/user/equalCheckNumber/' + inputNum + '/'
		
		fetch(url)
		.then(response => response.text())
		.then(text => {
			console.log(text)
			if(text == '인증완료') {
				emailForm.classList.add('hidden')
				const parentPage = opener.document.getElementById("userEmail")
				parentPage.name = 'user_email'
				parentPage.value = "${email}";
				if(window.confirm('인증에 성공하였습니다. 창을 닫으시겠습니까?')) window.close();
			}
			else alert('인증에 실패했습니다. 다시 시도해 주세요.')
		})
		
	}
	form.onsubmit = formHandler

	
</script>
</body>
</html>