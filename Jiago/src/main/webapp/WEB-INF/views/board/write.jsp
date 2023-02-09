<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>



<form method="POST" enctype="multipart/form-data">
	<p><input type="text" name="qboard_title" placeholder="제목" required></p>
	<p><input type="text" name="qboard_writer" value="${login.user_id }" readonly></p>
	<p><textarea name="qboard_content" placeholder="내용" required></textarea></p>
	<p>
		<label><input type="radio" name="qboard_privacy" value="Y">Y</label>
		<label><input type="radio" name="qboard_privacy" value="N">N</label>
	</p>
	<p><input type="submit" value="작성"></p>
</form>
</body>
</html>