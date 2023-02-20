<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="cpath"  value="${pageContext.request.contextPath }"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SurveyManage</title>
<style>
	.hidden {
		display: none;
	}
	
	.surveyManage.surveyList {
		border: 1px solid black;
		border-collapse: collapse;

	}
	
	.surveyManage.surveyList > thead > tr > th {
		background-color: #648C85;
	}
	
	.surveyManage.surveyList  th, td {
		border: 1px solid black;
		padding: 10px;
		text-align: center;
	}
	
	.surveyManage.surveyList tr:hover td {
		background-color: #dadada;
		cursor: pointer;
	}
	
	.page_wrap {
        	margin-top: 20px;
			text-align:center;
			font-size:0;
 		}
 		
		.page_nation {
			display:inline-block;
		}
		
		.page_nation a {
			display:block;
			margin:0 3px;
			float:left;
			border:1px solid #e6e6e6;
			width:28px;
			height:28px;
			line-height:28px;
			text-align:center;
			background-color:#fff;
			font-size:13px;
			color:#999999;
			text-decoration:none;
		}
		.page_nation .arrow {
			border:1px solid #ccc;
		}
		.page_nation .pprev {
			background:#f8f8f8 url('${cpath}/resources/img/page_pprev.png') no-repeat center center;
			margin-left:0;
		}
		.page_nation .prev {
			background:#f8f8f8 url('${cpath}/resources/img/page_prev.png') no-repeat center center;
			margin-right:7px;
		}
		.page_nation .next {
			background:#f8f8f8 url('${cpath}/resources/img/page_next.png') no-repeat center center;
			margin-left:7px;
		}
		.page_nation .nnext {
			background:#f8f8f8 url('${cpath}/resources/img/page_nnext.png') no-repeat center center;
			margin-right:0;
		}
		.page_nation .active  {
			background-color:#1B434A;
			color:#fff;
			border:1px solid #1B434A;
		}


</style>

</head>
<body>
	
	<h1>설문 관리</h1>
	
	<h2><a href="${cpath }">홈</a></h2>
	<h2><a href="${cpath }/survey/surveyAdd">설문 추가</a></h2>
	
	<h3>설문관리</h3>
		<label><input type="checkbox" class="deletecheckbox">삭제 한 것도 보기</label>
		<table class="surveyManage surveyList">
			<thead>
				<tr>
					<th>설문 번호</th>
					<th>회사 번호</th>
					<th>설문 제목</th>
					<th>조사 기간</th>
					<th>삭제 여부</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="dto" items="${list }">
					<tr onclick="location.href = '${cpath }/survey/surveyView/${dto.survey_idx}'">
						<td>${dto.survey_idx}</td>
						<td>${dto.company_idx}</td>
						<td>${dto.survey_title}</td>
						<td>${dto.survey_date}</td>
						<td class="check_delete">${dto.survey_delete}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	<script>
		const checkbox = document.querySelector('input[type="checkbox"]')
		console.log(checkbox)
		let value = 0;

		function handler(event) {
			if(event.target.checked == true) {
				value = 1;
			}
		}
		
		checkbox.onchange = handler
		
	
	</script>
		
		
		    <div class="page_nation">
		      <c:if test="${paging.prev }">
		         <a class="arrow pprev" href="${cpath }/survey/surveyManage?page=1&check=${value }"></a>
		      </c:if>	
		    
		      <c:if test="${paging.prev }">
		         <a class="arrow prev" href="${cpath }/survey/surveyManage?page=${paging.begin - 1}&check=${value }">
		         
		         </a>
		      </c:if>
		      
		      <c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
		         <a style="font-size: 20px" class="${paging.page == i ? 'active' : '' }" 
		            href="${cpath }/survey/surveyManage?page=${i}&check=${value }">${i}</a>
		      </c:forEach>
		      
		      <c:if test="${paging.next }">
		         <a class="arrow next" href="${cpath }/survey/surveyManage?page=${paging.end + 1}&check=${value }"></a>
		      </c:if>
		      
		      <c:if test="${paging.next }">
		         <a class="arrow nnext" href="${cpath }/survey/surveyManage?page=${paging.pageCount }&check=${value }"></a>
		      </c:if>   
		   </div>
		  </div>
		  
		  
		  <script>
            const item = Array.from(document.querySelectorAll('tbody > tr')) // 목록
            console.log(item)
            

            const title = Array.from(document.querySelectorAll('.title')) // 제목
            console.log(title)
        
            const checkDelete = Array.from(document.querySelectorAll('.check_delete'))  // 삭제 여부
            console.log(checkDelete)
            console.log(checkDelete.map(e => e.innerText))
            console.log(checkDelete.map(e => e.parentNode))



            function deleteHandler() {
                checkDelete.map(e => {
                    if(e.innerText == 'Y') {
                        e.parentNode.classList.add('hidden')
                    }
                })
            }

            window.onload = deleteHandler          

        </script>

        <script>
            const deleteCheckbox = document.querySelector('.deletecheckbox')
            console.log(deleteCheckbox)

            function deleteCheckboxHandler(event) {
                console.log(event)
                console.log(event.target.checked == true)
                if(event.target.checked == true) {
                    checkDelete.map(e => e.parentNode.classList.remove('hidden'))
                }
                else {
                  deleteHandler()  
                }
            }

            deleteCheckbox.onchange = deleteCheckboxHandler
        </script>

</body>
</html>