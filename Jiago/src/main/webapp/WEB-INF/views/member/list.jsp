<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../manage/manageHeader.jsp" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://webfontworld.github.io/yangheeryu/Dongle.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#member_root {
	width: 100%;
	margin: auto;
	justify-content: center;
}

.hidden {
	display: none;
}

.memberManage.memberList {
	border: 1px solid #dadada;
	border-collapse: collapse;
	width: 100%;
}

.memberManage.memberList>thead>tr>th {
	background-color: #1B434A;
	color: white;
}
.memberManage.memberList>thead>tr>th:first-child{
	width: 20px;
}
.memberManage.memberList>thead>tr>th:first-child img{
	background-color: #1B434A;
	height: 20px;
	
}
.memberManage.memberList th {
	padding: 10px;
	text-align: center;
}

.memberManage.memberList td {
	border: 1px solid #dadada;
	padding: 10px;
	text-align: center;
}

.memberManage.memberList tr:hover td {
	background-color: #dadada;
}

.page_wrap {
	margin-top: 20px;
	text-align: center;
	font-size: 0;
}

.page_nation {
	display: inline-block;
}

.page_nation a {
	display: block;
	margin: 0 3px;
	float: left;
	border: 1px solid #e6e6e6;
	width: 28px;
	height: 28px;
	line-height: 28px;
	text-align: center;
	background-color: #fff;
	font-size: 13px;
	color: #999999;
	text-decoration: none;
}

.page_nation .arrow {
	border: 1px solid #ccc;
}

.page_nation .pprev {
	background: #f8f8f8 url('${cpath}/resources/img/page_pprev.png')
		no-repeat center center;
	margin-left: 0;
}

.page_nation .prev {
	background: #f8f8f8 url('${cpath}/resources/img/page_prev.png')
		no-repeat center center;
	margin-right: 7px;
}

.page_nation .next {
	background: #f8f8f8 url('${cpath}/resources/img/page_next.png')
		no-repeat center center;
	margin-left: 7px;
}

.page_nation .nnext {
	background: #f8f8f8 url('${cpath}/resources/img/page_nnext.png')
		no-repeat center center;
	margin-right: 0;
}

.page_nation .active {
	background-color: #1B434A;
	color: #fff;
	border: 1px solid #1B434A;
}
.page_nation a {
	font-family: 'Dongle';
}

.img_home {
	padding-bottom: 20px;
}

.img_home>a {
	font-size: 25px;
	text-decoration-line: none;
	color: black;
}

.img_home>a>img {
	padding-right: 5px;
	width: 25px;
}

.img_survey {
	justify-content: flex-end;
	text-align: right;
	padding-top: 20px;
}

.img_survey>a {
	font-size: 25px;
	text-decoration-line: none;
	color: black;
}

.img_survey>a>img {
	padding-right: 5px;
	width: 25px;
}
.search {
	padding-top: 20px;
	padding-bottom: 10px;
	z-index: 1;
}

.search>form {
	position: relative;
	width: 500px;
	display: flex;
}

#add_input {
	width: 400px;
	height: 20px;
	border: 1px solid #bbb;
	border-right: none;
	padding: 10px 12px;
	font-size: 14px;
	border-bottom: 2px solid #bbb;
}

#add_input2 {
	width: 100px;
	border-left: none;
	border: 1px solid #bbb;
	font-family: 'Dongle';
	font-size: 25px;
	background-color: #1B434A;
	color: white;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="img_home">
		<a href="${cpath }"><img src="${cpath }/resources/img/홈.png">Home</a>
	</div>
   
   <div id="member_root">
   
   <h1>회원 목록</h1>
   
   <div class="search">
			<form>
				<input id="add_input" type="text" name="user_id"
					placeholder="조회할 회원 아이디를 적어주세요" value="${user_id }" /> <input
					id="add_input2" type="submit" value="검색" />
			</form>
	</div>
   
