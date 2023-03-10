const modifyCheckbox = Array.from(document.querySelectorAll('.questionList.questionItem > input[type="checkbox"]'))
      const question_content = Array.from(document.querySelectorAll('#question_content'))
      const question_content_idx = question_content.map(e => e.getAttribute('question_idx'))

      const result = modifyCheckbox.filter(ob => question_content_idx.includes(ob.value))   
      result.forEach(e => e.checked = 'checked')
      
      function resultHandler(event) {
         const rest1 = question_content.filter(ob => event.target.value.includes(ob.getAttribute('question_idx')))
         rest1[0].parentNode.remove()

      }
      result.forEach(e => e.onclick = resultHandler)
      
      
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
            input.setAttribute('required', 'required')

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
            const rest2 = event.target.previousSibling.previousSibling.getAttribute('question_idx')
            const result10 = modifyCheckbox.filter(ob => rest2.includes(ob.value))   
            result10.forEach(e => e.checked = '')
            
            
            
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
               input.setAttribute('required', 'required')

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
             input.setAttribute('required', 'required')

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
                input.setAttribute('required', 'required')

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
                console.log(text == '이미 질문 리스트에 등록 된 질문 입니다.')
                 alert(text)
                 if(text != '이미 질문 리스트에 등록 된 질문 입니다.') {
                    location.href = cpath + "/survey/surveyManage"
                 }else {
                    const result100 = Array.from(document.querySelectorAll('#question_content'))
                    console.log(result100)
                    console.log(result100.map(e => e.value))
                 }

              })
      }