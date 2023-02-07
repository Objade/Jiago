<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<script>

	const cpath = '${cpath}'
	const board_idx = '${dto.qboard_idx}'
	const login_userid = '${login.userid}'
</script>




<div id="root">
<h3>게시글</h3>
<table id="view">
	<tr>
		<td>${dto.qboard_idx } : ${dto.qboard_title } </td>
		<td>조회수 : ${dto.board_view }</td>
	</tr>
	<tr>
		<td colspan="2">작성자  : ${dto.qboard_writter }</td>
	</tr>
	<tr>
		<td colspan="2">
	<pre>${dto.qboard_content }</pre>
		</td>
	</tr>
</table>
</div>

</body>
</html>