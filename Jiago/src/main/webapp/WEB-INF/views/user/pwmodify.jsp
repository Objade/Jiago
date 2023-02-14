<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
	<div>
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
		const modifyPw = document.querySelector('input[name="user_pw"]')
		console.log(modifyPw)
		const checkPw = document.querySelector('input[name="user_pw_check"]')
		console.log(checkPw)
		const pwMessage1 = document.querySelector('.pwMessage1')
		const pwMessage2 = document.querySelector('.pwMessage2')
		
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
			
			const item = {
				idx: '${idx }',
				modifyPw: modifyPw.value,
				checkPw: checkPw.value
			}
			const cls = {
				method: 'POST',
				body: JSON.stringify(item),
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
		
		
		
		
		
		document.forms[0].onsubmit = pwUpdate
		
		
		
		
		
		
	
	</script>
	
	
	
	
</body>
</html>