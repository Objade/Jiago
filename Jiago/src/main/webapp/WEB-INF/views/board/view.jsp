<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<script>
   const cpath = '${cpath}'
   const qboard_idx = '${dto.qboard_idx}'
   const login_user_id = '${login.user_id}'
   const login_user_idx = '${login.user_idx}'
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
    <c:if test="${login.user_type == 'Admin' }"> 
      <form id="replyWriteForm">
         <p>
            <textarea name="content" 
                       placeholder="고객님에게 친절하게 댓글을 달아주세요" 
                       ${empty login ? 'readonly' : '' }></textarea>
            <button>작성</button>
         </p>
      </form>
     </c:if> 
      
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
      <a href="${cpath }/board/list?qboard_title="><button>목록</button></a>
   </div>
<c:if test="${login.user_id == dto.qboard_writer }">
   <div>
      <a href="${cpath }/board/modify/${dto.qboard_idx}"><button>수정</button></a>
      <a href="${cpath }/board/delete/${dto.qboard_idx}"><button>삭제</button></a>
   </div>
</c:if>
</div>
</div>

<script>
   const replyWriteForm = document.getElementById('replyWriteForm')

   
   
   
   document.body.onload = replyLoadHandler
   replyWriteForm.onsubmit = replyWriteHandler

</script>

</body>
</html>