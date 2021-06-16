<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마취통증의학과</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<style>
        * {
            box-sizing: border-box;
        }

        header,
        nav,
        section,
        body,
        footer {
            display: block;
        }


        /* 바디 화면  */
        #outer {
            width: 1200px;
            height: 100%; 
            margin: auto;
        }

        #D_search01 {
            height: 10%;
            margin-top: 70px;
        }

        #D_search02 {
            width: 100%;
            height: 18%;
        }

        #D_title01 {
            font-size: 30px;
            color: rgb(61, 145, 133);
            text-align: center;
        }

        #D_title02 {
            height: 30%;
            width: 50%;
            margin: auto;
            margin-top: 70px;
        }

        .top_tap {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .top_tap li {
            border: 1px solid rgb(218, 219, 219);
            display: block;
            text-decoration: none;
            text-align: center;
            font-size: 20px;
            padding: 10px;
            float: left;
            width: 50%;
            cursor: pointer;
        }

        .title {
            text-align: center;
            padding: 20px;
            font-size: 27px;
            font-weight: bold;
            color: rgb(135, 139, 141);
        }
        
        .blank{
        	height: 200px;
        }

        /* ----------- -content --------------- */

        #content {
            width: 85%;
            height: 72%;
            margin: auto;
        }

        /* ----------- 소개 페이지 ----------------- */
        .presentPage {
            width: 70%;
            height: 72%;
            margin: auto;
            margin-top: 80px;
            font-size: 15px;
        }

        #ps01-1{
            line-height: 35px;
        }


        /* ----------------- 의사 개인 프로필 리스트 페이지-----------------*/
        /* 의사 프로필 및 시간표 */

        .faq-content.box{
            margin-top: 20px;
        }
        
        .pbox {
        	margin-top: 15px;
        }

        .profile {
            width: 640px;
            height: 180px;
            margin-left: 290px;
            /* float: left; */
        }

        .doctorName {
            font-size: 20px;
            font-weight: bold;
            padding-top: 12px;
        }

        .department {
            font-size: 17px;
            padding-top: 7px;
            padding-bottom: 15px;
        }

        .photo {
           /*  border: 1px solid skyblue; */
            width: 240px;
            height: 180px;
            float: left;
            margin-left: 50px;
        }
        
        #dpic{
        	margin-left: 50px;
        }

        .tag {
            float: left;
            background-color: skyblue;
            width: 50px;
            height: 50px;
            padding: 6px;
            font-size: 15px;
            font-weight: bold;
            margin-right: 10px;
        }
        
        .medical_sub {
            font-size: 15px;
            margin: 5px;
        }


        /* ----------------------- 시간표 -------------------- */
        tr>th,
        td:first-child {
            background-color: rgb(216, 217, 218);
        }

        tbody {
            background-color: rgb(210, 235, 245);
            text-align: center;
        }

        .profile.table {
            display: none;
        }

        .schedule {
            margin-left: 290px;
        }

        /*-------------------- 스케줄 펼치기 ----------------------*/
        .answer {
            display: none;
            padding-bottom: 30px;
        }

        #faq-title {
            font-size: 25px;
        }

        .faq-content {
            border-bottom: 1px solid #e0e0e0;
        }

        .question {
            border: 1px solid black;
            color: gray;
            font-size: 15px;
            /* padding: 30px 0; */
            cursor: pointer;
            border: none;
            outline: none;
            background: none;
            width: 100%;
            text-align: left;
            margin-left: 520px;
        }

        .question:hover {
            color: #2962ff;
        }

        [id$="-toggle"] {
            margin-right: 5px;
        }
        
        /* ----------------- 디스플레이 보이기 ------------------------ */
        .presentPage{
            display: none;
        }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<section id="outer">
        <section id="D_search01">
            <div id="D_title01">
                <p>마취통증의학과</p>
            </div>
        </section>
        <section id="D_search02">
            <div id="D_title02">
                <ul class="top_tap">
                    <li onclick="click1()">소개</li>
                    <li onclick="click2()">의료진 리스트</li>
                </ul>
                <hr>
            </div>
            
            <div>
                <p class="title">전체 의료진</p>
            </div>
        </section>
        
        <section id="content">
            <!-- 소개 -->
            <div class="presentPage" id="ps01">
                <h2>- 소개</h2>
                <p id="ps01-1">
		        KH병원 마취통증의학과는 친절, 안전, 신뢰의 기치아래 최상의 마취와 통증관리를 환자분들에게 제공하고 있습니다. 극도로 긴장된 환경에서의 환자에게 안도감과 편안함을 드립니다.
				<br>
			        대개 수술실에서 들어오는 환자분은 낯선 수술실에서 들어와 수술, 마취, 통증에 대한 불안감 때문에 극도로 긴장을 하게 되고 두려움을 느끼게 됩니다. 
			        비록 짧은 시간 동안의 만남이지만 환자분에게 편안함을 드리고자 웃는 얼굴, 친절한 말 한마디 때로는 환자분들이 웃으실 수 있는 유머까지, 환자의 불안해소를 위하여 항상 노력하고 있습니다. 
			        이렇게 환자를 안심시키고 수술을 하는 것이 수술 후에 합병증도 적다는 연구결과도 있답니다. 이런 우리의 작은 노력의 결실로 수술에 대한 따뜻한 기억을 가지고 퇴원하시는 것에 보람을 느낍니다.
				<br>

                                   저희 마취통증의학과는 순간순간 보람을 느끼는 일이 참 많습니다.
                                   수술이 무사히 끝나고 환자가 수술실을 나갈 때, 생명이 경각에 다다른 응급환자분이 최선을 다해 응급수술을 무사히 마치고 생명의 불씨를 살렸을 때, 수술 후에 환자가 아프지 않다며 고맙다고 하실 때, 
                                   수술을 마치고 건강히 퇴원하는 환자의 모습을 보며 큰 보람을 느낍니다. 수술 중 환자분은 잠들어 계시는 경우가 대부분이지만 저희는 항상 수술시간 동안 내 가족처럼 환자분 곁을 지키고 있답니다.
                </p>
            </div>

            <!-- 의료진 프로필 -->
            <div class="presentList" id="ps02">
                <div class="faq-content">
                	<div class="pbox">
	                    <div class="photo"><img src="${ contextPath }/resources/images/jungjisoo.png" id="dpic"></div>
	                    <div class="profile">
	                        <div class="doctor">
	                            <div class="doctorName">이현숙 교수</div>
	                            <div class="department">마취통증의학과</div>
	                            <div class="tag">전문분야</div>
	                            <p class="medical_sub">산과마취, 구강외과마취</p>
	                        </div>
	                        <div>
	                            <button class="question" id="que-1"><span>진료일정 </span><span id="que-1-toggle">보기</span></button>
	                        </div>
	                    </div>
                    </div>
                    <!-- 진료일정 스케줄 리스트 -->
                    <div class="answer" id="ans-1">
                        <table class="schedule">
                            <tr>
                                <th width="92px" height="50px">진료일정</th>
                                <th width="90px">월</th>
                                <th width="90px">화</th>
                                <th width="90px">수</th>
                                <th width="90px">목</th>
                                <th width="90px">금</th>
                                <th width="90px">토</th>
                            </tr>
                            <tr>
                                <td height="50px">근무여부 </td>
                                <td>진료</td>
                                <td>진료</td>
                                <td>진료</td>
                                <td></td>
                                <td></td>
                                <td>진료</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="faq-content">
                	<div class="pbox">
	                    <div class="photo"><img src="${ contextPath }/resources/images/leesoyun.png" id="dpic"></div>
	                    <div class="profile">
	                        <div class="doctor">
	                            <div class="doctorName">하상희 교수</div>
	                            <div class="department">마취통증의학과</div>
	                            <div class="tag">전문분야</div>
	                            <p class="medical_sub">마취통증의학</p>
	                        </div>
	                        <div>
	                            <button class="question" id="que-2"><span>진료일정 </span><span id="que-2-toggle">보기</span></button>
	                        </div>
	                    </div>
                    </div>
                    <!-- 진료일정 스케줄 리스트 -->
                    <div class="answer" id="ans-2">
                        <table class="schedule">
                            <tr>
                                <th width="92px" height="50px">진료일정</th>
                                <th width="90px">월</th>
                                <th width="90px">화</th>
                                <th width="90px">수</th>
                                <th width="90px">목</th>
                                <th width="90px">금</th>
                                <th width="90px">토</th>
                            </tr>
                            <tr>
                                <td height="50px">근무여부 </td>
                                <td>진료</td>
                                <td></td>
                                <td>진료</td>
                                <td></td>
                                <td></td>
                                <td>진료</td>
                            </tr>
                        </table>
                    </div>
                </div>
                  <div class="faq-content">
                	<div class="pbox">
	                    <div class="photo"><img src="${ contextPath }/resources/images/kimminji.png" id="dpic"></div>
	                    <div class="profile">
	                        <div class="doctor">
	                            <div class="doctorName">김수연 교수</div>
	                            <div class="department">마취통증의학과</div>
	                            <div class="tag">전문분야</div>
	                            <p class="medical_sub">마취통증의학, 소아마취</p>
	                        </div>
	                        <div>
	                            <button class="question" id="que-3"><span>진료일정 </span><span id="que-3-toggle">보기</span></button>
	                        </div>
	                    </div>
                    </div>
                    <!-- 진료일정 스케줄 리스트 -->
                    <div class="answer" id="ans-3">
                        <table class="schedule">
                            <tr>
                                <th width="92px" height="50px">진료일정</th>
                                <th width="90px">월</th>
                                <th width="90px">화</th>
                                <th width="90px">수</th>
                                <th width="90px">목</th>
                                <th width="90px">금</th>
                                <th width="90px">토</th>
                            </tr>
                            <tr>
                                <td height="50px">근무여부 </td>
                                <td></td>
                                <td>진료</td>
                                <td>진료</td>
                                <td>진료</td>
                                <td></td>
                                <td></td>
                            </tr>
                        </table>
                    </div>
                </div>
                
            </div>

            <script>
                 
                 function clear(){
                     $(".presentPage").css("display","none");
                     $(".presentList").css("display","none");
                 }

                 function click1(){
                     clear();
                     $("#ps01").css("display",'block');
                     $(".title").css("display",'none');
                 }

                 function click2(){
                     clear();
                     $("#ps02").css("display",'block');
                     $(".title").css("display",'block');
                 }


                const items = document.querySelectorAll('.question');

                function openCloseAnswer() {
                    const answerId = this.id.replace('que', 'ans');

                    if (document.getElementById(answerId).style.display === 'block') {
                        document.getElementById(answerId).style.display = 'none';
                        document.getElementById(this.id + '-toggle').textContent = '보기';
                    } else {
                        document.getElementById(answerId).style.display = 'block';
                        document.getElementById(this.id + '-toggle').textContent = '접기';
                    }
                }

                items.forEach(item => item.addEventListener('click', openCloseAnswer));
            </script>
        </section>

    </section>	
    <div class="blank"></div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>