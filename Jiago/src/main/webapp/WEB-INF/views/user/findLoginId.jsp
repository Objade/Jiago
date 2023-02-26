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

	.imglogo > a > img {
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
	}
	
	input[type="submit"] {
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
	
		#check {
		width: 600px;
		margin: 150px auto;
	}
	
	#check > form > p {
		width: 300px;
		margin: 0 auto;
		
	}
	
	#check > form > p > input {
		width: inherit;
		box-sizing: border-box;
	}
	
	#check > form > p > input[type="text"] {
		background-color: white;
		color: black;
		border: 1px solid darkgrey;
	}
	
	#result {
		width: 600px;
		margin: 150px auto;
	}
	
	#result > div {
		font-size: 30px;
	}
	
	.idList {
		text-align: center;
	}
	
	#reuslt > otherlink {
		margin-bottom: 20px;
		
	}
	
	
</style>
</head>
<body>

	
<div class="imglogo hidden"><a href="${cpath }/"><img src="${cpath }/resources/img/logo.png"></a></div>
<div id="findUserId">
	<div class="message">회원가입시 설정한 이메일을 입력해주세요</div>
	<div id="inputEmail">
		<form id="idForm">
			<div><input id="userEmail" type="email" name="id" placeholder="인증번호를 받을 이메일 주소 입력"></div>
			<div><input type="submit" value="전송"></div>
		</form>
	</div>	
	<div class="otherlink">비밀번호가 기억나지 않는다면?&nbsp; &nbsp;<a href="${cpath }/user/findLoginPw">비밀번호 찾기</a></div>
</div>



<div id="check" class="hidden">	<!-- class="hidden"  -->
	<form id="checkForm">
		<p><input type="text" id="checkNumber" name="checkNumber" placeholder="인증번호를 입력하세요"></p>
		<div id="timer" style="font-family: 'dongle'; font-size: 20px; margin-left: 165px;"></div>
		<p><input type="submit" value="인증"></p>
	</form>
</div>


<div id="result">
	<div class="otherlink hidden">비밀번호가 기억나지 않는다면?&nbsp; &nbsp;<a href="${cpath }/user/findLoginPw">비밀번호 찾기</a></div>
</div>

<p id="next" class="hidden">
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
			if(text != 0) {
				numcheck.classList.remove('hidden')
				findUserId.classList.add('hidden')
				alert('인증번호가 발송되었습니다. 메일을 확인해주세요')
				
				// 2분 타이머 설정
				let secondsLeft = 120;
				const timerDiv = document.getElementById('timer');
				let timer = setInterval(() => {
					secondsLeft--
					if (secondsLeft === 0) {
						clearInterval(timer)
						alert('시간이 초과되었습니다. 다시 시도해주세요.')
						numcheck.classList.add('hidden')
						findUserId.classList.remove('hidden')
						return
					} else {
						timerDiv.innerHTML = '남은 시간 : ' + secondsLeft +'초'
					}
				}, 1000)
				
				
			}
			else {
				alert('존재하지 않는 메일 주소 입니다.')
				return
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
			.then(response => response.json())
			.then(text => {
				const result = document.getElementById('result')
				if(text[0] != '없음') {
					alert('인증이 완료되었습니다')
					const result = document.getElementById('result')
					const imgLogo = document.querySelector('.imglogo')
					imgLogo.classList.remove('hidden')
					numcheck.classList.add('hidden')
					let count = 1;
					text.forEach(id => {
						const tmp = document.createElement('div')
						tmp.classList.add('idList')
						tmp.innerText = count + '. ' + id
						result.appendChild(tmp)
						count++;
					})
					const passwordFindLink = document.querySelector('#result > .otherlink')
					passwordFindLink.classList.remove('hidden')
				}
				else {
					alert('인증번호가 일치하지 않습니다. 다시 확인해주세요')
					return
				}
			})
		}
	checkmessage.onsubmit = checknumber
</script>


</body>
</html>