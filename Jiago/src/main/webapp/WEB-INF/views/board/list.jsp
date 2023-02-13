<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div id="root">
   <div class="qboard_title">
      <div class="qboard_title_L"><a href="${cpath }/board/list">질문게시판</a></div>
      <div class="qboard_title_R">Home > 고객센터 > 질문게시판</div>
   </div>
   <div class="sb">
      <div>
         <form method="POST" class="search">
            <p>
               <input type="text" name="qboard_title" placeholder="제목을 입력하세요">
               <input type="submit" value="검색">
            </p>
         </form>
      </div>
      <div>
         <a href="${cpath }/board/write"><button>작성</button></a>
      </div>
   </div>
   

   <table id="boardList">
      <thead>
         <tr>
            <th>게시판 번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성날짜</th>
            <th>조회수</th>
         </tr>
      </thead>
      
      <tbody>
      <c:forEach var="dto" items="${list }">
      <tr>
         <td>${dto.qboard_idx }</td>
         <td>
         <c:if test="${dto.qboard_privacy eq 'N' }">
         	<img style="height: 20px" src="${cpath }/resources/img/자물쇠2.png">
         	<c:choose>
         		<c:when test="${login.user_id == dto.qboard_writer || login.user_type == 'Admin'}">
         			<a href="${cpath}/board/view/${dto.qboard_idx}"><c:out value="${dto.qboard_title }"></c:out></a>
         		</c:when>
         		<c:otherwise><a style="font-weight: bolder">비밀글은 작성자와 관리자만 볼수 있습니다!</a></c:otherwise>
         	</c:choose>
         </c:if>
         <c:if test="${dto.qboard_privacy eq 'Y' }">
         	<a href="${cpath}/board/view/${dto.qboard_idx}"><c:out value="${dto.qboard_title }"></c:out></a>
         </c:if>
         </td>
         <td>${dto.qboard_writer }</td>
         <td><fmt:formatDate value="${dto.qboard_date }"/></td>
         <td>${dto.qboard_view }</td>
         
      </tr>
      </c:forEach>
      </tbody>
   </table>
   
    <div class="pageNumber">
      <c:if test="${paging.prev }">
         <a href="${cpath }/board/list?page=${paging.begin - 1}">[이전]</a>
      </c:if>
      
      <c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
         <a class="${paging.page == i ? 'bold' : '' }" 
            href="${cpath }/board/list?page=${i}">[${i }]</a>
      </c:forEach>
      
      <c:if test="${paging.next }">
         <a href="${cpath }/board/list?page=${paging.end + 1}">[다음]</a>
      </c:if>
   </div>
</div>
</body>
</html>