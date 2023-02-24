<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../manage/manageHeader.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


<h3>설문 결과</h3>

<div id="surveyDetailResult">
	<canvas id="myChart"></canvas>
</div>


<script>

const cpath = '/jiago'
const survey_idx = '${survey_idx}'
const url = cpath + '/manage/getSurveyDetailResult/' + survey_idx

fetch(url)
.then(resp => resp.json())
.then(json => {
	console.log(json)
	
})






</script>


</body>
</html>