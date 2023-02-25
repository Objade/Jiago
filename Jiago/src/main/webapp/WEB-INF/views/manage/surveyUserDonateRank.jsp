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
	const url = cpath + '/manage/getSurveyUserDonateRank'

	fetch(url)
	.then(resp => resp.json())
	.then(json => {   
	     console.log(json)
	    
		const userName = []
	     for(let key in json) {
	    	 userName.push(json[key].user_name)
	     }
	     console.log(userName)
	     
	     const total_donate = []
	     for(let key in json) {
	   		total_donate.push(json[key].total_donate)
	     }
	     
	     console.log(total_donate)
	     
	     let context = document.getElementById('myChart')
	     
         
		    const data = {
	        	labels : userName,
	            datasets: [
	            	{
	                   label: '기부금액',
	                   data: total_donate
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
	                         text: '유저별 기부 순위'
	                  
	        	         }
	            	}
	            }
	        }
	          
	          const myChart = new Chart(context, config)   
	                
	     
	})
	
</script>



</body>
</html>