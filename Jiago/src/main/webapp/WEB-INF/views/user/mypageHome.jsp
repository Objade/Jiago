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
		text-align: center;
		line-height: 165px;
		font-size: 30px;
	}
	
	.donation > a ,span > button{
		color: lightgreen;
		background-color: #2b524a;
		padding: 5px 10px;
		border-radius: 15px;
	}
	
	span > button{
		font-family: 'Dongle';
		font-size: 20px; 
	}
	
	.donation > a:hover ,span > button:hover{
		background-color: lightyellow;
		color: orange;
		transition: all 0.7s;
		cursor: pointer;
	}
	
	
	/* 모달 스타일 */
.modal {
  display: none; /* 모달을 기본적으로 숨김 */
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.4);
}

/* 모달 내용 스타일 */
.modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 500px;
}

#gradeForm > div > span {
	font-size: 40px;
	margin-left: 100px;
	box-sizing: border-box;
}

#gradeForm > div {
}

span > img {
	width: 30px;
}

</style>

	<div id="userPoint">
	<div class="pointInfo">
			<c:choose>
				<c:when test="${not empty point}">
						<div class="left">
							<img src="${cpath }/resources/userImg/${grade }.png">
						</div>
						<div class="right">
							<h1>${login.user_name }님  현재 보유 포인트 : <span>${point }</span> </h1>
							<h1>${login.user_name }님  총 기부 금액 : <span>${empty totalPoint ? '0' : totalPoint }</span> </h1>
							<h2>현재 ${leftPoint != 0 ? grade : '최고'} 등급입니다.</h2>
							<h2>${leftPoint != 0 ? '다음 등급까지 남은 기부 포인트는' : '' } ${leftPoint != 0 ? leftPoint : '' }
								<span><button id="open-modal">전체 등급표 보기</button></span>
							</h2>
							<div id="customer-grade-modal" class="modal">
								<div class="modal-content">
								<h2 style="text-align: center;">고객 등급표</h2>
							    	<!-- 고객 등급표 내용 -->
							    	<div id="gradeForm">
							    		<div><span><img src="${cpath }/resources/userImg/1단계.png">1단계</span> : 총 기부 포인트 1만 미만</div>
							    		<div><span><img src="${cpath }/resources/userImg/2단계.png">2단계</span> : 총 기부 포인트 1만 이상</div>
							    		<div><span><img src="${cpath }/resources/userImg/3단계.png">3단계</span> : 총 기부 포인트 5만 이상</div>
							    		<div><span><img src="${cpath }/resources/userImg/4단계.png">4단계</span> : 총 기부 포인트 10만 이상</div>
							    		<div><span><img src="${cpath }/resources/userImg/5단계.png">5단계</span> : 총 기부 포인트 30만 이상</div>
							    		<div><span><img src="${cpath }/resources/userImg/6단계.png">6단계</span> : 총 기부 포인트 50만 이상</div>
							    	</div>
							  	</div>
							  	<br>
						</div>			
							<div class="donation"><a href="${cpath }/donate/donateList">기부하기</a></div>
						</div>
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
	
	
	<script>
	// 모달 열기 버튼
	const modalBtn = document.getElementById("open-modal");

	// 모달 요소
	const modal = document.getElementById("customer-grade-modal");


	// 모달 열기 버튼 클릭 시 모달을 보이도록 설정
	modalBtn.onclick = function() {
	  modal.style.display = "block";
	}


	// 모달 외부 클릭 시 모달을 숨김 처리
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
	
	</script>
	
</body>
</html>