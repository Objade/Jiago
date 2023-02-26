<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://webfontworld.github.io/yangheeryu/Dongle.css" rel="stylesheet">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>회원가입 페이지</title>
<style>
	
	body {
		font-family: 'Dongle';
	}
	
	.warningImg {
		background-image: url(${cpath}/resources/userImg/경고.png);
  		background-position: 20px center;
  		background-size: 30px;
 		background-repeat: no-repeat;
		text-indent: 50px;
	}
	
	.hidden { display: none}

	/* 약간 동의 */
	.contract {
	    width: 700px; margin: 50px auto 80px; padding: 30px 40px 50px;
	    border-radius: 30px; background-color: #50684f;
	}
	.contract h1 {text-align: center; font-size: 60px;}
	.contract .text {
	    height: 230px; border: 3px solid black; background-color: white;
	    white-space: pre-line; overflow-y: scroll; margin: 0 auto 20px;
	    font-size: 30px; border-radius: 5px;
	}	
	.contract p {text-align: right;}
	.contract .box {width: 100px; height: 40px;  padding: 8px; margin: 0 3px;}
		
	.text > span {color: red; font-size: 40px;}
	
			


	/* 회원가입 css */
	#logoImg {
		width: 300px;
	}


	#joinForm {
		width: 1200px;
		margin: 0 auto;
	}
	
	form > div  {
		font-size: 25px;
	}
	
	#joinForm > form > div > input , form > div > button , div > select
		{
		font-family: 'Dongle';
		width: 300px;
		font-size: 35px;
		box-sizing: border-box;
		padding: 0 10px;
		border: 3px solid #1D594E;
		border-radius: 15px;
	}
	
	form > div > button {
		width: 100px;
		margin-left: 15px;
		background-color: white;
	}
	
	button:hover {
		color: #1D594E;
		cursor: pointer;
	}
	
	
	input::placeholder {
		position: absolute;
		font-size: 40px;
		font-family: 'Dongle';
		top:100%; 
		margin-top:-50px;
		color: #ccc;
	}
	
	input:focus {
		outline: 3px solid lightgreen;
	}
	
	#joinForm > form > div {
		width: 800px;
		margin: 40px auto;
	}
	
	.phone > input {
		width: 90px !important;
		
	}
	
	div > span {
		margin-left: 25px;
	}

	.inputCheck >  button {
		width: 100px !important;
		margin-left: 25px;
		background-color: #648c85;
	}


	
	input[type="date"] {
		position: relative;
	 	background: url("${cpath}/resources/userImg/calendar.png") no-repeat right 15px center / 35px auto;
	 	border: 1px solid #000;
	 }
	input[type="date"]::-webkit-clear-button,
	input[type="date"]::-webkit-inner-spin-button {display: none;}
	input[type="date"]::-webkit-calendar-picker-indicator {
		position: absolute;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		background: transparent;
		color: transparent;
		cursor: pointer;
	}
	
	input[type="date"]::before {
		content: attr(data-placeholder);
		width: 100%;
	}
	input[type="date"]:valid::before {
		display: none;
	}
	input[data-placeholder]::before {
		color: #757575;
	}
	
	
	[type="radio"] {
	  vertical-align: middle;
	  appearance: none;
	  border: max(2px, 0.1em) solid gray;
	  border-radius: 50%;
	  width: 1.25em;
	  height: 1.25em;
	  transition: border 0.5s ease-in-out;
	}
	
	[type="radio"]:checked {
	  border: 0.4em solid tomato;
	}
	
	[type="radio"]:focus-visible {
	  outline-offset: max(2px, 0.1em);
	  outline: max(2px, 0.1em) dotted tomato;
	}
	
	[type="radio"]:hover {
	  box-shadow: 0 0 0 max(4px, 0.2em) lightgray;
	  cursor: pointer;
	}
	
	[type="radio"]:disabled {
	  background-color: lightgray;
	  box-shadow: none;
	  opacity: 0.7;
	  cursor: not-allowed;
	}
	
	[type="radio"]:disabled + span {
	  opacity: 0.7;
	  cursor: not-allowed;
	}
	
	.addressForm > input {
		margin: 5px 0;
	}
	
	input[type="button"] , input[type="submit"] {
		background-color: white;
		cursor: pointer;
	}
	
	input[type="button"]:hover , input[type="submit"]  {
		color: #1D594E;
	}
	
	a > img {width: 300px;}

	

