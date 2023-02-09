<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<form method="POST">
	<p><input type="text" name="notice_name" placeholder="제목" value="${dto.notice_name }" required></p>
	<p><input type="text" name="notice_admin" value="${dto.notice_admin }" readonly></p>
	<p><textarea name="notice_content" placeholder="내용" required>${dto.notice_content }</textarea></p>
	<p><input type="submit" value="수정"></p>
</form>

</body>
</html>