<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
 -->   
   <style>
        body {
            margin: 0;
            padding: 0;
            height: 100%;
        }

        #topbar {
            height: 30px;
            border: 1px solid white;
            background: white;
            position: relative;
        }

        #topmenu {
            list-style-type: none;
            position: absolute;
            right: 150px;
            margin: 3px 0;
        }

        #topmenu li {
            float: right; 
        }

        #topmenu li a {
            text-decoration: none;
            color: #989898;
            font-size: 13px;
            font-weight: 700;
        }

        #topmenu .tm1 {
            width: 25px;
            height: 25px;
        }

        #topmenu .tm2,
        #topmenu .tm3 {
            height: 25px;
        }

        #topLogo {
            height: 110px;
            width: 100%;
            text-align: center;
            margin-top: 10px;
        }

        #logoArea img {
            width: 300px;
        }

        #mainMenu {
            height: 60px;
            width: 100%;
            text-align: center;
            border-bottom: 2px solid #f3f3f3;
            position: relative;
        }

        #MenuArea {
            position: absolute;
            width: 70%;
            height: 100%;
            left: 15%;
        }

        .mainMenu {
            list-style-type: none;
            overflow: hidden;
            margin-top: 0;
            margin-bottom: 0;
            padding-top: 15px;
            border-top: 2px solid #f3f3f3;
        }
        
        a ,
        a:hover{
        	text-decoration: none;
        	color: black;
        }

        .mainMenu > li {
            margin-right: 60px;    
            padding-bottom: 10.5px;
            display: inline-block;
            color: black;
            font-size: 20px;
            font-weight: 600;    
        }

        .mainMenu > li:hover {
           border-bottom: 3px solid #03a3dd;
           cursor: pointer;
        }
        
        .arrow {
            width: 10px;
        }

        #subOuter{
            width: 100%;
            height: 200px;
            box-shadow: 4px 5px 10px #d3d3d3;
            position: relative;
            display: none;
        }
       
        #subMenu {
            position: absolute;
            width: 100%;
            height: 100%;
            left: 35%;
        }

        #subMenu ul {
            list-style-type: none;
            overflow: hidden;
        }

        #subMenu li a{
            text-decoration: none;
            font-size: 14px;
            font-weight: 550;
            color: #979797;
        }

        #subMenu li {
            padding-top: 10px;
        }

        #subArea01, 
        #subArea02, 
        #subArea03, 
        #subArea04 { 
            height: 100%;
            width: 200px;
            border-left: 1px solid #c5c5c5;
            border-right: 1px solid #c5c5c5;
        }

        #subArea01 {
            position: absolute;
            display: none;
            left: 2%;
        }

        #subArea01 li {
            padding-left: 5px;
        }

        #subArea02 {
           position: absolute;
           left: 10.5%;
           display: none;
        }

        #subArea02 li {
            padding-left: 5px;
        }

        #subArea03 {
           position: absolute;
           left: 19.5%;
           display: none;
        }

        #subArea03 li {
            padding-left: 5px;
        }

        #subArea04 {
           position: absolute;
           left: 27%;
           display: none;
        }

        #subArea04 li {
            padding-left: 5px;
        }

        #sub-subArea1, 
        #sub-subArea2, 
        #sub-subArea3, 
        #sub-subArea4 {
            width: 200px;
            height: 100%;
            border-right: 1px solid #c5c5c5;
        }  


        #sub-subArea1 {
            position: absolute;
            left: 13.5%;
            display: none;
        }

        #sub-subArea2 {
            position: absolute;
            left: 13.5%;
            display: none;
        }

        #sub-subArea3 {
            position: absolute;
            left: 22%;
            display: none;
        }

        #sub-subArea4 {
            position: absolute;
            left: 22%;
            display: none;
        }

        .sub01 > li:hover > a,
        .sub02 > li:hover > a,
        .sub03 > li:hover > a,
        .sub04 > li:hover > a {
            color : #03a3dd !important;
        }

        .sub-sub1> li:hover > a,
        .sub-sub2> li:hover > a,
        .sub-sub3> li:hover > a,
        .sub-sub4> li:hover > a {
            color : #03a3dd !important;
        }
        
        #topmenu span {
        	color: #989898;
            font-size: 13px;
            font-weight: 700;
        }

    </style>
    <script>
        function ShowSub(subNum, e){
           $("#subOuter").slideDown(300);
           for (var i = 1; i <5; i++) {
                if(subNum != i){
                    $("#subArea"+ "0" + i).hide(0);
                }
                $("#sub-subArea" + i).hide(0);
           }
           $("#subOuter ul").hide(0);
           $("#subArea"+ "0" + subNum).show(0);
           $(".sub"+ "0" + subNum).show(0);	
       }

       function HideSub(){
           $("#subOuter").slideUp(300);
       }

       function ShowSsub(subNum, e){
        for (var i = 1; i <5; i++) {
                if(subNum != i){
                    $("#sub-subArea" + i).hide(0);
                    $(".sub-sub" + i + " ul").hide(0);
                }
           }
           $("#sub-subArea"+ subNum).show(0);
           $(".sub-sub"+ subNum).show(0);	
       }

       function HideSsub(){
            $("#sub-subArea3").hide(0);
            $("#sub-subArea4").hide(0);
       }
   </script>