</style>
</head>



<body>
	
<a href="${cpath }/"><img src="${cpath }/resources/img/logo.png"></a>
<div>
    <form class="contract" action="signup.html">
        <h1 style="color:white;">계정 정보 동의 약관</h1>
	        <div class="text"><span>가.</span> 개인정보의 수집 및 이용 목적
	
			            본 사이트 JIAGO는 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
			    
			    <span>나.</span> 정보주체와 법정대리인의 권리ㆍ의무 및 행사방법
			            ① 정보주체(만 14세 미만인 경우에는 법정대리인을 말함)는 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.
			            ② 제1항에 따른 권리 행사는 개인정보보호법 시행규칙 별지 제8호 서식에 따라 작성 후 서면, 전자우편 등을 통하여 하실 수 있으며, 기관은 이에 대해 지체 없이 조치하겠습니다.
			            ③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.
			            ④ 개인정보 열람 및 처리정지 요구는 개인정보 보호법 제35조 제5항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.
			            ⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.
			            ⑥ 정보주체 권리에 따른 열람의 요구, 정정ㆍ삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.
			            
			     <span>다.</span> 수집하는 개인정보의 항목
			      JIAGO 회원정보(필수): 이름, 이메일(아이디), 비밀번호
			            
			     <span>라.</span> 개인정보의 보유 및 이용기간
			      JIAGO는 법령에 따른 개인정보 보유ㆍ이용기간 또는 정보주체로부터 개인정보를 수집 시에 동의 받은 개인정보 보유ㆍ이용기간 내에서 개인정보를 처리ㆍ보유합니다.
			            
			            - 수집근거: 정보주체의 동의
			            - 보존기간: 회원 탈퇴 요청 전까지(1년 경과 시 재동의)
			            - 보존근거: 정보주체의 동의
			            
			     <span>마.</span> 동의 거부 권리 및 동의 거부에 따른 불이익
			            위 개인정보의 수집 및 이용에 대한 동의를 거부할 수 있으나, 동의를 거부할 경우 회원 가입이 제한됩니다.
	        </div>
        <div>
            <p style="font-size: 30px; color:white;"><input type="checkbox" required class="agbtn"> 약관에 동의하면 체크</p>
        </div>
    </form>
