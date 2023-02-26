<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://webfontworld.github.io/yangheeryu/Dongle.css" rel="stylesheet">
<title>비밀번호 이메일 찾기 페이지</title>
</head>
	<style>
	
		.hidden {
			display: none;
		}
	
		body {
			font-family: 'Dongle';
			font-size: 30px;
		}
		#mainForm {
			width: 800px;
			margin: 200px auto;
			text-align: center;
		}
		
		#mainForm > div {
			width: 500px;
			margin: 0 auto;
		}
		
		input {
			font-family: 'Dongle'
		}
		
		input[type="submit"] {
			margin-top: 30px;
			background-color: white;
			border: 2px solid black;
			padding: 10px 20px;
			font-size: 40px;
			border-radius: 15px;
			cursor: pointer;
		}

		#checkNumber {
			width: 500px;
			margin: 0 auto;
		}
		
		#checkNumber > form > p  {
			width: 300px;
			margin: 200px auto;
		}
		
		#checkNumber > form > p > input {
			width: inherit;
			font-size: 30px;
			box-sizing: border-box;
			border-radius: 15px;
		}
		
		input[type="text"] , input[type="password"] {
			padding: 10px 20px;
			border: 3px solid black;
			border-radius: 15px;
			box-sizing: border-box;
		}
		
		input[type="text"]:focus , input[type="password"]:focus {
			outline: 3px solid lightgreen;
		}
		
		input[type="submit"] {
			padding: 0;
			width: 300px;
			background-color: #1D594E;
			color: white;
			border: none;
		}
		
		
		#newPassword {
			width: 900px;
			margin: 180px auto;
		}
		
		#newPassword > form > div {
			width: 600px;
			margin: 0 auto;
		}
		
		#newPassword > form > div > input {
			width: 300px;
			font-size: 35px;
		}
		
		input::placeholder {
			color: #ccc;
		}
		
		
	</style>
