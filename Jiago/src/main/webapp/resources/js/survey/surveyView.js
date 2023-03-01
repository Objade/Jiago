function surveyDeleteHandler(event) {   
      const cpath = '/jiago'
      const surveyIdx = '${dto.survey_idx}'
      const surveyName = '${dto.survey_title}'
      const message = "'" + surveyName + "' 을/를 정말로 삭제하시겠습니까?'"
      const flag = confirm(message)
      if(flag) {
         const url = cpath + '/survey/surveyDelete/' + surveyIdx
         fetch(url)
         .then(resp => resp.text())
           .then(text => {
              alert(text)
              location.href = cpath + '/survey/surveyManage'
             })   
      }
   }
   
const surveyDeleteButton = document.getElementById('surveyDelete')