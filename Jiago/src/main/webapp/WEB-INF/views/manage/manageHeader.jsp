<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body, html {
	height: 100%;
}

.manage_body {
	background-color: #f9fbfc;
	margin: 0px;
}

.manage_wrap {
	height: 100%;
}

.header_subindex {
	height: 100%;
	border-right: 1px solid #dadada;
	box-shadow: 5px 1px 8px 0 rgb(0 0 0/ 6%);
	width: 300px;
	background-color: #1B434A;
	margin: 0px;
}

.header_subindex ul {
	margin-top: 0px;
	padding-left: 0px;
	
}

.manage_logo img {
	width: 150px;
	padding: 10px;
}
.manage_li {
	font-size: 25px;
	color: #ffffff;
	list-style: none;
	font-weight: bolder;
	border-bottom: 1px solid white;
	padding: 16px 24px 19px;
	
}
.manage_li li {
	list-style: none;
}
.manage_ul {
	padding-top: 3px;
	padding-left: 10px;
}
.manage_li li a{
	font-size: 15px;
	color: #ffffff;
	text-decoration: none;
}

.manage_logo {
	padding-bottom: 50px;
}
</style>
</head>
<body class="manage_body">
	<div class="manage_wrap">
		<div class="header_subindex">
			<div class="manage_logo">
				<a href="${cpath }/"><img
					src="${cpath }/resources/img/ERP로고.png"></a>
			</div>
			<ul class="manage_ul">
				<li class="manage_li"><a>설문관리</a>
					<ul>
						<li><a href="${cpath }/survey/surveyManage">설문 목록</a></li>
						<li><a href="${cpath }/survey/surveyAdd">설문 추가</a></li>
					</ul>
				</li>
				
				<li class="manage_li"><a>회원관리</a>
					<ul>
						<li><a href="${cpath }/member/list?user_id=">회원 목록</a></li>
					</ul>
				</li>
			
				<li class="manage_li"><a>회사관리</a>
					<ul>
						<li><a href="${cpath }/company/list?company_name=">회사 목록</a></li>
						<li><a href="${cpath }/company/add">회사 추가</a></li>
					</ul>
				</li>

				<li class="manage_li"><a>설문통계</a>
					<ul>
						<li><a href="${cpath }/manage/surveyResultList">설문별 통계 보기</a></li>
						<li><a href="${cpath }/manage/surveyPreference">연령대, 성별, 직업별 선호 조사</a></li>
						<li><a href="${cpath }/manage/surveyUserJoin">유저 별 설문 참여율</a></li>
						<li><a href="${cpath }/manage/surveyPreferQuestion">회사 별 선호 질문</a></li>
						<li><a href="${cpath }/manage/surveyCountByCompany">회사 별 설문조사 수</a></li>
						<li><a href="${cpath }/manage/surveyQuestionRanking">가장 많이 사용된 질문 보기</a></li>
					</ul>
				</li>
			
				<li class="manage_li"><a>기부통계</a>
					<ul>
						<li><a href="${cpath }/manage/donateMonth">월별 기부 내역</a></li>
						<li><a href="${cpath }/manage/surveyUserDonateRank">유저별 기부 순위</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>