</div>



	
	<div id="joinForm" class="hidden"> <!-- class="hidden"  -->
		<form method="POST" action="${cpath }/user/join">
			<div>
				<div style="font-size: 32px;">아이디</div>
				<input type="text" name="" id="joinId" placeholder="신규 아이디 입력" required autocomplete="off"><button type="button" onclick="joinIdCheck()">중복 검사</button><span class="checkIdText"></span>
				<div>영문자로 시작하는 영문자 + 숫자의 조합의 6 ~ 12자 </div>
			</div>
			
			<div>
				<div>비밀번호</div>
				<input type="password" name="" id="joinPw" placeholder="신규 비밀번호 입력" required autocomplete="off"><span class="checkPwText1"></span>
				<div>소문자, 숫자, 특수문자 조합의 8 ~ 20자</div>
			</div>
			<div>
				<div>비밀번호 확인</div>
					<input type="password" id="checkPw" disabled placeholder="신규 비밀번호 확인" required autocomplete="off"><span class="checkPwText2"></span>
				</div>
			<div>
				<div>별명, 닉네임</div>
				<input type="text" id="joinName" name="" placeholder="유저 이름" required autocomplete="off"><span class="nameCheckMessage"></span>
				<div>한글, 숫자 , 영문 자유 형식의 4 ~ 12자</div>
			</div>
			<div>
				<div>생년월일</div>
					<input type="date" name="user_birth" data-placeholder="생일 입력" required>
				</div>
			<div>
				<div>성별</div>
				  <label>
				    <input type="radio" name="user_gender" value="남성" required/>
				    <span>남성</span>
				  </label>
				  <label style="margin-left: 20px;">
				    <input type="radio" name="user_gender" value="여성" required />
				    <span>여성</span>
				  </label>
			</div>
			<div class="addressForm">
				<div>주소</div>
				<input type="text" id="postcode" placeholder="우편번호" required>
				<input type="button" onclick="findUserAddress()" value="우편번호 찾기" required><br>
				<input type="text" id="address" placeholder="주소" required><br>
				<input type="text" id="detailAddress" placeholder="상세주소" required>
				<input type="text" id="extraAddress" placeholder="참고항목" required>
				<input type="hidden" id="userAddress" name="" >
			</div>
			<div class="phone">
				<div>휴대 전화</div>
            	<input id="phone1" type="text" size="1" maxlength="3" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'); changePhone1()" required> -
            	<input id="phone2" type="text" size="3" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'); changePhone2()" required> -
            	<input id="phone3" type="text" size="3" maxlength="4" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1'); changePhone3()" required>
      			<input type="hidden" id="userPhone" name="" >
      		</div>
      		<div>
      			<div>이메일</div>
      			<input id="email1" type="text"> @ 
      			<select id="email2" required>
      				<option value="">--주소를 선택하세요--</option>
      				<option value="naver.com">naver.com</option>
      				<option value="gmail.com">gmail.com</option>
      				<option value="직접 입력">직접 입력하세요</option>
      			</select>
      			<input type="text" id="directEmail" class="hidden" disabled style="margin-top: 5px;" required placeholder="직접 입력">
      			<button id="checkEmailSend" type="button" style="width: 150px">인증메일 전송</button>
      			<input type="hidden" id="userEmail" name="">
      		</div>
      		
			<div>
				<div>직업</div>
				<select name="user_job" id="job-select" required>
				    <option value="">--직업을 선택하세요--</option>
				    <option value="전업주부">전업주부</option>
				    <option value="학생">학생</option>
				    <option value="무직">무직</option>
				    <option value="생산/기술직/무직">생산/ 기술직/ 노무직</option>
				    <option value="사무직">사무직</option>
				    <option value="교사/학원강사">교사 / 학원강사</option>
				    <option value="공무원 (공기업포함)">공무원 (공기업포함)</option>
				    <option value="경영직">경영직</option>
				    <option value="전문직">전문직</option>
				    <option value="서비스/영업/판매직">서비스 / 영업 / 판매직</option>
				    <option value="농/임/어업">농 / 임 / 어업</option>
				    <option value="자영업">자영업</option>
				    <option value="기타">기타</option>
				</select>
			</div>
			<div><input type="hidden" name="user_type" value="Member"></div> <!-- 얘는 임시 -->
			<div><input type="submit" value="입력"></div>
		</form>
	</div>
	

<script>
	// 약간 동의 체크시 히든 회원가입 폼 히든 삭제
	const contract = document.forms[0]	// 약간동의 폼
	const joinForm = document.forms[1]	// 회원가입 폼
	
	const agbtn = document.querySelector('.agbtn')

	function btnHandler() {
		contract.parentNode.classList.add('hidden')
		joinForm.parentNode.classList.remove('hidden')
	}
	agbtn.onclick = btnHandler
	
</script>
	
<script>
	// 회원 가입 시 아이디 중복 검사
		const joinId = document.getElementById('joinId')			// 아이디 input폼
		const checkIdText = document.querySelector('.checkIdText')	// 조건 일치 여부 및 중복 여부 확인 문장


	
	function joinIdCheck() {
		
		const url = '${cpath}/user/joinId/' + joinId.value + '/'
		
		fetch(url)
		.then(response => response.text())
		.then(text => {			 
			const id_if = /^(?=.*[0-9]+)[a-zA-Z][a-zA-Z0-9]{5,12}$/g
			if(text == 0 && id_if.test(joinId.value)) {
				checkIdText.innerText = '회원가입이 가능한 아이디 입니다.'
				checkIdText.style.color = 'blue'
				joinId.name = 'user_id'
				console.log(joinId.name)
			}
			else {
				checkIdText.innerText = '조건이 맞지 않거나 중복된 계정이 존재합니다.'
				checkIdText.style.color = 'red'
				joinId.name = ''
			}
		})
	}
</script>

