<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mypage.jsp"%>

<style>
#userPoint {
	width: 1000px;
	margin: 0 auto;
}
.pointInfo {
	width:100%;
}

/*    #userPoint > h1, h2 {
      text-align: right;
   } */
.usertop {
	display: block;
	justify-content: center;
	align-items: center;
	margin: 100px auto;
	width: 290px;
	border: 3px dotted #38B63C;
	background-color: white;
	border-radius: 20px;
}

.usertop_img img {
	width: 250px;
	margin: 20px;
	margin-bottom: 5px;
}

.usertop_write {
	display: flex;
	justify-content: center;
	font-size: 25px;
	font-weight: bolder;
	padding-bottom: 15px;
}
.userbottom {
	width:1000px;
	height: 151px;
	display: flex;
}
.userbottom_name {
	width: 270px;
	height: 151px;
	background-color:#38B63C;
	color: #ffffff;
	font-size: 30px;
	font-weight:bolder;
	text-align: center;
}
.userbottom_name > span {
	line-height: 150px;
	vertical-align: middle;
}
.nPoint {
	padding-left: 20px;
	padding-right: 20px;
	display: flex;
	align-items: center;
	width: 400px;
	height: 75px;
	background-color: #7CC135;
	display: flex;
	justify-content: space-between;
}
.nPoint > span {
	color: #ffffff;
	font-size: 18px;
	font-weight: bolder;
}
.nPoint > a {
	color: #ffffff;
	font-size: 12px;
}
.nPointL {
	padding-right: 3px;
	color: #ffffff;
	font-size: 25px;
}
.userbottom_point {
	border-right: 1px solid #689e31;
}
.userbottom_point > div:first-child {
	border-bottom: 1px solid #689e31;
}

.donation {
	height: 151px;
	width: 210px;
	text-align: center;
	line-height: 151px;
	font-size: 30px;
	background-color: #7CC135;
}
.donation a {
	text-decoration: none;
	color: #ffffff;
	font-weight: bolder;
}

.first_surveyBottom {
	width: 500px;
	margin: auto;
}
.first_survey {
	padding-top: 300px;
}
.first_surveyTop {
	justify-content: center;
	text-align: center;
	color: #03C75A;
	font-size: 40px;
	padding-bottom: 50px;
}


.donation>a:hover, span>button:hover {
	color: #38B63C;
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

#gradeForm>div>span {
	font-size: 40px;
	margin-left: 100px;
	box-sizing: border-box;
}


span>img {
	width: 30px;
}
</style>

<div id="userPoint">
	<div class="pointInfo">
		<c:choose>
			<c:when test="${not empty point}">
				<div class="usertop">
					<div class="usertop_img">
						<img src="${cpath }/resources/userImg/${grade }.png">
					</div>
					<div class="usertop_write">현재 ${leftPoint != 0 ? grade : '최고'}
						등급입니다</div>
					<h2>${leftPoint != 0 ? '다음 등급까지 남은 기부 포인트는' : '' }
						${leftPoint != 0 ? leftPoint : '' } <span><button
								id="open-modal">전체 등급표 보기</button></span>
					</h2>
					<div id="customer-grade-modal" class="modal">
						<div class="modal-content">
							<h2 style="text-align: center;">고객 등급표</h2>
							<!-- 고객 등급표 내용 -->
							<div id="gradeForm">
								<div>
									<span><img src="${cpath }/resources/userImg/1단계.png">1단계</span>
									: 총 기부 포인트 1만 미만
								</div>
								<div>
									<span><img src="${cpath }/resources/userImg/2단계.png">2단계</span>
									: 총 기부 포인트 1만 이상
								</div>
								<div>
									<span><img src="${cpath }/resources/userImg/3단계.png">3단계</span>
									: 총 기부 포인트 5만 이상
								</div>
								<div>
									<span><img src="${cpath }/resources/userImg/4단계.png">4단계</span>
									: 총 기부 포인트 10만 이상
								</div>
								<div>
									<span><img src="${cpath }/resources/userImg/5단계.png">5단계</span>
									: 총 기부 포인트 30만 이상
								</div>
								<div>
									<span><img src="${cpath }/resources/userImg/6단계.png">6단계</span>
									: 총 기부 포인트 50만 이상
								</div>
							</div>
						</div>
						<br>
					</div>
				</div>
				<div class="userbottom">
					<div class="userbottom_name">
						<span>${login.user_name }님 POINT</span>
					</div>
					<div class="userbottom_point">
						<div class="nPoint">
							<span>현재 보유 포인트</span>
							<a>
								<span class="nPointL">${point }</span>
								<span>POINT</span>							
							</a>
						</div>
						<div class="nPoint">
							<span>총 기부 포인트</span>
							<a>
								<span class="nPointL">${empty totalPoint ? '0' : totalPoint }</span>
								<span>POINT</span>
							</a>
						</div>
					</div>
					<div class="donation">
						<a href="${cpath }/donate/donateList">기부하러가기</a>
					</div>
				</div>

			</c:when>
			<c:otherwise>
					<div class="first_survey">
						<div class="first_surveyTop">
							아직 설문조사를 한번도 하지 않았네요ㅠㅠ?
						</div>
						<div class="first_surveyBottom donation">
							<a
								href="${cpath }/survey/list?survey_targetAge=&survey_targetGender=&survey_targetJob=">첫
								설문조사 하러가기
							</a>
						</div>		
					</div>
			</c:otherwise>
		</c:choose>
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