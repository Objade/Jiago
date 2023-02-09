<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
	.hidden {
		display: none;
	}

</style>
</head>
<body>
<fieldset id="inputId">
	<form id="idForm">
		<p>
			<input type="text" name="id" placeholder="아이디를 입력하세요">
			<input type="submit" value="입력">
		</p>
	</form>
</fieldset>	
	
	
<fieldset id="send" class="hidden">
	<form id="sendForm">
		<p>
			<input type="email" name="email" placeholder="이메일을 입력하세요">
			<input type="submit" value="인증 번호 발송">
		</p>
	</form>
</fieldset>

<fieldset id="check" class="hidden"> <!-- class hidden 잠시 지워놓음 -->
	<form id="checkForm">
		<p>
			<input type="text" name="checkNumber" placeholder="인증번호를 입력하세요">
			<input type="submit" value="인증">
		</p>
	</form>
</fieldset>

<div id="result">
	
</div>


<p class="next hidden">
	<a href="${cpath }/"><button>home으로 이동</button></a>
</p>

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
		})
	}
	
	
	sendId.onsubmit = checkUserId
</script>
	
	
<!-- <script>




	// 메세지 전송
	const sendcheck = document.getElementById('send')
	const sendmessage = document.forms[1]
	console.log(sendmessage)
	const checkmessage = document.forms[2]
	console.log(checkmessage)
	const numcheck = document.getElementById('check')
	console.log(numcheck)
	
	function sendmail(event) {
		event.preventDefault()
		const url = '${cpath}/user/sendNumber'
		const email = document.querySelector('input[name="email"]').value 
		
		
		const opt1 = {
			method: 'POST',
			body: email,
			headers: {
				'Content-Type': 'application/json; charset=utf-8'
			}
		}
		//console.log(email)
		fetch(url , opt1)
		.then(response => response.text())
		.then(text => {
			//console.log(text)
			if(text == 1) {
				numcheck.classList.remove('hidden')
				sendcheck.classList.add('hidden')
				alert('인증번호가 발송되었습니다. 메일을 확인해주세요')
			}
			else {
				alert('존재하지 않는 메일 주소 입니다.')
			}
		})
	
		.catch(ex => {	
			console.log(ex)
		})
	}
	
	
	sendmessage.onsubmit = sendmail
	
</script>

<script>
	// 메세지 인증
	
	function checknumber(event) {
		event.preventDefault()
		const ob = {
				email: document.querySelector('input[name="email"]').value,
				checkNumber: document.querySelector('input[name="checkNumber"]').value,
			}
		console.log(ob)
		
		const url = '${cpath}/user/sendCheckNumber'
		
			const opt2 = {
				method: 'POST',
				body: JSON.stringify(ob),
				headers: {
					'Content-Type': 'application/json; charset=utf-8'
				}
			}
		
			fetch(url, opt2)
			.then(response => response.text())
			.then(text => {
				console.log(text)
				const result = document.getElementById('result')
				console.log(result)
				if(text != '') {
					alert('인증이 완료되었습니다')
					numcheck.classList.add('hidden')
					result.innerText = '고객님의 아이디는 ' + text + '입니다.'
					
				}
				else {
					alert('인증번호가 일치하지 않습니다. 다시 확인해주세요')
				}
			})
		}
	checkmessage.onsubmit = checknumber
</script> -->




	
</body>
</html>