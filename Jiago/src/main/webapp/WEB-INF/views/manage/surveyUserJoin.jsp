<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../manage/manageHeader.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


<h3>설문 결과</h3>


<div id="surveyUserJoin">
	<canvas id="myChart"></canvas>
</div>

<script>

	const cpath = '/jiago'
	const survey_idx = '${survey_idx}'
	const url = cpath + '/manage/getSurveyUserJoin'

	fetch(url)
	.then(resp => resp.json())
	.then(json => {   
	     console.log(json)
	    
	  	    
	    const labels = []
	    for(let key in json) {
	    	labels.push(json[key].user_name)
	    }
	    console.log(labels)
	    
	    const resultPersent = []
	    for(let key in json) {
	    	resultPersent.push(json[key].survey_participation_rate)
	    }
	    console.log(resultPersent)
	    
	    
	    let context = document.getElementById('myChart')
                 
	    const data = {
        	labels : labels,
            datasets: [
            	{
                   label: '설문횟수',
                   data: resultPersent
                },
            ]     
        }
          
        const config = {
           type: 'bar',
           data: data,
             options: {
                 plugins: {
                     title: {
                         display: true,
                         text: '답변을 가장 많이 한 사람'
                  
        	         }
            	}
            }
        }
          
        const myChart = new Chart(context, config)   
           
})
	          

</script>


</body>
</html>