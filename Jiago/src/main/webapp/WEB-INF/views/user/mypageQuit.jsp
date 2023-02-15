<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mypage.jsp" %>

	<div id="pwCheck">
		<form method="POST">
			<div><input type="password" name="input_pw" placeholder="비밀번호를 입력하세요" required autocomplete="off"></div>
			<div><input type="submit" value="입력"></div>
		</form>
	</div>

	<script>
		const pwCheck = document.getElementById('pwCheck')
		
		document.forms[0].onsubmit = function(event) {
		event.preventDefault()
		
		const inputPw = document.querySelector('input[name="input_pw"]').value
		console.log(inputPw)
		
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
				alert('정상적으로 탈퇴 처리가 되었습니다. 지금까지 이용해 주셔서 감사합니다.')
			}
			else alert('비밀번호가 틀렸습니다.')
		})
	}
	</script>


</body>
</html>