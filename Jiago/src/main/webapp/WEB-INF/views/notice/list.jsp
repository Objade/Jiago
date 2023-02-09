<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div id="root">
	<div class="notice_name">
		<div class="notice_name_L">공지사항</div>
		<div class="notice_name_R">Home > 고객센터 > 공지사항</div>
	</div>
	<div class="sb">
		<div>
			<form method="POST" class="search">
				<p>
					<input type="text" name="notice_name" placeholder="제목을 입력하세요">
					<input type="submit" value="검색">
				</p>
			</form>
		</div>
		<div>
			<a href="${cpath }/notice/write"><button>작성</button></a>
		</div>
	</div>
	

   <table id="boardList">
      <thead>
         <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
         </tr>
      </thead>
      
      <tbody>
      <c:forEach var="dto" items="${list }">
      <tr>
         <td>${dto.notice_idx }</td>
         <td><a href="${cpath}/notice/view/${dto.notice_idx}">${dto.notice_name }</a></td>
         <td>${dto.notice_admin }</td>
         <td><fmt:formatDate value="${dto.notice_date }"/></td>
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