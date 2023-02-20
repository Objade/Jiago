<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>


<style>

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

</style>

	
	<div class="main2">
        <div class="donate">
            <div class="donate_title">나무 심기</div>
            <div class="donate_total">
                <div class="left">
                    <div>총 기부금액</div>
                    <div>${sum }원</div>
                </div>
                <div class="right">
                    <div>심은 나무수</div>
                    <div>${tree }그루</div>
                </div>
            </div>
            <hr>
            <div class="give">
                <div class="left">
                    <img src="${cpath }/resources/donate_img/나무 이미지.jpg">
                </div>
                <div class="right">
                    <div class="joinPerson">현재 ${count }명 참여중</div>
                    <div class="currentPoint">
                    	<c:choose>
						<c:when test="${not empty point }">
						<h1>당신의 포인트는 : <span>${point }</span></h1>
						</c:when>
							<c:otherwise>
								<h1>당신의 포인트는 : <span>0</span></h1>
							</c:otherwise>
						</c:choose>
                    </div>
                    <input type="text" placeholder="포인트 입력"><button type="submit">기부하기</button>
                </div>  
            </div>
            <div class="donate_detail"><button type="button">자세히 보기</button></div>  
        </div>
    </div>
    <div class="add"><img src="${cpath }/resources/donate_img/광고.jpg"></div>


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


</body>
</html>