<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진단검사의학과</title>
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
                <p>진단검사의학과</p>
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
			    KH병원 진단검사의학과는 환자로부터 채취한 혈액이나 소변 등의 검체를 이용하여 여러 가지 검사를 시행하여 질병의 진단과 치료 및 예후판정에 중요한 역할을 하고 있습니다. 
			        진단혈액, 임상화학, 임상미생물, 진단면역, 혈액은행, 응급검사, 방사면역검사 등 총 7개 부문으로 나뉘며 분야별 진단검사의학 전문의가 검사결과 검증과 판독, 정도관리, 
			        임상자문 및 연구를 담당하고 있습니다.
			    <br>
				정확한 검사결과 제공을 위해 체계적이고 강도 높은 내부 및 외부 정도관리를 실시합니다. 내부정도관리는 매일 검사별로 정도관리 물질을 사용하고 정해진 원칙에 따라 
				그 결과를 검토한 후 기준에 통과해야 환자검사를 실시합니다. 외부정도관리는 대한임상검사정도관리협회에서 분야(임상화학, 임상미생물, 진단혈액, 면역혈청, 요검사, 혈액은행, 진단면역) 
				별로 연간 3-5회 정도관리물질을 검사하여 그 성적을 인증 받고 있습니다. 또한 대한진단검사의학회가 실시하는 인증심사에서 우수검사실로 인정받았으며 매년 2년 마다 심사를 받고 있습니다.
                </p>
            </div>

            <!-- 의료진 프로필 -->
            <div class="presentList" id="ps02">
                <div class="faq-content">
                	<div class="pbox">
	                    <div class="photo"><img src="${ contextPath }/resources/images/kimjunsoo.png" id="dpic"></div>
	                    <div class="profile">
	                        <div class="doctor">
	                            <div class="doctorName">정윤한 교수</div>
	                            <div class="department">진단검사의학과</div>
	                            <div class="tag">전문분야</div>
	                            <p class="medical_sub">진단검사의학과</p>
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