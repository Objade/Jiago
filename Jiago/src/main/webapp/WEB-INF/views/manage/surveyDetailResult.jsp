<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../manage/manageHeader.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>

   #surveyDetailResult {
      width: 500px;
      display:flex;
     
   }
</style>


<h3>설문 결과</h3>


<div id="surveyDetailResult"></div>



<script>

const cpath = '/jiago'
const survey_idx = '${survey_idx}'
const url = cpath + '/manage/getSurveyDetailResult/' + survey_idx

fetch(url)
.then(resp => resp.json())
.then(json => {   
     console.log(json)

     console.log(json[0])
     
    
     const arr = json[0].map(e => {
        return {'질문': e.question_content,'답': e.answer_content,'결과': e.count}
      })
              
     console.log(arr)
     
     const array = new Array()
     for(let i = 0; i < Object.keys(json).length; i++) {
        array.push(json[i].map(e => {
           return {'질문': e.question_content,'답': e.answer_content,'결과': e.count}
         }))
     }
     
     console.log(array)
     
     const question = new Array();
     for(let i = 0; i < array.length; i++) {
    	question.push(array[i][0])
    	 
     }
     
   	 console.log(question)
   	 
   	 const questions = new Array();
   	 questions.push(question.map(e => e.질문))
   	 
   	 console.log(questions)
   	 console.log(questions[0][0])
   	 
     const answer = new Array();
     for(let i = 0; i < array.length; i++) {
        answer.push(array[i].map(e => {
           return {'답': e.답}
        }))
     }
     
     console.log(answer)
     
     const count = new Array();
     for(let i = 0; i < array.length; i++) {
        count.push(array[i].map(e => {
           return {'결과': e.결과}
        }))
     }
     
     console.log(count)
     
     
     const answers = [];
     
     for(let i = 0; i < answer.length; i++) {
        answers.push(answer[i].map(e => e.답));
     }
     
     console.log(answers)
     
     
     const counts = [];
     
     for(let i = 0; i < answer.length; i++) {
        counts.push(count[i].map(e => e.결과));
     }
     
     console.log(counts)
     
     
       const test = document.querySelector('#surveyDetailResult')

       for(let i = 0; i < array.length; i++) {
            const test1 = document.createElement('canvas')
            test1.id = 'myChart'+[i]
            test.appendChild(test1)
        }     
     
        for(let i = 0; i < array.length; i++) {
                     
           let context = document.getElementById('myChart' + i)
           const labels = answers[i]
      
         const data = {
            labels : labels,
            datasets: [
               {
                  label: labels[i],
                  data: counts[i]
               },
            ]
            
         }
         
         const config = {
            type: 'doughnut',
            data: data,
            options: {
                plugins: {
                    title: {
                        display: true,
                        text: questions[0][i]
                 
                    }
                }
            }
         
         }
         
         const myChart = new Chart(context, config)   
         console.log(questions[0][i])
           
        }  
     
})

</script>


</body>
</html>