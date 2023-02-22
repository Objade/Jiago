<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<style>
	html {
		scroll-behavior: smooth;
	}
	body {
		/* background-image: url('${cpath}/resources/img/회사소개배경.png');
		background-size: cover; */
		background-color: #dadada;
	}
	#main {
		margin-top: 50px;
	}
	#fBody {
		padding-top: 10px;
	}
	#fRoot {
		width: 1000px;
		margin: 100px auto;
	}
	.intro_title {
		align-content: center;
		text-align: center;
	}
	.bIntro_title {
		font-size: 80px;
		font-weight: bolder;
		color: #1f1f1f;
		height: 100px;
	}
	.sIntro_title {
		font-size: 30px;
		color: #414141;
		
	}
	.intro_tab > ul {
		padding-top: 30px;
		padding-left: 0;
		margin: auto;
		width: 750px;
	}
	.intro_tab > ul > li {
		width: 250px;
		height: 70px;
		border: 1px solid #1B434A;
		background-color: #1B434A;
		border-right: none;
		border-bottom: 3px solid #133036;
	}
	.intro_tab > ul > li:last-child {
		border-right: 1px solid #dadada;
	}
	.intro_span {
		
		display: block;
		width: 250px;
		height: 70px;
		font-size: 35px;
		padding-top: 13px;
		text-align: center;
		color: white;
	}
	.mIntro_title {
		padding-top: 50px;
		align-content: center;
		text-align: center;
		font-size: 50px;
		font-weight: bolder;
		color: #1f1f1f;
	}
	.intro_img {
		margin: auto;
	}
	.intro_img2 {
		padding-top: 30px;
		margin: auto;
	}
	.intro_img3 {
		padding-top: 30px;
		margin: auto;
	}
	.intro_img4{
		padding-top: 30px;
		margin: auto;
	}
	.itro_img4 > img {
		width: 800px;
		padding-top: 30px;
	}
	.intro_main {
		padding-top: 30px;
		width:400px;
		margin: auto;
	}
	
	.intro_main > dl{
		display: flex;
		margin: 0;
		
	}
	.intro_main > dl > dt {
		font-size: 30px;
		
	}
	.intro_main > dl > dd {
		font-size: 20px;
		line-height: 50px;
	}
	
</style>

<div id="main">
	<div id="fBody">
		<div id="fRoot">
			<div class="intro_title">
				<div id="intro_box1">
					<div class="bIntro_title">회사소개</div>
					<div class="sIntro_title">No.1 온라인서치, 지아고를 소개합니다.</div>
					<div class="intro_tab">
						<ul>
							<li>
								<a href="#intro_box1">
									<span class="intro_span">개요</span>
								</a>
							</li>
							<li>
								<a href="#intro_box2">
									<span class="intro_span">연혁</span>
								</a>
							</li>
							<li>
								<a href="#intro_box3">
									<span class="intro_span">경영이념</span>
								</a>
							</li>
						</ul>
					</div>
					<div class="mIntro_title">개요</div>
					<div class="intro_img">
						<img src="${cpath }/resources/img/지아고로비.png">	
					</div>
					<div class="intro_main">
						<dl>
							<dt>설립</dt>
							<dd>1996.01</dd>
						</dl>
						<dl>
							<dt>대표</dt>
							<dd>유지은 (하버드대학교 Harvard University 컴퓨터공학 박사)</dd>
						</dl>
						<dl>
							<dt>매출</dt>
							<dd>1조2000억 (FY22: 2021.07~2022.06)</dd>
						</dl>
						<dl>
							<dt>직원</dt>
							<dd>1250명 (2023년 1월 기준)</dd>
						</dl>
						<dl>
							<dt>본사</dt>
							<dd>부산광역시 해운대구 센텀2로 25 센텀드림월드 11층</dd>
						</dl>
					</div>
					<div class="intro_img2">
						<img src="${cpath }/resources/img/매출액.jpg">	
					</div>
				</div>
				<div id="intro_box2">
					<div class="mIntro_title">연혁</div>
					<div class="intro_img3">
						<img src="${cpath }/resources/img/지아고연혁2.jpg">	
					</div>
				</div>
				<div id="intro_box3">
					<div class="mIntro_title">경영이념</div>
					<div class="itro_img4">
						<img src="${cpath }/resources/img/경영이념.jpg">	
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>