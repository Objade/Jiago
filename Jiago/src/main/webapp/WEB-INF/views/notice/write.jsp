<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div id="mdiRoot">
<form method="POST" enctype="multipart/form-data">
	<p><input type="text" name="notice_name" placeholder="제목" required></p>
	<p><input type="text" name="notice_admin" value="${login.user_id }" readonly required></p>
	<p><textarea name="notice_content" placeholder="내용" required></textarea></p>
	
	<p><input type="submit" value="작성"></p>
</form>
</div>
</body>
</html>