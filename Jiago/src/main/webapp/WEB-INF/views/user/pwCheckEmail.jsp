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
		<form id="checkForm">
			<p>
				<input type="text" name="checkNumber" placeholder="인증번호를 입력하세요">
				<input type="submit" value="인증">
			</p>
		</form>
	</div>
	
	<div id="newPassword" class="hidden">
		<form  method="POST">
			<input type="password">
			<input type="password">
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

			const url = '${cpath}/user/mainSelectResult'
			
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
				if(text == 1) {
					alert('계정에 저장된 이메일 주소로 인증번호를 보냈습니다.')
					event.target.parentNode.classList.add('hidden')
					checkNumber.classList.remove('hidden')
				}
			})

		}			// form[0]
			
		
		document.forms[1].onsubmit = event => {
			event.preventDefault()
			
			const inputValue = event.target.querySelector('input[type="text"]').value
			console.log(inputValue)
			const url = '${cpath}/user/pwCheckNumber'
			
			
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
		
			
			
	
	/* 		document.forms[2].onsubmit = event => {
			event.preventDefault()
			checkNumber.classList.add('hidden')
			event.submit()
		}	 */
	
		
	
	
	</script>
	
	
	
	
</body>
</html>