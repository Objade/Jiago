<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<div class="main" value="0">
 	 <div class="surveyList_start"><img src="${cpath }/resources/img/survey_startpage.png" style="width: 300px;"></div>

   <c:forEach var="dto" items="${list }" varStatus="status">
      <div class="surveyList item" question_idx="${dto.question_idx}" index="${status.count }">
         <div class="surveyList surveyTitle question">${status.count} ${dto.question_content}</div>
      </div>
   </c:forEach>

   <c:forEach var="dtoEX" items="${exList }" varStatus="status">
      <div class="surveyList example" question_idx="${dtoEX.question_idx}">
         <div class="surveyList surveyExample">
            <input type="radio" name="${dtoEX.question_idx }" value="${dtoEX.example_content }" required>
               ${dtoEX.example_content }
         </div>
      </div>
   </c:forEach>
</div>

<button class="button before">이전</button>
<button class="button after">다음</button>
 
<a href="${cpath }/survey/surveyComplete/${survey_idx}"><button class="button submit">제출</button></a>


	<script>
		// 문제와 보기의 question_idx가 같으면 보기에 index를 문제의 index로 넣는다.

		const item1 = Array.from(document.querySelectorAll('.surveyList.item'))
		const item2 = Array.from(document.querySelectorAll('.surveyList.example'))		

		const item1_get = item1.map(e => console.log(e.getAttribute('question_idx')))	// 문제의 question idx
	
		const item2_get = item2.map(e => console.log(e.getAttribute('question_idx')))	// 보기의 question idx
		
		item1.forEach(e1 => {
			const idx1 = e1.getAttribute('question_idx')
			item2.forEach(e2 => {
				const idx2 = e2.getAttribute('question_idx')
				if(idx1 == idx2){

					e2.setAttribute('index', +e1.getAttribute('index'))
				}
			})
		})
		
	</script>
	
	
	<script>
	//	설문 시작 시 이전 버튼 빼고 다음버튼을 설문 시작으로 변경하기
	const before = document.querySelector('.button.before')
	const after = document.querySelector('.button.after')

	console.log(before)
	console.log(after)



	</script>


   <script>
      const main = document.querySelector('.main')

      const buttonBefore = document.querySelector('.button.before')
      const buttonAfter = document.querySelector('.button.after')
      const buttonSubmit = document.querySelector('.button.submit')
      
      buttonSubmit.classList.add('hidden')     

      const questionAll = Array.from(document.querySelectorAll('.surveyList.item'))
        
      const exampleAll = Array.from(document.querySelectorAll('.surveyList.example'))
             
      questionAll.map(e => e.classList.add('hidden'))
      exampleAll.map(e => e.classList.add('hidden'))

      const input = Array.from(document.querySelectorAll('.surveyList.surveyExample > input[type="radio"]'))
      
      
      // 설문 시작 시 멘트 변경      
      function surveyStart(event) {
		buttonBefore.classList.add('hidden')
		buttonAfter.innerText = '설문시작'

	  }

	  window.onload = surveyStart
      
      
		
      // 정답 제출할거
      function submitHandler(event) {
    	 const inputArr = Array.from(document.querySelectorAll('.surveyList.surveyExample > input[type="radio"]:checked')).map(e => e.value)
    	     	          
    	 if(inputArr.length == questionAll.length) {   // 문항수와 정답지의 길이가 같으면 실행함
           
            const ob = {
               user_idx: '${login.user_idx}',
               answer_content: inputArr,
            }
            
            const cpath = '${cpath}'
            const url = cpath + '/survey/surveyAnswer/${survey_idx}'
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
                console.log(text)
             })
         }
      }
      
      
      // 답을 저장해두는 배열!
      function inputHandler(event) {
         const inputArr = Array.from(document.querySelectorAll('.surveyList.surveyExample > input[type="radio"]:checked')).map(e => e.value)
         console.log(inputArr)

         const submit = document.querySelector('.button.submit')
         
         if(inputArr.length == questionAll.length) {  
	     	buttonSubmit.classList.remove('hidden')
	     }
      }
      input.map(e => e.onclick = inputHandler)
      
      
      // 이전 문제와 보기를 보여주는 핸들러
        function buttonBeforeHandler(event) {
    	 buttonAfter.classList.remove('hidden')
         if(main.getAttribute('value') > 1) {
            questionAll.map(e => e.classList.add('hidden'))
            exampleAll.map(e => e.classList.add('hidden'))
            main.setAttribute('value', +main.getAttribute('value')-1)
            let question = ''
            let example = ''

            const mainValue = document.querySelector('.main').getAttribute('value')
         
            question = questionAll.filter(data => (data.getAttribute('index') == mainValue) == true)
            example = exampleAll.filter(data => (data.getAttribute('index') == mainValue) == true)
            
            question.forEach(e => e.classList.remove('hidden'))
            example.forEach(e => e.classList.remove('hidden'))
         }
    	 if(main.getAttribute('value') == 1) {
            	buttonBefore.classList.add('hidden')
       	  }
        }

      // 다음 문제와 보기를 보여주는 핸들러
        function buttonAfterHandler(event) {
    	  buttonBefore.classList.remove('hidden')
         if(main.getAttribute('value') < questionAll.length) {
        	after.innerText = '다음'
        	const start = document.querySelector('.surveyList_start')
			start.classList.add('hidden')
        	        	 
            questionAll.map(e => e.classList.add('hidden'))
            exampleAll.map(e => e.classList.add('hidden'))
            main.setAttribute('value', +main.getAttribute('value')+1)
            let question = ''
            let example = ''

            const mainValue = document.querySelector('.main').getAttribute('value')

            question = questionAll.filter(data => (data.getAttribute('index') == mainValue) == true)
            example = exampleAll.filter(data => (data.getAttribute('index') == mainValue) == true)

            question.forEach(e => e.classList.remove('hidden'))
            example.forEach(e => e.classList.remove('hidden'))
         }
    	  if(main.getAttribute('value') == questionAll.length) {
         	buttonAfter.classList.add('hidden')
    	  }
    	  if(main.getAttribute('value') == 1) {
           	buttonBefore.classList.add('hidden')
      	  }
        }
      
      buttonBefore.onclick = buttonBeforeHandler
      buttonAfter.onclick = buttonAfterHandler
      buttonSubmit.onclick = submitHandler
    </script>

</body>
</html>