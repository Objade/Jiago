<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<style>
     .main2 {
            margin: 150px auto 0 auto;
            display: flex;
            justify-content: center;
            width: 1700px;
            
        }

        .donate {
            background-color: #1B434A;
            color: white;
            width: 60%;
        }

        .donate_title {
            font-size: 50px;
            margin-left: 20px;
        }

        .donate_total {
            display: flex;
            justify-content: space-around;
        }

        .give {
            display: flex;
            justify-content: space-around;
        }

        .give > .right > div {
            margin: 10px 0px;
        }

        .donate_detail {
            text-align: center;
        }

        .currentPoint {
            background-color: white;
            color: black;
        }

        button[type="submit"] {
            background-color: #44A666;
            color: white;            
            height: 50px;
            width: 100px;
            border: 0px;
        }
        
        button[type="submit"]:active {
            background-color: #29633D;
            color: white;            
            height: 50px;
            width: 100px;
             border: 0px;
        }

        .donate_detail {
            color: white;
            width: 50%;
            margin: auto;
        }
        
        button[type="button"] {
            background-color: #44A666;
            color: white;            
            height: 30px;
            width: 250px;
            border: 0px;
            margin-bottom: 10px;
        }
        
        button[type="button"]:active {
            background-color: #29633D;
            color: white;            
            height: 30px;
            width: 250px;
             border: 0px;
             
        }
        

        .joinPerson {
            text-align: right;
            font-size: 50px;
        }
        
        .add {
            margin: 10px auto;
            display: flex;
            justify-content: center;
            width: 1700px;    
        }
        
        .add > img {
           width: 1020px;
        }
        

        .donate_bottom {
            border: 1px solid black;
        }

        .donate_bottom_title {
            font-size: 50px;
        }

        .donate_bottom_items {
            display: flex;
            width: 70%;
        }

        .donate_bottom_items > div {
            margin: 5px 10px;
        }

        .donate_bottom_items > div > img {
            width: 200px;
            height: 100px;
            
        }


   .modal {
        display: flex;
        justify-content: center;
        align-items: center;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
      }
   
      .modal__background {
        background-color: rgba(0, 0, 0, 0.6);
        width: 100%;
        height: 100%;
        position: absolute;
      }
   
      .modal__content {
        text-align: center;
        position: relative;
        background-color: white;
        border-radius: 10px;
        top: 0;
        padding: 10px 25px;
        width: 20%;
      }
      
      .donate_subtitle {
         font-size: 50px;
      }
      
      .donate_value {
         font-size: 100px;
         margin-top: -40px;
      }
      
      hr {
         margin-top: -20px;
      }
      
      .currentPoint_User {
         width: 400px;
      }
      
      .donate_input {
         width: 300px;
         height: 46px;
         margin-right: 10px;
      }
      
      .give > .left > img {
         margin-left: 30px;
      }
      
      .modal_content {
         width: 800px;
         height: 300px;
         background-color: white;
      }

</style>

   
   <div class="main2">
        <div class="donate">
            <div class="donate_title">나무 심기</div>
            <div class="donate_total">
                <div class="left">
                    <div class="donate_subtitle">총 기부금액</div>
                    <div class="donate_value">${sum }원</div>
                </div>
                <div class="right">
                    <div class="donate_subtitle">심은 나무수</div>
                    <div class="donate_value">${tree }그루</div>
                </div>
            </div>
            <hr>
            <div class="give">
                <div class="left">
                    <img src="${cpath }/resources/img/나무 이미지.png" width="300px">
                </div>
                <div class="right">
                    <div class="joinPerson">현재 ${count }명 참여중</div>
                    <div class="currentPoint">
                       <c:choose>
                  <c:when test="${not empty point }">
                     <h1 class="currentPoint_User">당신의 포인트는 : <span>${point }</span></h1>
                  </c:when>
                     <c:otherwise>
                        <h1 class="currentPoint_User">당신의 포인트는 : <span>0</span></h1>
                     </c:otherwise>
                  </c:choose>
                    </div>
                    <form method="POST" action="${cpath }/donate/donateList">
                       <input type="number" class="donate_input" id="point" name="total_donate" placeholder="포인트 입력" min="0" max="${point }" step="100"><button type="submit">기부하기</button>
                    </form>
                </div>  
            </div>
            <div class="donate_detail"><button type="button">자세히 보기</button></div>
        </div>
    </div>
    <div class="add"><img src="${cpath }/resources/img/광고.png"></div>


<style>
   .modal.hidden {
      display: none;
   }
</style>

    <div class="modal hidden">
        <div class="modal_background"></div>
        <div class="modal_content">
            <h1>모달테스트</h1>
            <button name="close">close</button>
        </div>

    </div>

<%@ include file="../footer.jsp" %>

<script>
      const openButton = document.querySelector('button[type="button"]');
        console.log(openButton)

      const modal = document.querySelector(".modal");
        console.log(modal)

      const closeButton = modal.querySelector("button");
        console.log(closeButton)
      const modalBackground = modal.querySelector(".modal_background");
        console.log(modalBackground)
      
      function displayModal(){
          modal.classList.toggle("hidden");
      }
      
      openButton.addEventListener("click", displayModal);
      closeButton.addEventListener("click", displayModal)
      modalBackground.addEventListener("click", displayModal);

</script>


<script>
    const form = document.querySelector('form')

    function formHandler() {
        const point = document.getElementById("point").value;
        alert(point +'포인트 기부 감사합니다')
    }

    form.onsubmit = formHandler

</script>

</body>
</html>