<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../manage/manageHeader.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


<h3>설문 결과</h3>


<div id="surveyUserDonateRank">
	<canvas id="myChart"></canvas>
</div>




<script>

	const cpath = '/jiago'
	const survey_idx = '${survey_idx}'
	const url = cpath + '/manage/getSurveyPreferQuestion'

	fetch(url)
	.then(resp => resp.json())
	.then(json => {   
	     console.log(json)
	    
	     
		const company_name = []
	     for(let key in json) {
	    	 company_name.push(json[key].company_name)
	     }
	     console.log(company_name)
	     
	     const question_content = []
	     for(let key in json) {
	    	 question_content.push(json[key].question_content)
	     }
	     console.log(question_content)
	     
	     const preference_count = []
	     for(let key in json) {
	    	 preference_count.push(json[key].preference_count)
	     }
	     console.log(preference_count)
	     
	     
	     
	     let context = document.getElementById('myChart')
	     
         
		    const data = {
	        	labels : company_name,
	            datasets: [
	            	{
	                   label: question_content,
	                   data: preference_count
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
	                         text: '회사별 선호 질문'
	                  
	        	         }
	            	}
	            }
	        }
	          
	          const myChart = new Chart(context, config)   
	                
	})
	
</script>



</body>
</html>