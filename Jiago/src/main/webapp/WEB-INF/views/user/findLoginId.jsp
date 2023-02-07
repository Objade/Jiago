<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
	.hidden {
		display: none;
	}

</style>
</head>
<body>
	
<fieldset id="send">
	<form id="sendForm">
		<p>
			<input type="email" name="email" placeholder="이메일을 입력하세요">
			<input type="submit" value="인증 번호 발송">
		</p>
	</form>
</fieldset>

<fieldset id="check" class="hidden">
	<form id="checkForm">
		<p>
			<input type="text" name="authNumber" placeholder="인증번호를 입력하세요">
			<input type="submit" value="인증">
		</p>
	</form>
</fieldset>

<p class="next hidden">
	<a href="${cpath }/"><button>home으로 이동</button></a>
</p>




	
<script>
	const sendmessage = document.forms[0]
	console.log(sendmessage)
	const checkmessage = document.forms[1]
	console.log(checkmessage)
	const numcheck = document.getElementById('check')
	console.log(numcheck)
	
	function sendmail(event) {
		event.preventDefault()
		const url = '${cpath}/user/sendNumber'
		const email = document.querySelector('input[name="email"]').value 
		
		fetch(url + '?email=' + email)
		.then(resp => resp.text())
		.then(text => {
			if(text == 1) {
				numcheck.classList.remove('hidden')
				alert('인증번호가 발송되었습니다. 메일을 확인해주세요')
			}
		})
	
		.catch(ex => {	
			console.log(ex)
		})

		
	}
	
	
	sendmessage.onsubmit = sendmail
	


</script>
	
</body>
</html>