</head>
<body>

	<c:if test="${ !empty msg }">
		<script>alert('${msg}');</script>
		<c:remove var="msg"/>
	</c:if>
	
	<div id="topbar">
        <div class="loginArea">
        		<c:if test="${ empty sessionScope.loginUser }">
                <ul id="topmenu">
                    <li><a href="${ contextPath }/member/login"><img src="${contextPath}/resources/images/login.png" class="tm1"><img src="${contextPath}/resources/images/login2.jpg" class="tm2"></a></li>
                    <li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
                    <li><a href="${ contextPath }/member/joinPage1"><img src="${contextPath}/resources/images/join.jpg" class="tm1"><img src="${contextPath}/resources/images/join2.png" class="tm3"></a></li>
                </ul>
                </c:if>
                <c:if test="${ !empty sessionScope.loginUser }">
                <ul id="topmenu">
                	<li><a href="${ contextPath }/member/logout">로그아웃</a></li>
                    <li><span id="bd">&nbsp;&nbsp;|&nbsp;&nbsp;</span></li>
                    <li><span>${loginUser.userName}님 환영합니다</span></li>
                </ul>
                </c:if>
        </div>
    </div>
    <div id="topLogo" onmouseover="HideSub();">
        <div id="logoArea"> 
            <a href="${ contextPath }/"><img src="${contextPath}/resources/images/logo2.jpg"></a>
        </div>
    </div>
    <div id="mainMenu">
        <div id="MenuArea">
            <ul class="mainMenu">
                <li class="main1" onmouseover="HideSub();"><a href="${contextPath}/medical/department">진료과/의료진</a></li>
                <li class="main2" onmouseover="ShowSub('1', this);">병원이용안내</li>
                <li class="main3" onmouseover="ShowSub('2', this);">예약/상담</li>  
                <li class="main4" onmouseover="ShowSub('3', this);">커뮤니티</li>
                <li class="main5" onmouseover="ShowSub('4', this);">마이페이지</li>  
            </ul>
        </div>
    </div>
    <div id="subOuter" onmouseleave="javascript:HideSub();">
        <div id="subMenu">
            <div id="subArea01">
                <ul class="sub01">
                    <li id="sSub1" onmouseover="ShowSsub('1', this);"><a href="">병원 안내&nbsp;&nbsp;&nbsp;<img src="${contextPath}/resources/images/arrow.png" class="arrow"></a></li>
                    <li id="sSub2" onmouseover="ShowSsub('2', this);"><a href="">장례식장&nbsp;&nbsp;&nbsp;&nbsp;<img src="${contextPath}/resources/images/arrow.png" class="arrow"></a></li>
                </ul>
            </div>
            <div id="sub-subArea1">
                <ul class="sub-sub1">
                    <li><a href="${ contextPath }/infor/location/">오시는길/주차안내</a>&nbsp;&nbsp;&nbsp;</li>
                    <li><a href="${ contextPath }/infor/floor/">시설 안내</a>&nbsp;&nbsp;&nbsp;</li>
                    <li><a href="${ contextPath }/infor/diagnosis/">진료 안내</a>&nbsp;&nbsp;&nbsp;</li>
                    <li><a href="${ contextPath }/infor/document/">서류 발급</a>&nbsp;&nbsp;&nbsp;</li>
                    <li><a href="${ contextPath }/info/pharmacy">약국 안내</a>&nbsp;&nbsp;&nbsp;</li>
                </ul>
            </div>
            <div id="sub-subArea2">
                <ul class="sub-sub2">
                    <li><a href="">시설 안내</a>&nbsp;&nbsp;&nbsp;</li>
                    <li><a href="">빈소 안내</a>&nbsp;&nbsp;&nbsp;</li>
                    <li><a href="">방문 안내</a>&nbsp;&nbsp;&nbsp;</li>
                    <li><a href="">장례절차/예약하기</a>&nbsp;&nbsp;&nbsp;</li>
                </ul>
            </div>
            <div id="subArea02">
                <ul class="sub02">
                    <li id="sSub3" onmouseover="ShowSsub('3', this);"><a href="">예약&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="${contextPath}/resources/images/arrow.png" class="arrow"></a></li>
                    <li id="sSub4" onmouseover="ShowSsub('4', this);"><a href="">예약 조회&nbsp;&nbsp;&nbsp;<img src="${contextPath}/resources/images/arrow.png" class="arrow"></a></li>
                    <li id="coun" onmouseover="HideSsub();"><a href="${contextPath}/counsel/select">1:1 전문의 상담</a>&nbsp;&nbsp;&nbsp;</li>
                </ul>
            </div>
            <div id="sub-subArea3">
                <ul class="sub-sub3">
                    <li><a href="${ contextPath }/appoint/info">예약 안내</a>&nbsp;&nbsp;&nbsp;</li>
                    <li><a href="${ contextPath }/appoint/quick">빠른 예약</a>&nbsp;&nbsp;&nbsp;</li>
                    <li><a href="${ contextPath }/appoint/online">온라인 예약</a>&nbsp;&nbsp;&nbsp;</li>
                </ul>
            </div>
            <div id="sub-subArea4">
                <ul class="sub-sub4">
                    <li><a href="${ contextPath }/appoint/quick/search">빠른 예약 조회</a>&nbsp;&nbsp;&nbsp;</li>
                    <li><a href="${ contextPath }/appoint/online/list">온라인 예약 조회</a>&nbsp;&nbsp;&nbsp;</li>
                </ul>
            </div>
            <div id="subArea03">
                <ul class="sub03">
                    <li><a href="${ contextPath }/notice/list">공지사항</a>&nbsp;&nbsp;&nbsp;</li>
                    <li><a href="${ contextPath }/faq/list">FAQ</a>&nbsp;&nbsp;&nbsp;</li>
                    <li><a href="${ contextPath }/compliment/list">칭찬게시판</a>&nbsp;&nbsp;&nbsp;</li>
                    <li><a href="${ contextPath }/culture/culturelist/">문화센터</a>&nbsp;&nbsp;&nbsp;</li>
                    <li><a href="${ contextPath }/complain/list">불편사항</a>&nbsp;&nbsp;&nbsp;</li>
                </ul>
            </div>     
            <div id="subArea04">
                <ul class="sub04">
                    <li><a href="${ contextPath }/mypage/modify">회원 정보 수정</a>&nbsp;&nbsp;&nbsp;</li>
                    <li><a href="${ contextPath }/mypage/reservation">진료 예약 현황</a>&nbsp;&nbsp;&nbsp;</li>
                    <li><a href="${ contextPath }/mypage/counsel">1:1 전문의 상담</a>&nbsp;&nbsp;&nbsp;</li>
                </ul>
            </div>
        </div>
    </div>
    <script>
        $("#subArea01, #sub-subArea1, #sub-subArea2").mouseover(function(){
            $(".mainMenu li:eq(1)").css({"border-bottom" : "3px solid #03a3dd"});
        }).mouseout(function(){
            $(".mainMenu li:eq(1)").css({"border-bottom" : "none"});
        });
        $("#subArea02, #sub-subArea3, #sub-subArea4").mouseover(function(){
            $(".mainMenu li:eq(2)").css({"border-bottom" : "3px solid #03a3dd"});
        }).mouseout(function(){
            $(".mainMenu li:eq(2)").css({"border-bottom" : "none"});
        });
        $("#subArea03").mouseover(function(){
            $(".mainMenu li:eq(3)").css({"border-bottom" : "3px solid #03a3dd"});
        }).mouseout(function(){
            $(".mainMenu li:eq(3)").css({"border-bottom" : "none"});
        });
        $("#subArea04").mouseover(function(){
            $(".mainMenu li:eq(4)").css({"border-bottom" : "3px solid #03a3dd"});
        }).mouseout(function(){
            $(".mainMenu li:eq(4)").css({"border-bottom" : "none"});
        });
        $("#sub-subArea1").mouseover(function(){
            $("#sSub1 a").css({"color" : "#03a3dd"});
        }).mouseout(function(){
            $("#sSub1 a").css({"color" : "#979797"});
        });
        $("#sub-subArea2").mouseover(function(){
            $("#sSub2 a").css({"color" : "#03a3dd"});
        }).mouseout(function(){
            $("#sSub2 a").css({"color" : "#979797"});
        });      
        $("#sub-subArea3").mouseover(function(){
            $("#sSub3 a").css({"color" : "#03a3dd"});
        }).mouseout(function(){
            $("#sSub3 a").css({"color" : "#979797"});
        });     
        $("#sub-subArea4").mouseover(function(){
            $("#sSub4 a").css({"color" : "#03a3dd"});
        }).mouseout(function(){
            $("#sSub4 a").css({"color" : "#979797"});
        });
    </script>
</body>
</html>