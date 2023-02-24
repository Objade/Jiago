<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


<style>
	.main2 {
		margin: 150px auto 0 auto;
		display: flex;
		justify-content: center;
		width: 1700px;
	}
	
	.donate {
		background-color: #1B534A;
		color: white;
		width: 60%;
		padding-bottom: 20px;
	}
	
	.donate_title {
		font-size: 50px;
		margin-left: 20px;
	}
	
	.donate_total {
		display: flex;
		justify-content: space-around;
	}
	
	.give {
		display: flex;
		justify-content: space-around;
	}
	
	.give>.right>div {
		margin: 10px 0px;
	}
	
	.donate_detail {
		text-align: center;
	}
	
	.currentPoint {
		background-color: white;
		color: black;
	}
	
	button[type="submit"] {
		background-color: #44A666;
		color: white;
		height: 50px;
		width: 100px;
		border: 0px;
		padding-bottom: 3px;
		font-size: 19px;
		font-weight: bold;
	}
	
	button[type="submit"]:active {
		background-color: #29633D;
		color: white;
		height: 50px;
		width: 100px;
		border: 0px;
	}
	
	.donate_detail {
		color: white;
		width: 50%;
		margin: auto;
	}
	
	button[type="button"] {
		background-color: #44A666;
		color: white;
		height: 40px;
		width: 250px;
		border: 0px;
		margin-bottom: 10px;
		font-weight: bold;
		font-size: 21px;
	}
	
	button[type="button"]:active {
		background-color: #29633D;
		color: white;
		height: 30px;
		width: 250px;
		border: 0px;
	}
	
	.joinPerson {
		text-align: right;
		font-size: 50px;
	}
	
	.add {
		display: flex;
		justify-content: center;
		width: 1700px;
		margin: 0 auto 50px auto;
	}
	
	.add>img {
		width: 1020px;
	}
	
	.donate_bottom {
		border: 1px solid black;
	}
	
	.donate_bottom_title {
		font-size: 50px;
	}
	
	.donate_bottom_items {
		display: flex;
		width: 70%;
	}
	
	.donate_bottom_items>div {
		margin: 5px 10px;
	}
	
	.donate_bottom_items>div>img {
		width: 200px;
		height: 100px;
	}
	
	.modal {
		display: flex;
		justify-content: center;
		align-items: center;
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
	}
	
	.modal__background {
		background-color: rgba(0, 0, 0, 0.6);
		width: 100%;
		height: 100%;
		position: absolute;
	}
	
	.modal__content {
		text-align: center;
		position: relative;
		background-color: white;
		border-radius: 10px;
		top: 0;
		padding: 10px 25px;
		width: 20%;
	}
	
	.donate_subtitle {
		font-size: 50px;
	}
	
	.donate_value {
		font-size: 100px;
		margin-top: -40px;
	}
	
	hr {
		margin-top: -20px;
	}
	
	.currentPoint_User {
		width: 400px;
		padding-left: 10px;
	}
	
	.donate_input {
		width: 300px;
		height: 46px;
		margin-right: 10px;
		font-size: 21px;
		padding-left: 10px;
	}
	
	.give>.left>img {
		margin-left: 30px;
	}
	
	.modal_content {
	    font-size: 30px;
		width: 480px;
		height: 470px;
		background-color: white;
		box-shadow: 10px 10px 10px black;
	}
	
	.modal_content > h3 {
	    text-align: center;
	    margin: 0;
	    padding: 15px;
	    background-color: #648C85;
	    color: white;
	}
	
	.donateList {
		height: 385px;
	    overflow-y: scroll;
	}
	
	.donateListTable {
	    text-align: center;
	    margin: 10px auto;
	}
	
	.donateListTable {
		border-collapse: collapse;
		
	}
	.donateListTable > thead > tr > th {
		border: 2px solid #dadada;
		padding: 10px;
		text-align: center;
		background-color: #1b534A;
		color: white;
	}
	
	.donateListTable > th, td {
		border: 2px solid #dadada;
		padding: 10px;
		text-align: center;
	}
	
	.donate_topImg > img {
		width: 100%;
		margin: 0px auto;
	}