<body>
	<%-- <h1>이메일 = ${email }</h1> --%>
	
	
	
	
	<div>
		<form id="mainForm" method="POST">
			<div><input type="radio" name="check" value="phone"> 회원정보에 등록한 휴대전화로 인증 (${user[2] })</div>
			<div><input type="radio" name="check" value="email"> 본인확인 이메일로 인증 (${user[1] })</div>
			<div><input type="submit" value="선택" class="mainSelect"></div>
		</form>
	</div>
	

	<div id="checkNumber" class="hidden">
		<form id="checkForm" method="POST">
			<p>
				<input type="text" name="checkNumber" placeholder="인증번호를 입력하세요">
				<span id="timer" style="font-family: 'dongle'; font-size: 20px;"></span><br>
				<input type="submit" value="인증">
			</p>
		</form>
	</div>
	
	
	
	
	<div id="newPassword" class="hidden">
		<form method="POST" action="${cpath }/user/newPasswordSet">
			<div>
				<div>새로 변경할 비밀번호</div>
				<input type="password" name="password" placeholder="신규 비밀번호 입력" required autocomplete="off">
				<span id="pwMessage1"></span>
				<div style="margin-bottom: 20px; font-size: 20px;">소문자, 숫자, 특수문자 조합의 8 ~ 20자</div>
			</div>
			<div>
				<div>변경된 비밀번호 확인</div>
				<input type="password" name="passwordCheck" disabled placeholder="신규 비밀번호 확인" required autocomplete="off">
				<span id="pwMessage2"></span>
			</div>
			<div><input type="submit" value="변경" disabled class="btn"></div>
		</form>
	</div>
	
	<script>
		const mainResult = '${mainSelect }'
		const mainForm = document.getElementById('mainForm')
		const checkNumber = document.getElementById('checkNumber')
		const newPassword = document.getElementById('newPassword')
		console.log(mainForm)

		document.forms[0].onsubmit = (event) => {
			event.preventDefault()
			//...
// 			console.log(this.check.value)
// 			console.log(event.check.value)
			const checkedValue = event.target.querySelector('input:checked').value
			console.log(checkedValue)

			const url = '${cpath}/user/findType'
			
			const item =  {
				email: '${user[0] }',
				type: checkedValue,
			}
			console.log(item)
			
			const cls = {
				method: 'POST',
				body: JSON.stringify(item),
				headers: {
					'Content-Type': 'application/json; charset=utf-8'
				}	
			}
			
			fetch(url , cls)
			.then(response => response.text())
			.then(text => {
				console.log(text)
				if(text == 'email') {
					alert('계정에 저장된 이메일 주소로 인증번호를 보냈습니다.')
					event.target.parentNode.classList.add('hidden')
					checkNumber.classList.remove('hidden')
					
				// 2분 타이머 설정
				let secondsLeft = 120
				const timerDiv = document.getElementById('timer');
				let timer = setInterval(() => {
					secondsLeft--;
					if (secondsLeft === 0) {
						clearInterval(timer)
						alert('시간이 초과되었습니다. 다시 시도해주세요.');
						event.target.parentNode.classList.remove('hidden')
						checkNumber.classList.add('hidden')
						return
					} else {
						timerDiv.innerHTML = '남은 시간 : ' + secondsLeft +'초'
					}
				}, 1000)
					
				}
				else {
					alert('휴대폰 인증 미구현')
					
				}
			})

		}			// form[0]
			
		
		

		
		
		
		
		document.forms[1].onsubmit = event => {
			event.preventDefault()
			
			const inputValue = event.target.querySelector('input[type="text"]').value
			console.log(inputValue)
			const url = '${cpath}/user/pwFindMailNumber'
			
			
			const cls = {
					method: 'POST',
					body: inputValue,
					headers: {
						'Content-Type': 'plain/text; charset=utf-8'
					}	
			}
			
			fetch(url ,cls)
			.then(response => response.text())
			.then(text => {
				console.log(text)
				if(text == 1) {
					alert('인증에 성공하였습니다.')
					event.target.parentNode.classList.add('hidden')
					newPassword.classList.remove('hidden')
					
				} else {
					alert('인증번호가 틀렸습니다.')
				}
			})
		}
		
		const addPassword = document.querySelector('input[name="password"]')
		const checkPassword = document.querySelector('input[name="passwordCheck"]')
		const pwMessage1 = document.getElementById('pwMessage1')
		const pwMessage2 = document.getElementById('pwMessage2')
		const btn = document.querySelector('.btn')
		
		function pwHandler1(event) {
			const addPwValue = event.target.value
			pwMessage2.innerText = ''
			btn.disabled = true
			if(addPwValue.length == 0) {
				pwMessage1.innerText = ''
				checkPassword.disabled = true
				return
			}
			
			const pw_if = /(?=.*[0-9])(?=.*[a-z])(?=.*\W)(?=\S+$).{8,20}/
			if(pw_if.test(addPwValue)) {
				pwMessage1.innerText = '사용가능한 비밀번호입니다.'	
				pwMessage1.style.color = 'blue'
				checkPassword.disabled = false
			}
			else {
				pwMessage1.innerText = '조건에 부합되지 않은 비밀번호입니다.'
				pwMessage1.style.color = 'red'
				checkPassword.value = ''
				checkPassword.disabled = true
			}
		}
		addPassword.onkeyup = pwHandler1
		
		
		function pwHandler2(event) {
			const checkPwValue = event.target.value
			if(checkPwValue.length == 0) {
				pwMessage2.innerText = ''
				btn.disabled = true
				return
			}
			
			if(checkPwValue == addPassword.value ) {
				pwMessage2.innerText = '비밀번호가 서로 일치합니다'
				pwMessage2.style.color = 'blue'
				btn.disabled = false
			}
			else {
				pwMessage2.innerText = '비밀번호가 서로 일치하지 않습니다'
				pwMessage2.style.color = 'red'
				btn.disabled = true
			}
		}
		
		checkPassword.onkeyup = pwHandler2
		

		
			
			
	

		
	
	
	</script>
	
	
	
	
</body>
</html>