<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../manage/manageHeader.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://webfontworld.github.io/yangheeryu/Dongle.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#company_root {
	width: 100%;
	margin: auto;
	justify-content: center;
}

.hidden {
	display: none;
}

.companyManage.companyList {
	border: 1px solid #dadada;
	border-collapse: collapse;
	width: 100%;
}

.companyManage.companyList>thead>tr>th {
	background-color: #1B434A;
	color: white;
}

.companyManage.companyList th {
	padding: 10px;
	text-align: center;
}

.companyManage.companyList td {
	border: 1px solid #dadada;
	padding: 10px;
	text-align: center;
}

.companyManage.companyList tr:hover td {
	background-color: #dadada;
}

.page_wrap {
	margin-top: 20px;
	text-align: center;
	font-size: 0;
}

.page_nation {
	display: inline-block;
}

.page_nation a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}

.page_nation .arrow {
	border: 1px solid #ccc;
}

.page_nation .pprev {
	background: #f8f8f8 url('${cpath}/resources/img/page_pprev.png')
		no-repeat center center;
	margin-left: 0;
}

.page_nation .prev {
	background: #f8f8f8 url('${cpath}/resources/img/page_prev.png')
		no-repeat center center;
	margin-right: 7px;
}

.page_nation .next {
	background: #f8f8f8 url('${cpath}/resources/img/page_next.png')
		no-repeat center center;
	margin-left: 7px;
}

.page_nation .nnext {
	background: #f8f8f8 url('${cpath}/resources/img/page_nnext.png')
		no-repeat center center;
	margin-right: 0;
}

.page_nation .active {
	background-color: #1B434A;
	color: #fff;
	border: 1px solid #1B434A;
}

.page_nation a {
	font-family: 'Dongle';
}

.img_home {
	padding-bottom: 20px;
}

.img_home>a {
	font-size: 25px;
	text-decoration-line: none;
	color: black;
}

.img_home>a>img {
	padding-right: 5px;
	width: 25px;
}

.img_survey {
	justify-content: flex-end;
	text-align: right;
	padding-top: 20px;
}

.img_survey>a {
	font-size: 25px;
	text-decoration-line: none;
	color: black;
}

.img_survey>a>img {
	padding-right: 5px;
	width: 25px;
}

.company_modi img {
	width: 25px;
	cursor: pointer;
}

.company_delete img {
	width: 25px;
}

.search {
	padding-top: 20px;
	padding-bottom: 10px;
	z-index: 1;
}

.search>form {
	position: relative;
	width: 500px;
	display: flex;
}

#add_input {
	width: 400px;
	height: 20px;
	border: 1px solid #bbb;
	border-right: none;
	padding: 10px 12px;
	font-size: 14px;
	border-bottom: 2px solid #bbb;
}

#add_input2 {
	width: 100px;
	border-left: none;
	border: 1px solid #bbb;
	font-family: 'Dongle';
	font-size: 25px;
	background-color: #1B434A;
	color: white;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="img_home">
		<a href="${cpath }"><img src="${cpath }/resources/img/홈.png">Home</a>
	</div>

	<div id="company_root">

		<h1>회사 목록</h1>

		<div class="search">
			<form>
				<input id="add_input" type="text" name="company_name"
					placeholder="조회할 회사이름을 적어주세요" value="${company_name }" /> <input
					id="add_input2" type="submit" value="검색" />
			</form>
		</div>

		<table class="companyManage companyList">
			<thead>
				<tr>
					<th>회사 번호</th>
					<th>회사 이름</th>
					<th>회사 전화번호</th>
					<th>사업자등록번호</th>
					<th>주소</th>
					<th>이메일</th>
					<th>삭제여부</th>
					<th>수정</th>
					<th>삭제</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list }">
					<tr>
						<td>${dto.company_idx}</td>
						<td>${dto.company_name}</td>
						<td>${dto.company_num}</td>
						<td>${dto.company_registnum}</td>
						<td>${dto.company_address}</td>
						<td>${dto.company_email}</td>
						<td>${dto.company_delete }</td>
						<td class="company_modi"><a
							href="${cpath }/company/modify/${dto.company_idx}"><img
								src="${cpath }/resources/img/수정.png"></a></td>
						
<%-- 						<td><button id="companyDelete" value="${dto.company_idx }">삭제</button></td> --%>
						
						<td class="company_dele company_modi"><a id="companyDelete">
						<img src="${cpath }/resources/img/삭제.png" value="${dto.company_idx }"></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="img_survey">
			<a href="${cpath }/company/add"><img
				src="${cpath }/resources/img/설문추가.png">회사 추가</a>
		</div>



		<div class="page_wrap">
			<div class="page_nation">
				<c:if test="${paging.prev }">
					<a class="arrow pprev"
						href="${cpath }/company/list?page=1&company_name=${company_name}"></a>
				</c:if>

				<c:if test="${paging.prev }">
					<a class="arrow prev"
						href="${cpath }/company/list?page=${paging.begin - 1}&company_name=${company_name}">

					</a>
				</c:if>

				<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
					<a style="font-size: 20px"
						class="${paging.page == i ? 'active' : '' }"
						href="${cpath }/company/list?page=${i}&company_name=${company_name}">${i}</a>
				</c:forEach>

				<c:if test="${paging.next }">
					<a class="arrow next"
						href="${cpath }/company/list?page=${paging.end + 1}&company_name=${company_name}"></a>
				</c:if>

				<c:if test="${paging.next }">
					<a class="arrow nnext"
						href="${cpath }/company/list?page=${paging.pageCount }&company_name=${company_name}"></a>
				</c:if>
			</div>
		</div>
	</div>
	
	

	
	<script>
      const companyDelete = Array.from(document.querySelectorAll('td.company_dele > a > img')) 
      console.log(companyDelete)

		function companyDeleteHandler(event) {
      
			const cpath = '/jiago'
			const companyIdx = event.target.getAttribute('value')
			let target = event.target
			while(target.tagName != 'TR') {
				target = target.parentNode
			}
			const companyName = target.children[1].innerText 
			
			const message = "'" + companyName + "'을/를 정말로 삭제하시겠습니까?'"
			const flag = confirm(message)
			if(flag) {
				const url = cpath + '/company/companyDelete/' + companyIdx
				fetch(url)
				.then(resp => resp.text())
					.then(text => {
						alert(text)
						location.href = cpath + '/company/list?company_name='
					})
			}
		}
	
		companyDelete.map(e => e.onclick = companyDeleteHandler)
		
	</script>
</body>
</html>