</style>


<div class="main2">
	<div class="donate">
		<div class="donate_topImg"><img src="${cpath }/resources/img/donateList_top.png"></div>
		<div class="donate_total">
			<div class="left">
				<div class="donate_subtitle">총 기부금액</div>
				<div class="donate_value"><fmt:formatNumber value="${sum }"  pattern="#,###원" /></div>
			</div>
			<div class="right">
				<div class="donate_subtitle">심은 나무수</div>
				<div class="donate_value">${tree }그루</div>
			</div>
		</div>
		<hr>
		<div class="give">
			<div class="left">
				<img src="${cpath }/resources/img/나무 이미지.png" width="300px">
			</div>
			<div class="right">
				<div class="joinPerson">현재 ${count }명 참여중</div>
				<div class="currentPoint">
					<c:choose>
						<c:when test="${not empty point }">
							<h1 class="currentPoint_User">
								당신의 포인트는 : <span><fmt:formatNumber value="${point }"  pattern="#,###원" /></span>
							</h1>
						</c:when>
						<c:otherwise>
							<h1 class="currentPoint_User">
								당신의 포인트는 : <span>0 원</span>
							</h1>
						</c:otherwise>
					</c:choose>
				</div>
				<form method="POST" action="${cpath }/donate/donateList">
					<input type="number" class="donate_input" id="point"
						name="total_donate" placeholder="포인트 입력" min="0" max="${point }"
						step="100">
					<button type="submit">기부하기</button>
				</form>
			</div>
		</div>
		<div class="donate_detail">
			<button type="button">자세히 보기</button>
		</div>
	</div>
</div>
<div class="add">
	<img src="${cpath }/resources/img/donateList.png">
</div>


<style>
	.modal.hidden {
		display: none;
	}
	
	.modal_background {
		width: 100%;
		height: 100vh;
		position: absolute;
		z-index: -1;
		background-color: rgba(0, 0, 0, 0.6);
	}
	
	.closeButton {
		background-color: white;
		padding: 20px;
		box-shadow: 10px 10px 10px black;
	}
	
	.closeButton > button {
		display: flex;
		width: 180px;
		align-content: center;
		justify-content: center;
		background-color: #648C85;
		border: 0;
		color: white;
		padding: 5px;
		font-size: 21px;
		font-weight: bold;
		
	}
	
</style>

<div class="modal hidden">
	<div class="modal_background"></div>
	<div class="modal_content">
		<h3>월별 기부 내역</h3>
		<div class="donateList">
		<table class="donateListTable">
			<thead>
				<tr>
					<th>기부 월</th>
					<th>참여자 수</th>
					<th>기부 금액</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list }">
					<tr>
						<td>${dto.month }</td>
						<td>${dto.member } 명</td>
						<td><fmt:formatNumber value="${dto.total }" pattern="#,###원" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="closeButton">
		<button name="close">닫기</button>	
	</div>
</div>

</div>

<%@ include file="../footer.jsp"%>

<script>
	const openButton = document.querySelector('button[type="button"]');

	const modal = document.querySelector(".modal");

	const closeButton = modal.querySelector('button[name="close"]');
	console.log(closeButton)
	
	
	const modalBackground = modal.querySelector(".modal_background");

	function displayModal() {
		document.body.style.overflow = 'hidden';
		modal.classList.toggle("hidden");
	}
	
	function closeHandler() {
		modal.classList.toggle("hidden");
		document.body.style.overflow = 'unset';
	}
	
	
	openButton.addEventListener("click", displayModal);
	closeButton.addEventListener("click", closeHandler)
	modalBackground.addEventListener("click", closeHandler);
</script>


<script>
	const form = document.querySelector('form')

	function formHandler() {
		const point = document.getElementById("point").value;
		alert(point + '포인트 기부 감사합니다')
	}

	form.onsubmit = formHandler
</script>

</body>
</html>