<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<script>
	const survey_idx = ${survey_idx}
</script>

<h3>설문 완료페이지</h3>

<h3>설문 마무리 멘트 이미지</h3>

<!-- 필요한것 user_idx, survey_idx, 기부금 -->

<form method="POST" action="${cpath }/survey/surveyComplete">
	<input type="text" name="survey_idx" value="${survey_idx }">
	<input type="text" name="user_idx" value="${login.user_idx }">
	<input type="number" name="total_donate" placeholder="기부할 금액 입력하세요">
	<input type="submit" value="기부하기">
</form>

<a href="${cpath }">나중에 기부하기</a>


</body>
</html>