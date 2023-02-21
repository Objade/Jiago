<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증</title>
<style>
	.hidden {
		display: none;
	}
</style>
</head>


<body>
	<div id="emailForm" class="hidden">
		<form class="form">
			<input id="inputNum" type="text" placeholder="인증번호 입력" required>
			<input type="submit" value="입력">
		</form>
	</div>
	
	
<script>
	const url = '${cpath}/user/sendJoinEmail/${email}/'
	const emailForm = document.getElementById('emailForm')
	
	fetch(url)
	.then(response => response.text())
	.then(text => {
		if(text.indexOf('중복') == 0) {
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
				document.cookie = 'emailData=' + encodeURIComponent(text)
				if(window.confirm('인증에 성공하였습니다. 창을 닫으시겠습니까?')) window.close();
			}
			else alert('인증에 실패했습니다. 다시 시도해 주세요.')
		})
		
	}
	form.onsubmit = formHandler

	
</script>
</body>
</html>