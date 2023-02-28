<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<script>
   const cpath = '${cpath}'
   const qboard_idx = '${dto.qboard_idx}'
   const login_user_id = '${login.user_id}'
   const login_user_idx = '${login.user_idx}'
</script>
<script src="${cpath }/resources/js/board/viewscript.js"></script>




<div id="vBody">
   <div id="vRoot">
   
      <div class="vMDL">
         <c:if test="${login.user_id == dto.qboard_writer }">
            <div>
               <a href="${cpath }/board/modify/${dto.qboard_idx}"><button class="boardNoticeUpdate_Button">수정</button></a>
               <a href="${cpath }/board/delete/${dto.qboard_idx}"><button class="boardNoticeUpdate_Button">삭제</button></a>
            </div>
         </c:if>
         
         <div class="boardNoticeListButton_div">
            <a href="${cpath }/board/list?qboard_title="><button class="boardNoticeList_button">목록</button></a>
         </div>
         
      </div>
      
      <table id="viewList">
         <tr class="viewListTop">
            <td class="bTitle">${dto.qboard_title } </td>
            <td class="bWriter">${dto.qboard_writer }</td>
            <td class="bView">${dto.qboard_view }</td>
         </tr>
                  
         <tr>
            <td class="bContent" colspan="3">${dto.qboard_content }</td>
         </tr>
       </table>
       <div class="reply_title">답변</div> 
         <div id="reply">
               <img src="${cpath }/resources/img/로딩.gif"
                   height="50"
                    style="margin: 100px auto">
            </div>
         
          <c:if test="${login.user_type == 'Admin' }"> 
            <form id="replyWriteForm">
               <p>
                  <textarea name="content" 
                             placeholder="고객님에게 친절하게 댓글을 달아주세요" 
                             ${empty login ? 'readonly' : '' }></textarea>
                  <button class="boardNoticeUpdate_Button" >작성</button>
               </p>
            </form>
           </c:if> 
            

      
      
   </div>
</div>


<script>
	const replyWriteForm = document.getElementById('replyWriteForm')
</script>

    <script src="${cpath }/resources/js/survey/surveyQuestionAdd.js"></script>


<script>
document.body.onload = replyLoadHandler
replyWriteForm.onsubmit = replyWriteHandler
</script>

</body>
</html>