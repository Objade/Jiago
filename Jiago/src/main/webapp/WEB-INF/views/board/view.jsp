<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<script>
	const cpath = '${cpath}'
	const board_idx = '${dto.qboard_idx}'
	const login_userid = '${login.user_id}'
</script>
<script src="${cpath }/resources/js/script.js"></script>


<div id="root">
<h3>게시글</h3>
<table id="view">
	<tr>
		<td>${dto.qboard_idx } : ${dto.qboard_title } </td>
		<td>조회수 : ${dto.qboard_view }</td>
	</tr>
	<tr>
		<td colspan="2">작성자  : ${dto.qboard_writer }</td>
	</tr>
	<tr>
		<td colspan="2">
	<pre>${dto.qboard_content }</pre>
		</td>
	</tr>
	<tr>
		<th colspan="2">
		
		<form id="replyWriteForm">
			<p>
				<textarea name="content" 
					   	  placeholder="${empty login ? '로그인 이후 작성 가능합니다' : '바르고 고운 말을 사용합시다' }" 
					   	  ${empty login ? 'readonly' : '' }></textarea>
				<button>작성</button>
			</p>
		</form>
		
		<div id="reply">
			<img src="${cpath }/resources/img/로딩.gif"
				 height="50"
			     style="margin: 100px auto">
		</div>
		</th>
	</tr>
</table>

<div class="sb">
	<div>
		<a href="${cpath }/board/list"><button>목록</button></a>
	</div>
	<div>
		<a href="${cpath }/board/modify/${dto.qboard_idx}"><button>수정</button></a>
		<a href="${cpath }/board/delete/${dto.qboard_idx}"><button>삭제</button></a>
	</div>
</div>
</div>

<script>
	const replyWriteForm = document.getElementById('replyWriteForm')
	
	
	document.querySelector('textarea').onfocus = function (event) {
		if(login_userid == '') {			
			const move = confirm('댓글을 쓰려면 로그인해야합니다. 로그인하시겠습니까?')
			event.target.blur()				
			
			if(move) {	
				const url = cpath + '/member/login?url=' + location.href
				location.href = url
			}
		}
	}
	document.body.onload = replyLoadHandler
	replyWriteForm.onsubmit = replyWriteHandler
	
	
</script>

</body>
</html>