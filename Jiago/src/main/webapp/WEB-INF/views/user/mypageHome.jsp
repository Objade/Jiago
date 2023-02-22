<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mypage.jsp" %>

<style>
	#userPoint {
		width: 800px;
		margin: 0 auto;
	}
	
/* 	#userPoint > h1, h2 {
		text-align: right;
	} */

	.pointInfo {
		display: flex;
		justify-content: center;
		justify-content: space-evenly;
	}
	
	.donation {
		margin-top: 50px;
		text-align: center;
	}

</style>


	<div id="userPoint">

		<c:choose>
			<c:when test="${not empty point }">
			
			<div class="pointInfo">
				<div class="left">
					<img src="${cpath }/resources/userImg/${login.grade }.png">
				</div>
				<div class="right">
					<h1>${login.user_id }님  현재 보유 포인트 : <span>${point }</span> </h1>
					<h2>${login.grade } 등급입니다.</h2>
				</div>
			</div>
			<div class="donation"><a href="${cpath }/donate/donateList">기부하기</a></div>
			
			
			
			
			
			
			
		</c:when>
			<c:otherwise>
				<div>아직 첫 설문조사를 완료하지 않았습니다.</div>
				<div class="donation"><a href="${cpath }/survey/list?survey_targetAge=&survey_targetGender=&survey_targetJob=">설문조사 하러가기</a></div>
			</c:otherwise>
		</c:choose>
	</div>

	
	
	
</body>
</html>