<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>
	.hidden {
		display: none;
	}
</style>
</head>
<body>
	
	<div id="pwCheck">
		<form method="POST">
			<div><input type="password" name="input_pw" placeholder="비밀번호를 입력하세요" required autocomplete="off"></div>
			<div><input type="submit" value="입력"></div>
		</form>
	</div>



	<div id="changePw" class="hidden">
		<form method="POST">
			<div>
				<input type="password" name="user_pw" placeholder="변경할 비밀번호를 입력">
				<span class="pwMessage1"></span>
			</div>
			<div>
				<input type="password" name="user_pw_check" placeholder="비밀번호 확인">
				<span class="pwMessage2"></span>
			</div>
			<input type="submit" value="변경" class="btn" disabled>
		</form>
	</div>
	
		<script>
		const pwCheck = document.getElementById('pwCheck')	// 비밀번호 검사
		const changePw = document.getElementById('changePw')
		const modifyPw = document.querySelector('input[name="user_pw"]') // 새로운 비밀번호 입력
		const checkPw = document.querySelector('input[name="user_pw_check"]') // 비밀번호 확인
		const pwMessage1 = document.querySelector('.pwMessage1')	// 비밀번호 조건 메세지
		const pwMessage2 = document.querySelector('.pwMessage2')	// 비밀번호 확인 메세지
		
		
	
		document.forms[0].onsubmit = function(event) {
			event.preventDefault()
			
			const inputPw = document.querySelector('input[name="input_pw"]').value
			console.log(inputPw)
			
			const item1 = {
				idx: '${idx }',
				inputPw: inputPw
			}
			
			const url = '${cpath}/popUp/pwCheck'
			const tmp = {
					method: 'POST',
					body: JSON.stringify(item1),
					headers: {
						'Content-Type': 'application/json; charset=utf-8'
					}	
			}
			
			fetch(url,tmp)
			.then(response => response.text())
			.then(text => {
				if(text == 1) {
					pwCheck.classList.add('hidden')
					changePw.classList.remove('hidden')
				}
				else alert('비밀번호가 틀렸습니다.')
			})
		}
	</script>
	
	
	
	
	
	
	
	<script>

		
		function pwHandler1(event) {
			const addPwValue = event.target.value
			if(addPwValue.length > 16) {
				pwMessage1.innerText = '비밀번호는 최대 16자리까지만 가능합니다'	
				pwMessage1.style.color = 'red'
			}
			else {
				pwMessage1.innerText = '사용가능한 비밀번호 입니다'
				pwMessage1.style.color = 'blue'
			}
		}
		
		modifyPw.onkeyup = pwHandler1
		
		
		function pwHandler2(event2) {
			const btn = document.querySelector('.btn')
			const checkPwValue = event2.target.value
			console.log('위' + modifyPw.value)
			console.log('아래' + checkPwValue)
			if(checkPwValue == modifyPw.value ) {
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
		
		checkPw.onkeyup = pwHandler2
		
		function pwUpdate(event) {
			event.preventDefault()
			url = '${cpath}/popUp/pwUpdate'
			
			const item2 = {
				idx: '${idx }',
				modifyPw: modifyPw.value,
				checkPw: checkPw.value
			}
			const cls = {
				method: 'POST',
				body: JSON.stringify(item2),
				headers: {
					'Content-Type': 'application/json; charset=utf-8'
				}	
			}
			fetch(url, cls)
			.then(response => response.text())
			.then(text => {
				console.log(text)
				if(text == 1) {
					alert('비밀번호가 성공적으로 수정되었습니다.')
					window.close();
					
				}
				
			})
			
			
		}
		
		
		
		
		
		document.forms[1].onsubmit = pwUpdate
		
		
		
		
		
		
	
	</script>
	
	
	
	
</body>
</html>