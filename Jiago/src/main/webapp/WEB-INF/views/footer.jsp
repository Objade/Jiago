<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <style>
        #footer {
            background-color: #666;
            color: white;
            padding: 0;
            margin: 0;
        }
        .wrap {
            display: flex;
            justify-content: center;
        }

        .footer_menu > ul {
            display: flex;
            list-style: none;
            padding: 0;
        }

        .footer_menu > ul > li > a {
            color: white;
            text-decoration: none;
        }
        
        .footer_menu > ul > li:nth-child(1) {
           padding-right: 10px;
           
        }

        .footer_menu > ul > li:nth-child(n+2) {
            padding: 0px 10px;
        }
        
        .footer_menu > ul > li:nth-child(2) {
           border-left: 1px solid white;
           border-right: 1px solid white;
        }
        
        .footer_menu > ul > li:nth-child(4) {
           border-left: 1px solid white;
           border-right: 1px solid white;
        }
        
        
                    
        
        .footer_img {
            display: flex;
            margin: 0px 150px;
        }

        .footer_img > div {
            margin: auto;
        }

        .footer_img > div > img {
            margin: 0px 10px;
        }

        .footer_move {
            display: flex;
        }
        
        .footer_move > select, button {
            margin: auto;
        }
    </style>


<div id="footer">
    <div class="wrap">
        <div class="footer_menu">
            <ul>
                <li><a href="#">회사소개</a></li>
                <li><a href="#">오시는 길</a></li>
                <li><a href="#">이용약관</a></li>
                <li><a href="#">개인정보처리방침</a></li>
                <li><a href="#">사이트맵</a></li>
            </ul>
            <span>주소주소주소주소주소주소주소주소주소</span><br>
            <span>대표대표대표대표대표대대표대표대표 | 사업자 번호 1320-30-31023</span><br>
            <span>COPYTIGHT MACROMILL EMBRAIN. ALL RIGHTS RESERVED.</span>
        </div>

        <div class="footer_img">
            <div><img src="${cpath }/resources/img/개인정보보호.gif"></div>
            <div><img src="${cpath }/resources/img/ISO 9001 인증.gif"></div>
        </div>

        <div class="footer_move">
            <select>
                <option>---------------</option>
                <option></option>
                <option></option>
                <option></option>
            </select>
            <button>이동</button>
        </div>

    </div>
</div>





</body>
</html>