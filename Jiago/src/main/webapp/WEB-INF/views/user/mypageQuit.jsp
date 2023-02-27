<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mypage.jsp" %>

<style>
   #pwCheck {
      width: 500px;
      margin: 200px auto;
   }
   
   #pwCheck > form > div {
      text-align: center;
   }
   
   #pwCheck > form > div > input {
      width: 400px;
      font-size: 30px;
      font-family: 'Dongle';
      box-sizing: border-box;
   }
   
   #pwCheck > form > div > input[type="password"] {
      border: solid 3px rgba(3, 199, 90, .3);
      padding: 5px 10px;
      border-radius: 15px;
      margin-bottom: 20px;
   }
   
   #pwCheck > form > div > input[type="password"]:focus {
      outline: 3px solid lightgreen;
   }
   
   #pwCheck > form > div > input[type="submit"] {
      border: none;
      background-color: #03C75A;
      color: #ffffff;
      cursor: pointer;
      border-radius: 15px;
   }
   
   #pwCheck > form > div > input[type="submit"]:hover {
   
   }
   
   
</style>


   <div id="pwCheck">
      <form method="POST">
         <div><input type="password" name="input_pw" placeholder="비밀번호를 입력하세요" required autocomplete="off"></div>
         <div><input type="submit" value="입력"></div>
      </form>
   </div>
</div>


</body>
</html>