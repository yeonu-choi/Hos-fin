<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<title>KHëíë³ì</title>
<style>
    #top {
        margin-top: 80px;
        text-align: center;
    }

    #top-t {
        margin-left: 10%;
        width: 80%;
        color: #00a5db;
        font-size: 43px;
        font-weight: 600;
        margin-bottom: 0;
    }

    #top-s {
        margin-left: 10%;
        width: 80%;
        margin-top: 25px;
        color: #404040;
        font-size: 19px;
        font-weight: 600;
        border-bottom: 2px solid #e3e3e3;
        padding-bottom: 30px;
    }

    #mainArea {
        width: 100%;
        text-align: center;
        margin-bottom: 150px;
        height: 450px;
        position: relative;
        overflow: hidden;
    }

    .main {            
       width: 30%;
       height: 370px;
       border: 1px solid #c0c0c0;
       float: left;
       margin-top: 70px;
       border-top: 3px solid #228ce0;
    }
    
    .join1 { margin-left: 19%; }
    .join2 { margin-left: 2%; }

    .jTitle {
        color: #404040;
        font-size: 28px;
        font-weight: 500;  
        margin-top: 50px; 
        margin-bottom: 10px;
    }

    .sTitle {
        color: #6c6d6f;
        font-size: 18px;
        margin-top: 5px;
    }

    .main img {
        max-width: 80px;
        height: auto;
    }

    .join1 img { margin-top: 35px; }
    .join2 img { margin-top: 25px; }

    .joinBtn {
        width: 110px;
        height: 50px;
        border: 1.5px solid #eaeaea;
        background: #f7f7f7;
        color: #3e3e3e;
        font-size: 14px;
        font-weight: 600;
        border-radius: 8px;
        cursor: pointer;
    }

    .no1 { margin-top: 41px; }
    .no2 { margin-top: 35px; }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>

    <div id="top">
        <p id="top-t">íìê°ì</p>
        <p id="top-s">KHëíë³ìì íìì´ ëìë©´ ì§ë£ ìì½, 
            ì¦ëªì ë°ê¸, ì¬ì  ìë´ ë± ë¤ìí ìë¹ì¤ë¥¼ ë°ì¼ì¤ ì ììµëë¤.</p>
    </div>
    <div id="mainArea">
        <div class="main join1">
            <p class="jTitle adult">ì´ë©ì¼ ì¸ì¦ì¼ë¡ ê°ì</p>
            <p class="sTitle adult">ë§ 14ì¸ ì´ì ë´êµ­ì¸</p>
            <img src="${contextPath}/resources/images/mail.png" width="60px"><br>
            <button class="joinBtn no1" 
            onclick="location.href='${ contextPath }/member/joinPage2?type=mail'">ê°ìíê¸°</button>
        </div>
        <div class="main join2">
            <p class="jTitle child">í´ëí° ì¸ì¦ì¼ë¡ ê°ì</p>
            <p class="sTitle child">ë§ 14ì¸ ì´ì ë´êµ­ì¸</p>
            <img src="${contextPath}/resources/images/phand.png" width="50px"><br>
            <button class="joinBtn no2" 
            onclick="location.href='${ contextPath }/member/joinPage2?type=phone'">ê°ìíê¸°</button>
        </div>
    </div>
        
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>