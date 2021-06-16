<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내과</title>
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
                <p>내과</p>
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
			        내과는 의학의 가장 기본이 되는 분야로서 15세 이상의 사람에게서 신체의 생명을 유지하는데 필요한 인체 내부 장기 즉 심장, 폐 및 호흡기, 위장 및 소화기계통, 
			        신장, 류마티스, 감염질환, 항암치료, 중독 등을 진단하고 치료하여 건강한 삶을 유지하고 지속시키는데 도움을 주는 의료분야입니다.
			    <br>
				    점차 고령화사회로 진입하면서 여러 질병을 앓는 환자들이 늘어나고 있습니다. 현대의 세분된 전문진료과 진료만으로는 해결이 어려운 경우가 많아짐에 따라 여러 문제를 가지는 환자를 전인적으로 접근, 
				    치료하기 위하여 통합내과가 만들어졌습니다.
				   국내 최초로 신설된 KH병원 통합내과는 복합질환 환자를 위하여 내과 내 분과는 물론 타 과와 원활한 의사소통을 통해 최고의 의료서비스를 제공합니다. 
				   통합 검사와 처방으로 과잉 및 중복 진료를 예방함으로써 진료의 안전성과 효율성을 함께 높이고자 합니다. 또한 종합적인 전공의 교육을 통해 훌륭한 내과전문의를 양성하고 있습니다.
                </p>
            </div>

            <!-- 의료진 프로필 -->
            <div class="presentList" id="ps02">
                <div class="faq-content">
                	<div class="pbox">
	                    <div class="photo"><img src="${ contextPath }/resources/images/leesoyun.png" id="dpic"></div>
	                    <div class="profile">
	                        <div class="doctor">
	                            <div class="doctorName">박온유 교수</div>
	                            <div class="department">외과</div>
	                            <div class="tag">전문분야</div>
	                            <p class="medical_sub">감염성질환, 원인불명열, 패혈증, 해외여행상담, 건강검진 결과상담</p>
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
                                <td>진료</td>
                                <td></td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="faq-content">
                    <div class="pbox">
	                    <div class="photo"><img src="${ contextPath }/resources/images/parkjun.png" id="dpic"></div>
	                    <div class="profile">
	                        <div class="doctor">
	                            
	                            <div class="doctorName">오경준 교수</div>
	                            <div class="department">내과</div>
	                            <div class="tag">전문분야</div>
	                            <p class="medical_sub">감염성질환, 원인불명열, 패혈증, 건강검진 결과상담</p>
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
                                <td></td>
                                <td>진료</td>
                                <td></td>
                                <td></td>
                                <td>진료</td>
                                <td>진료</td>
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