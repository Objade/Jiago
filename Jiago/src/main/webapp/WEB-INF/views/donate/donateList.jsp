<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<div class="main">


	<h3>${tree }, ${sum }, ${count }</h3>
</div>


<div class="main">
		<c:choose>
			<c:when test="${not empty point }">
			<h1>당신의 포인트는 : <span>${point }</span></h1>
			<div class="donation"><a href="#">기부하기</a></div>
		</c:when>
			<c:otherwise>
				<div>아직 첫 설문조사를 완료하지 않았습니다.</div>
			</c:otherwise>
		</c:choose>

	
	</div>


</body>
</html>