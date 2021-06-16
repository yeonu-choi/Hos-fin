<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>산부인과</title>
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
                <p>산부인과</p>
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
			     KH병원 산부인과는 1960년 개원 이후로 산과, 부인과와 난임센터 이외에도 고위험 임신, 산전진단, 임신 중 약물상담, 유전상담, 소아청소년 부인과, 
			           최소침습수술(복강경, 로봇수술), 비뇨부인과 및 부인암 등으로 세분화하여 전문적인 진료를 실시하고 있습니다.
				<br>
				  본원에는 세계적인 권위를 자랑하는 난임센터를 중심으로 50년 차병원 역사와 함께 노하우(know-how)를 축적해온 산부인과와의 긴밀한 연계성을 강화한 진료를 시행하고 있습니다. 
				  산부인과 진료 중에 난임상담 및 진료가 필요하거나 난임센터에서 임신이 성공하여 산전관리가 필요한 경우에 이러한 연계성을 바탕으로 같은 기관 내에서 연속성 있는 진료 체계를 수립하였습니다.
				<br>
				본원은 ‘산모 중심 병원’으로 원내 자체 검사가 가능한 전문화된 산전유전진단 클리닉을 구축하고 있으며 고위험 산모들의 임신관리를 위한 별도의 고위험산모 집중관리실을 운영하고 있습니다. 
				또한, 조기 분만과 응급상황을 대비하여 365일 24시간 산부인과와 마취과 전문의를 확보하고 있으며 첨단 장비를 갖춘 신생아 집중치료실을 운용할 수 있는 소아과 의료진이 상주하고 있습니다.
                </p>
            </div>

            <!-- 의료진 프로필 -->
            <div class="presentList" id="ps02">
                <div class="faq-content">
                	<div class="pbox">
	                    <div class="photo"><img src="${ contextPath }/resources/images/jungjisoo.png" id="dpic"></div>
	                    <div class="profile">
	                        <div class="doctor">
	                            <div class="doctorName">정지수 교수</div>
	                            <div class="department">산부인과</div>
	                            <div class="tag">전문분야</div>
	                            <p class="medical_sub">산과, 부인과, 임신중산전관리 및 검사, 성교불쾌증, 성교통, 불감증, 질경련증, 일반부인과질환</p>
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
                                <td></td>
                                <td>진료</td>
                                <td>진료</td>
                                <td></td>
                                <td>진료</td>
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
	                            
	                            <div class="doctorName">임혜진 교수</div>
	                            <div class="department">산부인과</div>
	                            <div class="tag">전문분야</div>
	                            <p class="medical_sub">임신전 상담, 고위험 임신, 태아정밀진단, 태아치료, 쌍둥이임신, 자연주의 출산</p>
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
                                <td>진료</td>
                                <td></td>
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
	                            
	                            <div class="doctorName">지수빈 교수</div>
	                            <div class="department">산부인과</div>
	                            <div class="tag">전문분야</div>
	                            <p class="medical_sub">부인종양학, 부인암, 비정상자궁경부세포진, 자궁경부암, 자궁근종, 자궁내막암, 
	                            <br>자궁내시경수술, 자궁선근증, 난소암, 난소종양, 복강경수술, 골반내시경수술</p>
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