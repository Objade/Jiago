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
		font-size: 30px;
	}
	
	.donation {
		margin-top: 50px;
		text-align: center;
	}

</style>


	<div id="userPoint">
	<div class="pointInfo">
			<c:choose>
				<c:when test="${not empty point }">
						<div class="left">
							<img src="${cpath }/resources/userImg/${grade }.png">
						</div>
						<div class="right">
							<h1>${login.user_name }님  현재 보유 포인트 : <span>${point }</span> </h1>
							<h1>${login.user_name }님  총 기부 금액 : <span>${empty totalPoint ? '0' : totalPoint }</span> </h1>
							<h2>현재 ${grade } 등급입니다.</h2>
						</div>					
					<div class="donation"><a href="${cpath }/donate/donateList">기부하기</a></div>
				</c:when>
				<c:otherwise>
					<div style="margin-top: 200px;">아직 첫 설문조사를 완료하지 않았습니다.
						<div class="donation"><a href="${cpath }/survey/list?survey_targetAge=&survey_targetGender=&survey_targetJob=">첫 설문조사 하러가기</a></div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>	
	
	
</body>
</html>