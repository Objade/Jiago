<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://webfontworld.github.io/yangheeryu/Dongle.css" rel="stylesheet">
<title>비밀번호 변경</title>
<style>

	.hidden {
		display: none;
	}
	
	.pwChangeLogo {
		width: 300px;
		margin: 100px auto;
	}
	.pwChangeLogo > img {
		width: inherit;
	}
	
	#pwCheck , #changePw {
		width: 500px;
		margin: 0 auto;
	}
	
	.inputLocation {
		width: 300px;
		margin: 20px auto;
	}
	
	input {
		width: inherit;
		font-size: 25px;
		text-align: center;
		box-sizing: border-box;
		font-family: 'Dongle';
		border-radius: 10px;
	}
	
	input[type="password"] {
		border: 2px solid #648c85;
	}
	

	
	input[type="submit"] {
		background-color: #1D594E;
		border: 0px solid black;
	}
	
	
	input[type="submit"]:hover {
		cursor: pointer;
		background-color: #648c85;
		transition: background 0.3s ease-in-out;
	}
	
	input:focus {
		outline-color: #1D594E;
	}
	
</style>
</head>
<body>
	
	
	<div class="pwChangeLogo"><img src="${cpath}/resources/img/logo.png"></div>
	
	<div id="pwCheck">
		<form method="POST">
			<div class="inputLocation"><input type="password" name="input_pw" placeholder="비밀번호를 입력하세요" required autocomplete="off"></div>
			<div class="inputLocation"><input type="submit" value="입력"></div>
		</form>
	</div>



	<div id="changePw" class="hidden">
		<form id="modifyStart" method="POST">
			<div class="inputLocation">
				<input id="modifyPw" type="password" placeholder="변경할 비밀번호를 입력">
				<span class="checkPwText1"></span>
			</div>
			<div class="inputLocation">
				<input id="changeCheckPw" type="password" name="user_pw_check" placeholder="비밀번호 확인">
				<span class="checkPwText2"></span>
			</div>
			<div class="inputLocation"><input type="submit" value="변경" class="btn"></div>
		</form>
	</div>
	
	<script>
		const pwCheck = document.getElementById('pwCheck')						// 변경시 비밀번호 검사
		const changePw = document.getElementById('changePw')					// div를 숨기기 위한 전체 div
		const modifyPw = document.getElementById('modifyPw')					// 새로운 비밀번호 입력
		const changeCheckPw = document.getElementById('changeCheckPw') 			// 비밀번호 확인
		const checkPwText1 = document.querySelector('.checkPwText1')			// 비밀번호 조건 메세지
		const checkPwText2 = document.querySelector('.checkPwText2')			// 비밀번호 확인 메세지
		const modifyStart = document.getElementById('modifyStart')
	</script>
		
	<script>
		document.forms[0].onsubmit = function(event) {
			event.preventDefault()
			
			const inputPw = document.querySelector('input[name="input_pw"]').value
			
			const item1 = {
				idx: '${login.user_idx }',
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

	function modifyPwHandler(event) {
		changeCheckPw.value = ''
		checkPwText2.innerText = ''
		const joinPwValue = event.target.value
		if(joinPwValue.length == 0) {
			checkPwText1.innerText = ''
			changeCheckPw.setAttribute('disabled',true)
			return
		}
		const pw_if = /(?=.*[0-9])(?=.*[a-z])(?=.*\W)(?=\S+$).{8,20}/
		if(pw_if.test(joinPwValue)) {
			checkPwText1.innerText = '사용가능한 비밀번호입니다'
			checkPwText1.style.color = 'blue'
			changeCheckPw.removeAttribute('disabled')		// 사용가능한 비밀번호가 아니면 비밀번호 확인 비활성화
		}
		else {
			checkPwText1.innerText = '조건에 부합되지 않은 비밀번호입니다.'
			checkPwText1.style.color = 'red'
			changeCheckPw.setAttribute('disabled',true)
		}
	}
	
	modifyPw.addEventListener('keyup', modifyPwHandler)
	
	
	
	function checkPwHandler(event) {
		const checkPwValue = event.target.value
		if(checkPwValue == modifyPw.value) {
			modifyPw.setAttribute('name','user_pw')
			checkPwText2.innerText = '비밀번호가 서로 일치합니다'
			checkPwText2.style.color = 'blue'
			console.log(modifyPw.value)
		}
		else {
			modifyPw.removeAttribute('name')
			checkPwText2.innerText = '비밀번호가 서로 일치하지 않습니다'
			checkPwText2.style.color = 'red'
		}
	}
	
	changeCheckPw.addEventListener('keyup', checkPwHandler)
	

		
		function pwUpdate(event) {
			event.preventDefault()
			url = '${cpath}/popUp/pwUpdate'
			console.log('${login.user_idx}')
			console.log(modifyPw.value)
			console.log(changeCheckPw.value)
			
			
			const item2 = {
				idx: '${login.user_idx }',
				modifyPw: modifyPw.value,
				checkPw: changeCheckPw.value
			}
			const res = {
				method: 'POST',
				body: JSON.stringify(item2),
				headers: {
					'Content-Type': 'application/json; charset=utf-8'
				}	
			}
			fetch(url, res)
			.then(response => response.text())
			.then(text => {
				console.log(text)
				if(text == 1) {
					alert('비밀번호가 성공적으로 수정되었습니다.')
					window.close();
				}
				else {
					alert('오류가 발생했습니다.')
				}
			})
		}
		
		modifyStart.onsubmit = pwUpdate
		
		
		
		
		
		
	
	</script>
	
	
	
	
</body>
</html>