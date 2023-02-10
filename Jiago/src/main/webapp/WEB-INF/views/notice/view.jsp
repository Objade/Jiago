<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<script>
	const cpath = '${cpath}'
	const board_idx = '${dto.notice_idx}'
	const login_userid = '${login.user_id}'
</script>
<script src="${cpath }/resources/js/script.js"></script>


<div id="root">
<h3>게시글</h3>
<table id="view">
	<tr>
		<td>${dto.notice_idx } : ${dto.notice_name } </td>
		<td>작성자  : ${dto.notice_admin }</td>
	</tr>
	<tr>
		<td colspan="2">
	<pre>${dto.notice_content }</pre>
		</td>
	</tr>

</table>

<div class="sb">
	<div>
		<a href="${cpath }/notice/list"><button>목록</button></a>
	</div>
	<div>
		<a href="${cpath }/notice/modify/${dto.notice_idx}"><button>수정</button></a>
		<a href="${cpath }/notice/delete/${dto.notice_idx}"><button>삭제</button></a>
	</div>
</div>
</div>

</body>
</html>