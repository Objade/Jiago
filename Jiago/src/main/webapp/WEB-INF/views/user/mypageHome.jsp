<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="mypage.jsp"%>

<link rel="stylesheet" href="${cpath }/resources/css/user/mypageHome.css" type="text/css">

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
		document.body.style.overflow = 'hidden';
	}

	// 모달 외부 클릭 시 모달을 숨김 처리
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
			document.body.style.overflow = 'unset';
		}
	}
</script>

</body>
</html>