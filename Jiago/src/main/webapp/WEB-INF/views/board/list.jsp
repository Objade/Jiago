<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div id="root">
	<div class="qboard_title">
		<div class="qboard_title_L">질문게시판</div>
		<div class="qboard_title_R">Home > 고객센터 > 질문게시판</div>
	</div>
	<div class="sb">
		<div>
			<form>
				<p>
					<input type="search" name="keyword" placeholder="검색어를 입력하세요">
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
            <th scope="col" colspan="4">
            	<p class="numS">게시판 번호</p>
            	<p class="conS">제목</p>
            	<p class="writterS">작성자</p>
            	<p class="dateS">작성날짜</p>
            </th>
         </tr>
      </thead>
      
      <tbody>
      <c:forEach var="dto" items="${list }">
      <tr>
         <td>${dto.qboard_idx }</td>
         <td><a href="${cpath}/board/view/${dto.qboard_idx}">${dto.qboard_title }</a></td>
         <td>${dto.qboard_writter }</td>
         <td><fmt:formatDate value="${dto.qboard_date }"/></td>
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