<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료과 센터 찾기</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<style>
 * { box-sizing: border-box; }

        header,
        nav,
        section,
        body,
        footer {
            display: block;
        }

       body {
           margin: auto;
       }

       /* 바디 화면  */
       #outer {
             width: 1000px;
           height: 1100px;
           margin: auto;
       }

       #searchArea {
           height: 10%;
           margin-top: 70px;
       }

       #D_search02 {
           width: 100%;
           height: 18%;
       }
       
       #D_title01{
           font-size: 30px;
           color: rgb(61, 145, 133);
           text-align: center;
       }

       #D_title02{
           height: 30%;
           width: 50%;
           margin: auto;
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
       .mtitle ,
       .ctitle{
           text-align: center;
           padding: 20px;
           font-size: 27px;
           font-weight: bold;
           color: cadetblue;
           display: block;
       }

       /* ------------content--------------- */

       #content {
           width: 85%;
           height: 70%;
           margin: auto;
       }

       ul {
            list-style-type: none;
        }

       .blue_area {
           border: 2px solid rgb(217, 241, 250);
           border-radius: 10px;
           width: 150px;
           height: 150px;
           margin: auto;
           float: left;
           margin-left: 33px;
           margin-top: 30px;
       }

       .blue_wrap {
           padding-left: 35px;
           margin-top: 10px;
       }
       
       .blue_area:hover{
             background-color: rgb(217, 241, 250);
       }

       .green_area {
           border: 2px solid rgb(217, 250, 232);
           border-radius: 10px;
           width: 150px;
           height: 150px;
           margin: auto;
           float: left;
           margin-left: 33px;
           margin-top: 30px;
       }
       
       
       .green_area:hover {
             background-color: rgb(217, 250, 232);
       }

       .green_wrap {
           padding-left: 35px;
           margin-top: 10px;'
       }
       .icon_title {
           text-align: center;
           font-size: 15px;
           margin-top: 5px;
           color: rgb(94, 98, 109);
           /* font-family: "돋움"; */
           font-weight: bold;
       }
        
        
       /* ----------- 디스플레이 --------------- */
       .centerPage {
           display: none;
       }

       .ctitle {
           display: none;
       }
       
       .blank{
           height: 80px;
       }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<section id="outer">
        <section id="searchArea">
            <div id="D_title01">
                <p>진료과 / 센터 찾기</p>
            </div>
        </section>
        <section id="D_search02">
            <div id="D_title02">
                <ul class="top_tap">
                    <li onclick="click1()">진료과</li>
                    <li onclick="click2()">센터</li>
                </ul>
                <hr>
            </div>
            <div>
                <p class="mtitle">진료과 리스트</p>
                <p class="ctitle">센터 리스트</p>
            </div>
            <hr width="700px">
        </section>

        <section id="content">
            <div class="medicalPage" id="medi">
                <div>
                    <ul class="blue_list">
                        <li class="blue">
                            <div class="blue_area">
                                <div class="blue_wrap">
                                <a href="${contextPath}/medical/d1">
                                    <img src="${contextPath}/resources/images/d1.png" id="blue_icon" usemap="#map">
                                </a>  
                                </div>
                                <div class="icon_title">
                                   	외과
                                </div>
                            </div>
                        </li>
                        <li class="blue">
                            <div class="blue_area">
                                <div class="blue_wrap">
                                    <a href="${contextPath}/medical/d2">
                                    <img src="${contextPath}/resources/images/d2.png" id="blue_icon" usemap="#map">
                                </a>  
                                </div>
                                <div class="icon_title">
                                                                                 호흡기내과
                                </div>
                            </div>
                        </li>
                        <li class="blue">
                            <div class="blue_area">
                                <div class="blue_wrap">
                                    <a href="${contextPath}/medical/d3">
                                    <img src="${contextPath}/resources/images/d3.png" id="blue_icon" usemap="#map">
                                </a>  
                                </div>
                                <div class="icon_title">
                                    	순환기내과
                                </div>
                            </div>
                        </li>
                        <li class="blue">
                            <div class="blue_area">
                                <div class="blue_wrap">
                                    <a href="${contextPath}/medical/d4">
                                    <img src="${contextPath}/resources/images/d4.png" id="blue_icon" usemap="#map">
                                </a>  
                                </div>
                                <div class="icon_title">
                                    	내분비내과 
                                </div>
                            </div>
                        </li>
                        <li class="blue">
                            <div class="blue_area">
                                <div class="blue_wrap">
                                    <a href="${contextPath}/medical/d5">
                                    <img src="${contextPath}/resources/images/d5.png" id="blue_icon" usemap="#map">
                                </a>  
                                </div>
                                <div class="icon_title">
                                   	 소화기내과/외과
                                </div>
                            </div>
                        </li>
                        <li class="blue">
                            <div class="blue_area">
                                <div class="blue_wrap">
                                    <a href="${contextPath}/medical/d6">
                                    <img src="${contextPath}/resources/images/d6.png" id="blue_icon" usemap="#map">
                                </a>  
                                </div>
                                <div class="icon_title">
                                    	소아외과
                                </div>
                            </div>
                        </li>
                        <li class="blue">
                            <div class="blue_area">
                                <div class="blue_wrap">
                                    <a href="${contextPath}/medical/d7">
                                    <img src="${contextPath}/resources/images/d7.png" id="blue_icon" usemap="#map">
                                </a>  
                                </div>
                                <div class="icon_title">
                                   	소아청소년과
                                </div>
                            </div>
                        </li>
                        <li class="blue">
                            <div class="blue_area">
                                <div class="blue_wrap">
                                    <a href="${contextPath}/medical/d8">
                                    <img src="${contextPath}/resources/images/d8.png" id="blue_icon" usemap="#map">
                                </a>  
                                </div>
                                <div class="icon_title">
                                  	산부인과
                                </div>
                            </div>
                        </li>
                        <li class="blue">
                            <div class="blue_area">
                                <div class="blue_wrap">
                                    <a href="${contextPath}/medical/d9">
                                    <img src="${contextPath}/resources/images/d9.png" id="blue_icon" usemap="#map">
                                </a>  
                                </div>
                                <div class="icon_title">
                                  	내과
                                </div>
                            </div>
                        </li>
                        <li class="blue">
                            <div class="blue_area">
                                <div class="blue_wrap">
                                    <a href="${contextPath}/medical/d10">
                                    <img src="${contextPath}/resources/images/d10.png" id="blue_icon" usemap="#map">
                                </a>  
                                </div>
                                <div class="icon_title">
                                  	진단검사의학과 
                                </div>
                            </div>
                        </li>
                        <li class="blue">
                            <div class="blue_area">
                                <div class="blue_wrap">
                                    <a href="${contextPath}/medical/d11">
                                    <img src="${contextPath}/resources/images/d11.png" id="blue_icon" usemap="#map">
                                </a>  
                                </div>
                                <div class="icon_title">
                                  	치과
                                </div>
                            </div>
                        </li>
                        <li class="blue">
                            <div class="blue_area">
                                <div class="blue_wrap">
                                    <a href="${contextPath}/medical/d12">
                                    <img src="${contextPath}/resources/images/d12.png" id="blue_icon" usemap="#map">
                                </a>  
                                </div>
                                <div class="icon_title">
                                  	신경과
                                </div>
                            </div>
                        </li>
                        <li class="blue">
                            <div class="blue_area">
                                <div class="blue_wrap">
                                    <a href="${contextPath}/medical/d13">
                                    <img src="${contextPath}/resources/images/d13.png" id="blue_icon" usemap="#map">
                                </a>  
                                </div>
                                <div class="icon_title">
                                 	정신건강의학과
                                </div>
                            </div>
                        </li>
                        <li class="blue">
                            <div class="blue_area">
                                <div class="blue_wrap">
                                    <a href="${contextPath}/medical/d14">
                                    <img src="${contextPath}/resources/images/d14.png" id="blue_icon" usemap="#map">
                                </a>  
                                </div>
                                <div class="icon_title">
                                	비뇨의학과
                                </div>
                            </div>
                        </li>
                        <li class="blue">
                            <div class="blue_area">
                                <div class="blue_wrap">
                                    <a href="${contextPath}/medical/d15">
                                    <img src="${contextPath}/resources/images/d15.png" id="blue_icon" usemap="#map">
                                </a>  
                                </div>
                                <div class="icon_title">
                               	        마취통증의학과
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 센터리스트 -->
            <div class="centerPage" id="cent">
                <div>
                    <ul class="green_list">
                        <li class="green">
                            <div class="green_area">
                                <div class="green_wrap">
                                    <a href="${contextPath}/medical/c31">
                                    <img src="${contextPath}/resources/images/c31.png" id="blue_icon" usemap="#map">
                                </a>  
                                </div>
                                <div class="icon_title">
                              	    유방갑상선암센터
                                </div>
                            </div>
                        </li>
                        <li class="green">
                            <div class="green_area">
                                <div class="green_wrap">
                                    <a href="${contextPath}/medical/c32">
                                    <img src="${contextPath}/resources/images/c32.png" id="blue_icon" usemap="#map">
                                </a>  
                                </div>
                                <div class="icon_title">
                             	     소화기내시경센터
                                </div>
                            </div>
                        </li>
                        <li class="green">
                            <div class="green_area">
                                <div class="green_wrap">
                                    <a href="${contextPath}/medical/c33">
                                    <img src="${contextPath}/resources/images/c33.png" id="blue_icon" usemap="#map">
                                </a>  
                                </div>
                                <div class="icon_title">
                                  	시험관아기센터
                                </div>
                            </div>
                        </li>
                        <li class="green">
                            <div class="green_area">
                                <div class="green_wrap">
                                    <a href="${contextPath}/medical/c34">
                                    <img src="${contextPath}/resources/images/c34.png" id="blue_icon" usemap="#map">
                                </a>  
                                </div>
                                <div class="icon_title">
                               	   로봇수술센터 
                                </div>
                            </div>
                        </li>
                        <li class="green">
                            <div class="green_area">
                                <div class="green_wrap">
                                    <a href="${contextPath}/medical/c35">
                                    <img src="${contextPath}/resources/images/c35.png" id="blue_icon" usemap="#map">
                                </a>  
                                </div>
                                <div class="icon_title">
                               	     난임센터
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            
        </section>
        <script>
        function clear(){
                     $(".medicalPage").css("display","none");
                     $(".centerPage").css("display","none");
                 }

                 function click1(){
                     clear();
                     $("#medi").css("display",'block');
                     $(".ctitle").css("display",'none');
                     $(".mtitle").css("display", 'block');
                 }

                 function click2(){
                     clear();
                     $("#cent").css("display",'block');
                     $(".mtitle").css("display", 'none');
                     $(".ctitle").css("display", 'block');
                 }
       </script>
    </section>
    
   
    
    <div class="blank"></div>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>