<form method="POST" action="${cpath }/memberAjax" class="delForm">
      <table class="memberManage memberList">
         <thead>
            <tr>
               <th>
               		<input type="checkbox" name="checkAll" id="th_checkAll" />
               </th>
               <th>회원 번호</th>
               <th>회원 타입</th>
               <th>회원 이름</th>
               <th>회원 아이디</th>
               <th>생일</th>
               <th>성별</th>
               <th>주소</th>
               <th>전화번호</th>
               <th>이메일주소</th>
               <th>직업</th>
               <th>가입일</th>
               <th>탈퇴여부</th>
               <th>약관동의여부</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="dto" items="${list }">
               <tr class="">
               	  <td>
               	  		<input type="checkbox" name="checkRow" value="${dto.user_idx}">
               	  </td>	
                  <td>${dto.user_idx}</td>
                  <td>${dto.user_type}</td>
                  <td>${dto.user_name}</td>
                  <td>${dto.user_id}</td>
                  <td>${dto.user_birth}</td>
                  <td>${dto.user_gender}</td>
                  <td>${dto.user_address}</td>
                  <td>${dto.user_phone}</td>
                  <td>${dto.user_email}</td>
                  <td>${dto.user_job}</td>
                  <td>${dto.user_joindate}</td>
                  <td>${dto.user_withdraw}</td>
                  <td>${dto.user_agree}</td>
               </tr>
            </c:forEach>
         </tbody>
      </table>
      <div class="delete_button hidden">
      <input type="submit" value="삭제">
   </div>
   
</form>
      
      <div class="page_wrap">
          <div class="page_nation">
            <c:if test="${paging.prev }">
               <a class="arrow pprev"
						href="${cpath }/member/list?page=1&user_id=${user_id}"></a>
            </c:if>   
          
            <c:if test="${paging.prev }">
               <a class="arrow prev"
						href="${cpath }/member/list?page=${paging.begin - 1}&user_id=${user_id}">
               
               </a>
            </c:if>
            
            <c:forEach var="i" begin="${paging.begin }"
					end="${paging.end }">
               <a style="font-size: 20px"
						class="${paging.page == i ? 'active' : '' }"
						href="${cpath }/member/list?page=${i}&user_id=${user_id}">${i}</a>
            </c:forEach>
            
            <c:if test="${paging.next }">
               <a class="arrow next"
						href="${cpath }/member/list?page=${paging.end + 1}&user_id=${user_id}"></a>
            </c:if>
            
            <c:if test="${paging.next }">
               <a class="arrow nnext"
						href="${cpath }/member/list?page=${paging.pageCount }&user_id=${user_id}"></a>
            </c:if>   
         </div>
      </div>
    </div>
    <script>
        const checkbox_top = document.querySelector('#th_checkAll')

        function allCheckHandler(event) {
            const allCheckbox = document.querySelectorAll('input[name="checkRow"]')

            const delete_but = document.querySelector('.delete_button')

            if(event.target.checked == true) {
                allCheckbox.forEach(e => e.checked = true)
                delete_but.classList.remove('hidden')
            }
            else {
                allCheckbox.forEach(e => e.checked = false)
                delete_but.classList.add('hidden')
            }
        }
        checkbox_top.onchange = allCheckHandler
        

        const allCheckbox = Array.from(document.querySelectorAll('input[name="checkRow"]'))

        function allDeleteHandler(event) {
         const allCheckbox1 = Array.from(document.querySelectorAll('input[name="checkRow"]:checked'))

         const delete_but = document.querySelector('.delete_button')

         if(allCheckbox1.length != 0) {
            delete_but.classList.remove('hidden')
         }
         else {
            delete_but.classList.add('hidden')
         }
         
         }
         allCheckbox.forEach(e => e.onchange = allDeleteHandler)  

    </script>
    
   	<script>
        const delForm = document.querySelector('.delForm')
        console.log(delForm)

        function delMember(event) {
            const allCheckbox = Array.from(document.querySelectorAll('input[name="checkRow"]:checked'))

            const checkbox2Value = Array.from(allCheckbox.map(e => e.value)) 

            const ob = {
               answer_content: checkbox2Value
            }

            const cpath = '/jiago'
            const url = cpath + '/memberAjax'
            
            const opt = {
                method: 'POST',
                body: JSON.stringify(ob),
                headers: {
                        'Content-Type': 'application/json; charset=utf-8'
                }

            }
            fetch(url, opt)
            .then(resp => resp.text())
            .then(text => {
            	alert(text)
            	location.reload()
            })
            
            
            
        }
    
        delForm.onsubmit = delMember

    </script>
</body>

</html>