<script>

		// 비밀번호 입력 및 확인
		const joinPw = document.getElementById('joinPw')				// 새로운 비밀번호 입력
		const checkPw = document.getElementById('checkPw') 				// 비밀번호 확인
		const checkPwText1 = document.querySelector('.checkPwText1')	// 비밀번호 조건 메세지
		const checkPwText2 = document.querySelector('.checkPwText2')	// 비밀번호 확인 메세지


		function joinPwHandler(event) {
			checkPw.value = ''
			checkPwText2.innerText = ''
			const joinPwValue = event.target.value
			if(joinPwValue.length == 0) {
				checkPwText1.innerText = ''
				checkPw.setAttribute('disabled',true)
				return
			}
			const pw_if = /(?=.*[0-9])(?=.*[a-z])(?=.*\W)(?=\S+$).{8,20}/
			if(pw_if.test(joinPwValue)) {
				checkPwText1.innerText = '사용가능한 비밀번호입니다'
				checkPwText1.style.color = 'blue'
				checkPw.removeAttribute('disabled')		// 사용가능한 비밀번호가 아니면 비밀번호 확인 비활성화
			}
			else {
				checkPwText1.innerText = '조건에 부합되지 않은 비밀번호입니다.'
				checkPwText1.style.color = 'red'
				
				checkPw.setAttribute('disabled',true)
			}
		}
		
//		joinPw.onkeyup = pwHandler1
		joinPw.addEventListener('keyup', joinPwHandler)
		
		
		
		function checkPwHandler(event) {
			const checkPwValue = event.target.value
			if(checkPwValue.length == 0) {
				checkPwText2.innerText = ''
			}
			if(checkPwValue == joinPw.value) {
				joinPw.name = 'user_pw'
				checkPwText2.innerText = '비밀번호가 서로 일치합니다'
				checkPwText2.style.color = 'blue'
				console.log(joinPw.value)
			}
			else {
				joinPw.name = ''
				checkPwText2.innerText = '비밀번호가 서로 일치하지 않습니다'
				checkPwText2.style.color = 'red'
			}
		}
		
// 		checkPw.onkeyup = pwHandler2	
		checkPw.addEventListener('keyup', checkPwHandler)
</script>


<script>
	const joinName = document.getElementById('joinName')
	console.log(joinName)
	
	
	function nameCheckHandler(event) {
		const name_if = /[0-9]|[a-z]|[A-Z]|[가-힣]{4,12}$/g
		const inputName = event.target.value
		const nameCheckMessage = document.querySelector('.nameCheckMessage')
		
		if(inputName.length == 0) {
			nameCheckMessage.innerText = ''
			return
		}
		if(name_if.test(inputName) && inputName.length >= 4 && inputName.length <= 12) {
			const url = "${cpath}/user/joinName/" + inputName + "/"
			fetch(url)
			.then(response => response.text())
			.then(text => {
				console.log(text)
				if(text != 1) {
					console.log(joinName.name)
					joinName.name = 'user_name'
					nameCheckMessage.innerText = '사용 가능한 별명 입니다.'
					nameCheckMessage.style.color = 'blue'
					return
				}
			})
		}
		else {
			joinName.name = ''
			nameCheckMessage.innerText = '이미 존재하는 이름이거나 조건 양식에 맞지 않습니다.'
			nameCheckMessage.style.color = 'red'
		}	
	}
	joinName.onkeyup = nameCheckHandler


</script>

<script>
	// 주소 입력
	function findUserAddress() {
	  new daum.Postcode({
	     oncomplete: function(data) {
             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

             // 각 주소의 노출 규칙에 따라 주소를 조합한다.
             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
             var addr = ''; // 주소 변수
             var extraAddr = ''; // 참고항목 변수

             //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
             if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                 addr = data.roadAddress;
             } else { // 사용자가 지번 주소를 선택했을 경우(J)
                 addr = data.jibunAddress;
             }

             // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
             if(data.userSelectedType === 'R'){
                 // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                 // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                     extraAddr += data.bname;
                 }
                 // 건물명이 있고, 공동주택일 경우 추가한다.
                 if(data.buildingName !== '' && data.apartment === 'Y'){
                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                 }
                 // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                 if(extraAddr !== ''){
                     extraAddr = ' (' + extraAddr + ')';
                 }
                 // 조합된 참고항목을 해당 필드에 넣는다.
                 document.getElementById("extraAddress").value = extraAddr;
             
             } else {
                 document.getElementById("extraAddress").value = '';
             }

             // 우편번호와 주소 정보를 해당 필드에 넣는다.
             document.getElementById('postcode').value = data.zonecode;
             document.getElementById("address").value = addr;
             // 커서를 상세주소 필드로 이동한다.
             document.getElementById("detailAddress").focus();
	     }
  	  }).open();	
	}
	
	const detailAddress = document.getElementById('detailAddress')
	const userAddress = document.getElementById('userAddress')
	
	function addressHandler(event) {
		userAddress.name = 'user_address'
		userAddress.value = 
			document.getElementById('postcode').value +
			document.getElementById("address").value + ' ' +
			event.target.value
		console.log(userAddress)
	}
	
	
	detailAddress.onchange = addressHandler

