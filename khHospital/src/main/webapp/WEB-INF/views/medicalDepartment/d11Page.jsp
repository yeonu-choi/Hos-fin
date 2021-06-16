<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>치과</title>
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
                <p>치과</p>
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
			         구강악안면외과 – 구강, 턱, 안면부위의 수술<br><br>
				구강악안면외과는 구강, 턱(악), 얼굴(안면)부위에 발생하는 감염, 외상, 낭종 및 종양 등의 질병을 올바르게 진단하고 외과적 시술을 통해 기능적 회복 및 심미적 복원을 하는 분야입니다. 
				발치, 보철을 위한 수술, 임플란트를 비롯하여 턱뼈 및 얼굴뼈의 골절, 턱관절 질환, 그리고 주걱턱, 무턱, 안면 비대칭 등의 악안면기형을 치료를 위한 악교정수술(양악수술) 
				및 안면윤곽수술 등 턱, 얼굴에 특화된 수술을 진행하고 있습니다.
				<br>
				<br>
				치주과 - 난케이스 임플란트 수술, 전신질환을 가진 환자의 치주치료
				치주과는 임플란트, 스케일링, 치주치료, 잇몸성형술의 치료를 시행합니다. 다양한 임플란트 케이스로 축적된 노하우를 바탕으로 개원가에 해결하기 어려운 난이도 높은
				 임플란트 수술에서도 높은 성공률을 자랑합니다. 잇몸의 염증으로 발생하는 치은염과 치주염의 비수술적치료(스케일링 및 치근활택술) 및 수술적 치료를 시행합니다. 
				 심뇌혈관질환, 신장질환, 간질환 등의 전신적인 문제를 가진 환자들도 각 전문과와의 유기적인 협진을 통해 안전한 치주치료가 가능합니다. 
				 또한, 미백치료 및 전문가 잇솔질과 스케일링을 통하여 예방적 치료에도 힘쓰고 있습니다.
				<br>
				<br>
				치과보존과- 자연치아를 살리는 재근관치료, 지속적 후속치료가 필요한 외상치아의 치료
				치과보존과는 충치치료, 근관치료(신경치료), 심미수복, 치아미백, 치근단수술, 치아외상의 치료를 시행합니다. 치아 신경관이 막혀있거나, 
				이전에 근관치료한 치아에 문제가 발생하였을 경우에도 신경치료가 가능합니다. 외상으로 인하여 치아가 흔들리거나, 손상을 입었을 경우 응급치료를 
				시행하여 부작용을 최소화하고 지속적인 관찰 및 치료를 통하여 최선의 치아 상태로 회복시킵니다. 치아 사이에 공간이 있거나, 
				치아형태 이상으로 비심미적인 문제가 있을 경우 자연치와 유사하게 심미적으로 수복이 가능합니다. 선천적, 후천적인 원인으로 인하여 치아에 변색이 있는 경우 치아손상 없이 
				약재를 이용하여 치아 미백이 가능합니다.
				<br>
				<br>
				치과교정과- 3차원적인 분석 및 정밀한 치료계획, 심미와 기능을 모두 만족시키는 교정치료
				치과교정과는 성인교정치료, 성장기 어린이의 교정치료, 수술 전후 교정치료를 시행합니다. 성인의 경우 가지런한 치아배열을 통해 기능과 심미를 향상시키며 절충치료를 통하여 
				치아와 악골의 크기 부조화를 개선시킬 수 있습니다. 영구치가 묻혀있는 경우(매복치) 정확한 3차원적인 분석을 통하여 발치치료 대신 교정치료로 치아를 올바른 위치로 유도할 수 있습니다. 
				성장기 어린이의 부정교합을 예방하기 위한 교정치료(차단교정)가 가능하며 턱성장의 부조화가 있을 경우에는 턱성장을 바람직한 방향으로 유도해주는 턱교정을 시행합니다. 
				또한 구강악안면외과와의 협진을 통하여 턱교정수술(양악수술)을 위해 필수적인 수술 전, 후 교정을 시행합니다.
				<br>
                </p>
            </div>

            <!-- 의료진 프로필 -->
            <div class="presentList" id="ps02">
                <div class="faq-content">
                	<div class="pbox">
	                    <div class="photo"><img src="${ contextPath }/resources/images/parkjun.png" id="dpic"></div>
	                    <div class="profile">
	                        <div class="doctor">
	                            <div class="doctorName">윤성훈 교수</div>
	                            <div class="department">치과</div>
	                            <div class="tag">전문분야</div>
	                            <p class="medical_sub">구강악안면외과, 양악수술, 주걱턱, 돌출입, 긴얼굴, 안면비대칭, 무턱</p>
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
                                <td></td>
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
	                    <div class="photo"><img src="${ contextPath }/resources/images/kimjunsoo.png" id="dpic"></div>
	                    <div class="profile">
	                        <div class="doctor">
	                            <div class="doctorName">박성진 교수</div>
	                            <div class="department">치과</div>
	                            <div class="tag">전문분야</div>
	                            <p class="medical_sub">악교정수술, 턱관절, 임플란트</p>
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
	                            <div class="doctorName">이진아 교수</div>
	                            <div class="department">치과</div>
	                            <div class="tag">전문분야</div>
	                            <p class="medical_sub">악교정수술, 턱관절, 임플란트병</p>
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
                                <td>진료</td>
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