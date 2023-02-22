<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://webfontworld.github.io/yangheeryu/Dongle.css" rel="stylesheet">
<title>아이디 찾기</title>
<style>
	.hidden {
		display: none;
	}

	html {
		font-family: 'Dongle';
	}

	#findUserId {
		width: 800px;
		margin: 0 auto;
	}
	
	.imglogo {
		display: flex;
		justify-content: center;
		margin-top: 70px;
	}

	.imglogo > img {
		width: 300px;
	}
	
	.message {
		font-weight: bolder;
		font-size: 35px;
	 	text-align: center;
	 	margin-top: 10px;
	}
	
	#inputEmail {
		display: flex;
		justify-content: center;
		margin-top: 30px;
	}
	
	input {
		width: 450px;
		font-size: 30px;
		padding: 5px 10px;
		box-sizing: border-box;
		margin: 10px;
		border: solid 1px #bbbbbd;
		border-radius: 10px;
		box-shadow: 0 1px 5px 0 rgb(0 0 0 / 5%);
		font-family: 'Dongle';
	}
	
	
	input:focus {
		outline-color: #1D594E;
	}
	
	
	input:not([type="email"]) {
		border: solid 1px rgba(0,0,0,.05);
		background-color: #1D594E;
		color: white;
		cursor: pointer;
	}
	
	.otherlink {
		text-align: center;
		margin-top: 30px;
		font-size: 25px;
	}
	
	a {
		text-decoration: none; 
		color: #1D594E;
	}
	
	.foot {
		margin-top: 50px;
		font-size: 20px;
		text-align: center;
		color: rgba(0,0,0,.6);
	}
	.foot > a {
		color: rgba(0,0,0,.6);
	}
</style>
</head>
<body>


<div id="findUserId">
	<div class="imglogo"><img src="${cpath }/resources/img/logo.png"></div>
	<div class="message">회원가입시 설정한 이메일을 입력해주세요</div>
	<div id="inputEmail">
		<form id="idForm">
			<div><input id="userEmail" type="email" name="id" placeholder="인증번호를 받을 이메일 주소 입력"></div>
			<div><input type="submit" value="전송"></div>
		</form>
	</div>	
	<div class="otherlink">비밀번호가 기억나지 않는다면?&nbsp; &nbsp;<a href="${cpath }/user/findLoginPw">비밀번호 찾기</a></div>
</div>





<fieldset id="check" class="hidden">
	<form id="checkForm">
		<p>
			<input type="text" id="checkNumber" name="checkNumber" placeholder="인증번호를 입력하세요">
			<input type="submit" value="인증">
		</p>
	</form>
</fieldset>

<div id="result">
	
</div>


<p class="next hidden">
	<a href="${cpath }/"><button>home으로 이동</button></a>
</p>


<div class="foot"><a href="${cpath }/" style="font-weight: bolder;">JIAGO</a><span style="margin: 0 5px;">|</span><a href="${cpath }/cuscenter">회원정보 고객센터</a></div>
	
<script>
	// 메세지 전송
	const findUserId = document.getElementById('findUserId')
	const sendmessage = document.forms[0]
	const checkmessage = document.forms[1]
	const numcheck = document.getElementById('check')
	console.log(numcheck)
	
	function sendmail(event) {
		event.preventDefault()
		const url = '${cpath}/user/sendNumber'
		const userEmail = document.getElementById('userEmail')
		
		
		const opt1 = {
			method: 'POST',
			body: userEmail.value,
			headers: {
				'Content-Type': 'plain/text; charset=utf-8'
			}
		}
		fetch(url , opt1)
		.then(response => response.text())
		.then(text => {
			console.log('안에 값은 = ' + text)
			if(text == 1) {
				numcheck.classList.remove('hidden')
				findUserId.classList.add('hidden')
				alert('인증번호가 발송되었습니다. 메일을 확인해주세요')
			}
			else {
				alert('존재하지 않는 메일 주소 입니다.')
			}
		})

	}
	
	
	sendmessage.onsubmit = sendmail
	
</script>

<script>
	// 메세지 인증
	
	function checknumber(event) {
		event.preventDefault()
		const ob = {
				email: document.getElementById('userEmail').value,
				checkNumber: document.getElementById('checkNumber').value
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
</script>


</body>
</html>