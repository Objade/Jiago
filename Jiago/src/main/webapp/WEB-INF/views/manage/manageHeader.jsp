<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<c:set var="cpath"  value="${pageContext.request.contextPath }"/>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<ul>
	<li><a href="${cpath }">지아고 메인 페이지</a></li>
    <li><a href="${cpath }/manage/manageHome">관리</a>
        <ol><a href="">설문 관리</a>
        	<ol><a href="${cpath }/survey/surveyManage">설문 목록</a></ol>
            <ol><a href="${cpath }/survey/surveyAdd">설문 추가</a></ol>
            <ol><a href="${cpath }/survey/surveyEdit">설문 수정</a></ol>
        </ol>
        <ol><a href="">회원 관리</a>
            <ol><a href="${cpath }/member/list?user_id=">회원 목록</a></ol>
            <ol><a href="">회원 탈퇴</a></ol>
        </ol>
        <ol><a href="">회사 관리</a>
            <ol><a href="${cpath }/company/list?company_name=">회사 목록</a></ol>
            <ol><a href="${cpath }/company/add">회사 추가</a></ol>
            <ol><a href="">회사 정보 수정</a></ol>
        </ol>
    </li>
    <li><a href="">통계</a>
        <ol><a href="">설문 통계</a>
            <ol><a href="${cpath }/manage/surveyResultList">설문별 통계 보기</a></ol>
            <ol><a href="">연령대, 성별, 직업별 선호 조사</a></ol>
            <ol><a href="${cpath }/manage/surveyUserJoin">유저 별 설문 참여율</a></ol>
            <ol><a href="">회사 별 선호 질문</a></ol>
        
        </ol>
        <ol><a href="">기부 통계</a>
            <ol><a href="">월별 기부 내역</a></ol>
            <ol><a href="${cpath }/manage/surveyUserDonateRank">유저별 기부 순위</a></ol>
        </ol>
    </li>
 </ul>
 
</body>
</html>