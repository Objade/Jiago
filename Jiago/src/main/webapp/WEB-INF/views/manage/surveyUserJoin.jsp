<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../manage/manageHeader.jsp" %>

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
	    
	   const array = new Array();
	     
	   array.push(json)
		console.log(array)
		
		console.log(array.map(e => e[0].user_idx))
	   
		
		const userName = new Array();
	    for(let i = 0; i < 3; i++){
		    userName.push(array.map(e => e[i].user_name))		   
	    }
	   
	    console.log(userName)
	    
	    const persent = new Array();
	    for(let i = 0; i < 3; i++){
		    persent.push(array.map(e => e[i].survey_participation_rate))		   
	    }
	    
	    console.log(persent)
	    
	               let context = document.getElementById('myChart')
            
            const labels = userName
       
          const data = {
             labels : labels,
             datasets: [
                {
                   label: labels,
                   data: persent
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