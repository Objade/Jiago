<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../manage/manageHeader.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
#surveyPreferJob {
   width: 500px;
   display: flex;
}
</style>


<h3>직업별 선호질문</h3>

<select class="choice"></select>

<table>

	<thead>
		<tr>
			<th>직업</th>
			<th>설문 제목</th>
			<th>참여 횟수</th>
		</tr>
	</thead>
	<tbody>

		<c:forEach var="dto" items="${list }">
			<tr>
				<td>${dto.user_job }</td>
				<td>${dto.survey_title }</td>
				<td>${dto.count }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>


<div class="surveyPreferJob">
	<div id="surveyPreferJob"></div>
</div>




<script>

	const cpath = '/jiago'
	const survey_idx = '${survey_idx}'
	const url = cpath + '/manage/getSurveyPreferJob'

	fetch(url)
	.then(resp => resp.json())
	.then(json => {   
	     console.log(json)
	    
	      // 기본 select 만듦       
	      const choice = document.querySelector('.choice')
	      console.log(choice)
	      
	      const option = document.createElement('option')
	      console.log(option)
	      option.innerText = '직업 선택'
	         
	      choice.appendChild(option)
	      
	     
		const userJob = []
	     for(let key in json) {
	    	 userJob.push(json[key].user_job)
	     }
	     console.log(userJob)
	     
	     const job = userJob.filter((v, i) => userJob.indexOf(v) === i);
	     
	     console.log(job)
	     
	     
	     // option에 value 값 지정
        for(let i = 0; i < job.length; i++) {
           const options = document.createElement('option')
           options.innerText = job[i]
           options.setAttribute('value', 'myChart'+[i])
           
           choice.appendChild(options)
        }
	     
	     const jsonToArray = []
	     
	     for(let key in json) {
			for(let k in job) { 
				if(job[k] == json[key].user_job) {
					jsonToArray.push(
							{ 
								user_job: json[key].user_job,
								survey_title: json[key].survey_title,
								count: json[key].count
							}
					)					
				}
			}
	    	 
	     }
	     
	     console.log(jsonToArray)
	     
	     const groupBy = function (data, key) {
		     return data.reduce(function (carry, el) {
		       var group = el[key];
		
		       if (carry[group] === undefined) {
		         carry[group] = []
		       }
		
		       carry[group].push(el)
		       return carry
		     }, {})
		   }
	     
	     
	     const arr = groupBy(jsonToArray, 'user_job')
	     
	     console.log(arr)
	     
	   	 const array = new Array()
	     
	     for(let i in arr) {
	    	 array.push(arr[i])
	     }
	     
	     console.log(array)
	     
	      const survey = new Array();
		  
	      for(let i = 0; i < job.length; i++) {
	    	  survey.push(array[i].map(e => e.survey_title))
		    	 
		  }
	     
	     console.log(survey)
	     
	     
	     const result = new Array();
	     for(let i = 0; i < job.length; i++) {
	    	 result.push(array[i].map(e => e.count))
	     }
	     
	     console.log(result)
	     
	    const surveyPreferJob = document.querySelector('#surveyPreferJob')
	     
	    for(let i = 0; i < array.length; i++) {
	            const canvas = document.createElement('canvas')
	            canvas.id = 'myChart'+[i]
	            surveyPreferJob.appendChild(canvas)
        }     
     
        for(let i = 0; i < array.length; i++) {
                     
           let context = document.getElementById('myChart' + i)
           const labels = survey[i]
           console.log('labels : ' + labels)
           console.log('labels[i] : ' + labels[i])
      
         const data = {
            labels : survey[i],
            datasets: [
               {
            	  label: '참여 횟수',
                  data: result[i]
               },
            ]
            
         }
         
         const config = {
            type: 'pie',
            data: data,
            options: {
                plugins: {
                    title: {
                        display: true,
                        text: job[i]
                 
                    }
                }
            }
         
         }
         
         const myChart = new Chart(context, config)   
           
        }  
	              
        
        
        const myChartNone = [] 
        for(let i = 0; i < job.length; i++) {
           const mychart = document.querySelector('#myChart'+[i])
           myChartNone.push(mychart)
        }
        
         myChartNone.map(e => e.style.display = 'none')
        console.log(myChartNone)
           
        
        
        function myChartBlockhandler(event) {
   
            myChartNone.map(e => e.style.display = 'none')
              

              const myChartBlock = myChartNone.filter(data => (data.getAttribute('id') == event.target.value) == true)
              console.log(myChartBlock)

              myChartBlock.map(e => e.style.display = 'block')

          }

        choice.onchange = myChartBlockhandler     
	})
	
</script>




</body>
</html>