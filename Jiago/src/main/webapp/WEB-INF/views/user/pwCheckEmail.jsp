<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 이메일 찾기 페이지</title>
</head>
	<style>
		#mainForm {
			width: 800px;
		}
		
		.hidden {
			display: none;
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
				<input type="submit" value="인증">
			</p>
		</form>
	</div>
	
	<div id="newPassword" class="hidden">
		<form method="POST" action="${cpath }/user/newPasswordSet">
			<div>
				<span>새로 변경할 비밀번호</span>
				<input type="password" name="password" placeholder="신규 비밀번호 입력" required autocomplete="off">
				<span id="pwMessage1"></span>
			</div>
			<div>
				<span>변경된 비밀번호 확인</span>
				<input type="password" name="passwordCheck" placeholder="신규 비밀번호 확인" required autocomplete="off">
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
		console.log(addPassword)
		const checkPassword = document.querySelector('input[name="passwordCheck"]')
		console.log(checkPassword)
		
		const pwMessage1 = document.getElementById('pwMessage1')
		console.log(pwMessage1)
		const pwMessage2 = document.getElementById('pwMessage2')
		console.log(pwMessage2)	
		
		function pwHandler1(event) {
			const addPwValue = event.target.value
			console.log(addPwValue)
			if(addPwValue.length > 16) {
				pwMessage1.innerText = '비밀번호는 최대 16자리까지만 가능합니다'	
				pwMessage1.style.color = 'red'
			}
			else {
				pwMessage1.innerText = '사용가능한 비밀번호 입니다'
				pwMessage1.style.color = 'blue'
			}
		}
		addPassword.onkeyup = pwHandler1
		
		
		function pwHandler2(event2) {
			const btn = document.querySelector('.btn')
			const checkPwValue = event2.target.value
			console.log('위' + addPassword.value)
			console.log('아래' + checkPwValue)
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