<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>


<div class="main">
	<div class="surveyList title">설문 목록</div>
	
	<div class="surveyList items">
		<c:forEach var="dto" items="${list }">
			<a href="${cpath }/survey/surveyDetailPage/${dto.survey_idx}">
				<div class="surveyList item">
					<div class="surveyList surveyTitle">${dto.survey_title}</div>
					<div class="surveyList surveyDate subject">조사기간</div>
					<div class="surveyList surveyDate content">${dto.survey_date}</div>
					<div class="surveyList surveyTime subject">응답시간</div>
					<div class="surveyList surveyTime content">${dto.survey_time}</div>
					<div class="surveyList surveyPoint subject">포인트</div>
					<div class="surveyList surveyPoint content">${dto.survey_point}</div>
				</div>
			</a>
		</c:forEach>
		
		
		
	</div>
	
	<div class="page_wrap">
		    <div class="page_nation">
		      <c:if test="${paging.prev }">
		         <a class="arrow pprev" href="${cpath }/survey/list?page=1"></a>
		      </c:if>	
		    
		      <c:if test="${paging.prev }">
		         <a class="arrow prev" href="${cpath }/survey/list?page=${paging.begin - 1}"></a>
		      </c:if>
		      
		      <c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
		         <a style="font-size: 20px" class="${paging.page == i ? 'active' : '' }" 
		            href="${cpath }/survey/list?page=${i}">${i}</a>
		      </c:forEach>
		      
		      <c:if test="${paging.next }">
		         <a class="arrow next" href="${cpath }/survey/list?page=${paging.end + 1}"></a>
		      </c:if>
		      
		      <c:if test="${paging.next }">
		         <a class="arrow nnext" href="${cpath }/survey/list?page=${paging.pageCount }"></a>
		      </c:if>   
		   </div>
	</div>
</div>




</body>
</html>