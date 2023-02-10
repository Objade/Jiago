<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<!-- 
<c:if test="${dto.qboard_writer != login.user_id }">
	<script>
		alert('본인의 글만 수정/삭제 할 수 있습니다')
		location.href = '${cpath}/board/list'
	</script>
</c:if>
 -->
 
<form method="POST">
	<p><input type="text" name="qboard_title" placeholder="제목" value="${dto.qboard_title }" required></p>
	<p><input type="text" name="qboard_writer" value="${dto.qboard_writer }" readonly></p>
	<p><textarea name="qboard_content" placeholder="내용" required>${dto.qboard_content }</textarea></p>
	<p><input type="submit" value="수정"></p>
</form>

</body>
</html>