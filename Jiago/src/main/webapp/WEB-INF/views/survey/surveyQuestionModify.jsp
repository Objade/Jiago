<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.questionList.container {
	border: 1px solid black;
	padding: 10px;
	margin: 10px;
	width: 500px;
	height: 100px;
	overflow-y: scroll;
}

input[type="text"] {
	width: 250px;
}

.question {
	border: 1px solid black;
	padding: 10px;
	margin: 10px;
	width: 500px;
}
</style>

</head>
<body>

	<h3>설문 질문 수정하기</h3>

	<h4>설문 질문 리스트</h4>

	<div class="questionList container">
		<input type="text" onkeyup="filter()" name="search" id="search"
			placeholder="질문의 키워드를 입력하세요.">

		<c:forEach var="dto" items="${list }">
			<div class="questionList questionItem">
				<input type="checkbox" value="${dto.question_idx }"
					name="question_idx"><span class="eachQuestion">${dto.question_content }</span>
			</div>
		</c:forEach>
	</div>


	<button id="button">질문 생성</button>

	<form method="POST">
		<div class="wrap">
			<div class="items">
				<c:forEach var="dto" items="${qList }" varStatus="status">
					<div class="question" id="question">
						<input type="text" id="question_content" name="question_content"
							placeholder="질문 추가" question_idx="${dto.question_idx}"
							value="${dto.question_content}"><button id="exbutton" type="button">보기추가</button><button id="drop" type="button">삭제</button>
						<c:forEach var="dtoEX" items="${exList }" varStatus="status">
							<c:if test="${dto.question_idx == dtoEX.question_idx }">
								<div class="example">
									<input type="text" id="example_content" name="example_content"
										placeholder="보기 추가" question_idx="${dtoEX.question_idx}"
										value="${dtoEX.example_content }"><button id="delete" type="button">삭제</button>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
			<input type="submit" value="제출">
	</form>


	<script>
        const button = document.querySelector('#button')
        const items = document.querySelector('.items')
        const example = document.querySelector('.example')
        const question = document.querySelector('.question')

        function buttonHandler(event) {
            const question = document.createElement('div')
            question.classList.add('question')
            question.setAttribute('id', 'question')

            const input = document.createElement('input')
            
            const index = document.querySelectorAll('div.question').length

            input.setAttribute('type', 'text')
            input.setAttribute('id', 'question_content')
            input.setAttribute('name', 'question_content')
            input.setAttribute('placeholder', '질문 추가')
            input.setAttribute('question_idx', '0')

            const button = document.createElement('button')
            button.innerHTML = "보기 추가"
            button.setAttribute('id', 'exbutton')
            button.setAttribute('type', 'button')

            const insert = document.createElement('button')
            insert.innerHTML = "삭제"
            insert.setAttribute('id', 'drop')
            insert.setAttribute('type', 'button')
         

            question.appendChild(input)
            question.appendChild(button)
            question.appendChild(insert)
            items.appendChild(question)

            // title 삭제
            const dropbutton = Array.from(document.querySelectorAll('#drop'))

            function dropHandler(event) {
               event.target.parentNode.remove()
            }      
            dropbutton.forEach(e => e.onclick = dropHandler)


            // 보기 추가
            const exbutton = Array.from(document.querySelectorAll('#exbutton'))
            console.log(exbutton)
            
            function exbuttonHandler(event) {
               const example = document.createElement('div')
               example.classList.add('example')

               const input = document.createElement('input')

               input.setAttribute('type', 'text')
               input.setAttribute('id', 'example_content')
               input.setAttribute('name', 'example_content')
               input.setAttribute('placeholder', '보기 추가')
               input.setAttribute('question_idx', '0')

               const insert = document.createElement('button')
               insert.innerHTML = "삭제"
               insert.setAttribute('id', 'delete')
               insert.setAttribute('type', 'button')

               example.append(input)
               example.appendChild(insert)
               event.target.parentNode.appendChild(example)

               // 보기 삭제
               const deleteButton = Array.from(document.querySelectorAll('#delete'))
               console.log(deleteButton)

               function deleteHandler(event) {
                  event.target.parentNode.remove()

               }

               deleteButton.forEach(e => e.onclick = deleteHandler)
            }

            exbutton.forEach(e => e.onclick = exbuttonHandler)

         }

        button.onclick = buttonHandler

        
        // 질문 검색 필터
        function filter() {
            var search, questionItem, eachQuestion;

            search = document.getElementById("search").value;
            console.log("search : " + search);
            questionItem = document.querySelectorAll(".questionItem");
            console.log(questionItem)


            for (let i = 0; i < questionItem.length; i++) {
                eachQuestion = questionItem[i].getElementsByClassName('eachQuestion');
                console.log(eachQuestion)
                console.log(eachQuestion[0].innerHTML.indexOf(search))

                if (eachQuestion[0].innerHTML.indexOf(search) > -1) {
                    questionItem[i].style.display = 'block'
                }
                else {
                    questionItem[i].style.display = 'none'
                }
            }
        }
    </script>



	<script>
        const item = Array.from(document.querySelectorAll('.questionList.questionItem'))

        const checkbox = Array.from(document.querySelectorAll('.questionList.questionItem > input[type="checkbox"]'))
        for (let i = 0; i < checkbox.length; i++) {
            checkbox[i].setAttribute('idx', i)
        }

        function checkboxHandler(event) {
            if (event.target.checked == true) {
               const question = document.createElement('div')
               question.classList.add('question')
               question.setAttribute('id', 'question')           

               const input = document.createElement('input')
               const value = event.target.getAttribute('value')
               console.log(value)

               input.setAttribute('type', 'text')
               input.setAttribute('name', 'question_content')
               input.setAttribute('id', 'question_content')
               input.setAttribute('value', item[event.target.getAttribute('idx')].innerText)
               input.setAttribute('question_idx', value)

               question.setAttribute('value', value)

               const button = document.createElement('button')
               button.innerHTML = "보기 추가"
               button.setAttribute('id', 'exbutton')
               button.setAttribute('type', 'button')

               const insert = document.createElement('button')
               insert.innerHTML = "삭제"
               insert.setAttribute('id', 'drop1')
               insert.setAttribute('type', 'button')

               question.appendChild(input)
               question.appendChild(button)
               question.appendChild(insert)

               items.appendChild(question)

               const checkboxex = document.querySelectorAll('#exbutton')
               console.log(checkboxex)

               // title 삭제
               const dropbutton = Array.from(document.querySelectorAll('#drop1'))

               function dropHandler(event) {
                  const input = Array.from(document.querySelectorAll('input[type="checkbox"]:checked'))

                  const test= input.filter(data => event.target.parentNode.getAttribute('value').includes(data.getAttribute('value')) == true)
                  console.log(test)
                  test[0].checked = false
        
                  event.target.parentNode.remove()
               }      
               dropbutton.forEach(e => e.onclick = dropHandler)


               // 체크박스 질문 추가
               function checkboxexHandler(event) {
                  const example = document.createElement('div')
                  example.classList.add('example')

                  const input = document.createElement('input')

                  input.setAttribute('type', 'text')
                  input.setAttribute('id', 'example_content')
                  input.setAttribute('name', 'example_content')
                  input.setAttribute('placeholder', '보기 추가')
                  input.setAttribute('question_idx', event.target.parentNode.getAttribute('value'))

                  const insert = document.createElement('button')
                  insert.innerHTML = "삭제"
                  insert.setAttribute('id', 'delete')
                  insert.setAttribute('type', 'button')

                  example.append(input)
                  example.appendChild(insert)
                  event.target.parentNode.appendChild(example)

                  const deleteButton = Array.from(document.querySelectorAll('#delete'))
                  console.log(deleteButton)

                  // 보기 삭제
                  function deleteHandler(event) {
                     event.target.parentNode.remove()

                  }  

                  deleteButton.forEach(e => e.onclick = deleteHandler)
               }

               checkboxex.forEach(e => e.onclick = checkboxexHandler)

            }
            else {               
               const question = Array.from(document.querySelectorAll('.question'))
               
               const checkboxclear= question.filter(data => event.target.value.includes(data.getAttribute('value')) == true)
            
               checkboxclear.map(e => e.remove())              

            }

            }

      checkbox.map(e => e.onchange = checkboxHandler)
    </script>

	<script>
      const form = document.forms[0]
        
         function testHandler(event) {
             event.preventDefault() 

           const questionDivList = Array.from(document.querySelectorAll('.question'))
           const result = questionDivList.map(e => {
              const ob = {}
              ob['question_idx'] =       +e.querySelector('#question_content').getAttribute('question_idx')
              ob['question_content'] =    e.querySelector('#question_content').value
              ob['example_content'] =       []
              
              const example_contentList = e.querySelectorAll('input[name="example_content"]')
              example_contentList.forEach(ee => {
                 ob['example_content'].push(ee.value)
              })
                return ob
           })
           console.log(result)

           
           const cpath = '/jiago'
         const url = location.href
           const opt = {
                 method: 'POST',
                 body: JSON.stringify(result),
                 headers: {
                    'Content-Type' : 'application/json; charset=utf-8'
                 }
           }
           
           fetch(url, opt)
           .then(resp => resp.text())
           .then(text => {
              alert(text)
              location.href = cpath      // 이후에는 관리자 페이지 메인으로 이동하도록 수정할것
           })
           .error(err => console.log(err))
           
        }
        
      form.onsubmit = testHandler
                 
    </script>



</body>
</html>