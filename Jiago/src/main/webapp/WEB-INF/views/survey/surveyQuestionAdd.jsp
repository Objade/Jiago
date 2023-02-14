<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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

</style>

</head>
<body>

<h3>설문 질문 추가하기</h3>

<h4>설문 질문 리스트</h4>


<div class="questionList container">
   <input onkeyup="filter()" type="text" id="search" name="search" placeholder="질문의 키워드를 입력하세요.">

   
   <div class="questionList questionItem">
      <input type="checkbox" value="2" name="question_idx">
      <span class="eachQuestion">2. 당신의 연령대는?</span>
   </div>
   
   <div class="questionList questionItem">
      <input type="checkbox" value="3" name="question_idx">
      <span class="eachQuestion">3. 당신의 성별은?</span>
   </div>
   
   <div class="questionList questionItem">
      <input type="checkbox" value="4" name="question_idx">
      <span class="eachQuestion">4. 당신의 직업은?</span>
   </div>
   
   <div class="questionList questionItem">
      <input type="checkbox" value="5" name="question_idx">
      <span class="eachQuestion">5. 좋아하는 치킨은?</span>
   </div>
   
</div>
<button id="button">질문 생성</button>
<button id="exbutton">보기 추가</button>
   <form>
      <div class="wrap">
         <div class="items"></div>          
      </div>
  </form>

  
    <script>
        const button = document.querySelector('#button')

		const exbutton = document.querySelector('#exbutton')
		
		const items = document.querySelector('.items')
		
		const example = document.querySelector('.example')
		
		function buttonHandler(event) {
		    const question = document.createElement('div')
		    question.classList.add('question')
		    
		    const input = document.createElement('input')
		
		    input.setAttribute('type', 'text')
		    input.setAttribute('name', 'question_content')
		    input.setAttribute('placeholder', '질문 추가')
		   
		    question.appendChild(input)
		    items.appendChild(question)
		}
		
		button.onclick = buttonHandler
		
		function exampleHandler(event) {
		    const example = document.createElement('div')
		    example.classList.add('example')
		
		    const input = document.createElement('input')
		
		    const last = items.lastChild
		    console.log(last)
		
		    input.setAttribute('type', 'text')
		    input.setAttribute('name', 'question_example')
		    input.setAttribute('placeholder', '보기 추가')
		
		    example.append(input)
		    last.appendChild(example)   
		}
		
		exbutton.onclick = exampleHandler

        
        function filter() {
            var search,  questionItem, eachQuestion;

            search = document.getElementById("search").value;
            console.log("search : " + search);
            questionItem = document.querySelectorAll(".questionItem");
            console.log(questionItem)


            for(let i = 0; i <  questionItem.length; i++) {
                eachQuestion =  questionItem[i].getElementsByClassName('eachQuestion');
                console.log(eachQuestion)
                console.log(eachQuestion[0].innerHTML.indexOf(search))

                if(eachQuestion[0].innerHTML.indexOf(search) > -1) {
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
        for(let i = 0; i < checkbox.length; i++) {
            checkbox[i].setAttribute('idx',i)
        }
                
        function checkboxHandler(event) {
            if(event.target.checked == true) {
                const question = document.createElement('div')
		        question.classList.add('question')
		    
		        const input = document.createElement('input')
		
		        input.setAttribute('type', 'text')
		        input.setAttribute('name', 'question_content')
		        input.setAttribute('value', item[event.target.getAttribute('idx')].innerText)
		   
		        question.appendChild(input)
		        items.appendChild(question)
            }
            else {
                const div = document.querySelector('.question')
                div.remove()
            }
        }
        checkbox.map(e => e.onchange = checkboxHandler)        
    </script>

</body>
</html>