</script>

<script>
	const userPhone = document.getElementById('userPhone')

	// 휴대폰 번호 입력 부분
	function changePhone1(){
	    const phone1 = document.getElementById("phone1").value // 010
	    if(phone1.length === 3){
	        document.getElementById("phone2").focus();
	    }
	}
	function changePhone2(){
	    const phone2 = document.getElementById("phone2").value // ****
	    if(phone2.length === 4){
	        document.getElementById("phone3").focus();
	    }
	}
	function changePhone3(){
		const phone1 = document.getElementById("phone1").value
		const phone2 = document.getElementById("phone2").value
		const phone3 = document.getElementById("phone3").value // ****
	    if(phone3.length == 4) {
	    	const allPhone = phone1 + '-' + phone2 + '-' + phone3
	    	const url = '${cpath}/user/checkPhoneNum/' + allPhone + '/'
	    	fetch(url)
	    	.then(response => response.text())
	    	.then(text => {
	    		if(text != 1) {
	    	    	userPhone.name = 'user_phone'
	    		    userPhone.value = allPhone
	    		}
	    	})
	    }
	    
	}

</script>

<script>
	// 이메일 입력
	
	let frontEmail = ''
	let secondEmail = ''
	
	const inputEmailFront = document.getElementById('email1')
	const inputSelectEmail = document.getElementById('email2')
	
	const directly = document.getElementById('directEmail')
	
	
	function frontEmailId() {
		frontEmail = inputEmailFront.value
	}
	
	inputEmailFront.onchange = frontEmailId
	
	// 셀렉트 선택
	function emailHandler(event) {
		const selectValue = inputSelectEmail.value
		console.log(selectValue)
		console.log(selectValue == '직접 입력')
 		if(selectValue == '직접 입력') {	// 직접 입력이 들어오면 숨긴 폼 보여주기
			directly.classList.remove('hidden')
			directly.disabled = false
		}
 		else {
 			directly.classList.add('hidden')
 			directly.disabled = true
 			secondEmail = selectValue
 		}
	}
	
	inputSelectEmail.onchange = emailHandler
	
	// 직접입력 창에서 입력을 완료하면 변경
	directly.onchange = function(event) {			
		secondEmail = event.target.value
	}
	
	// 이메일 인증 창 열고 전송 후 받기
	const checkEmailSend = document.getElementById('checkEmailSend')
	checkEmailSend.onclick = function() {
		if(secondEmail.length == 0 || frontEmail.length == 0) {
			alert('옳바른 형태의 이메일 주소가 아닙니다')
			return
		}
        const emailCheckMailUrl = '${cpath}/popUp/emailCheckMail/' + frontEmail + '@' + secondEmail + '/';
        const emailCheckMailOption = 'top=200, left=250, width=500, height=500 , status=no, menubar=no, toolbar=no, resizable=no';
        window.open(emailCheckMailUrl, 'popUp', emailCheckMailOption);
	}

</script>

<script>

 
 joinForm.onsubmit = function(event) {
	  const checkNameAll = Array.from(document.querySelectorAll('input[name]'));
	  const result = checkNameAll.filter(value => value.name == '');

	  if (result != null && result != '') {
	    result[0].scrollIntoView();
	    if (result[0].id == 'userEmail') alert('이메일 인증이 필요합니다!!');
	    //event.preventDefault();
	    return false;
	  } else {
	    //joinForm.unbind();
	    return true;
	  }
	}
 
 
 


</script>

</body>
</html>