<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        #fiArea { 
            width: 100%;
            position: relative;
            text-align: center;
        }

        .fiTitle {
            font-size: 16px;
            font-weight: 600;
            color: #8d8d8d;
        }

        .f1 {
            margin-top: 70px; 
            margin-bottom: 0;
         }
        
        .f2 {margin-top: 8px;}

        #showId {
            width: 400px;
            height: 80px;
            background: #f5f5f5;
            margin: 0 auto;
            margin-top: 50px;
        }

        #idArea {
            padding-top: 20px;
            font-size: 25px;
            font-weight: 600;
        }

        .btns {
            width: 100%;
            position: relative;
            text-align: center;
            margin-bottom: 200px;
        }

        #goLogin {
            width: 400px;
            height: 60px;
            margin-top: 60px;
            background: #bdbdbd;
            border: none;
            color: white;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
        }
    </style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
    <div id="top">
        <p id="top-t">ìì´ë ì°¾ê¸°</p>
        <p id="top-s">ìì´ëë¥¼ ìì¼ì¨ëì? ê°ì ì ìë ¥íì¨ë ì ë³´ë¥¼ ìë ¥í´ ìì´ëë¥¼ íì¸íì¤ ì ììµëë¤.</p>
    </div>
    <div id="fiArea">
        <p class="fiTitle f1">íìëì ìì´ëë¥¼ íì¸í´ì£¼ì¸ì.</p>
        <p class="fiTitle f2">ê°ì¸ì ë³´ ë³´í¸ë¥¼ ìí´ ìì´ë ì¼ë¶ë *ë¡ íê¸°ë©ëë¤.</p>
        <div id="showId">
            <p id="idArea"><c:if test="${ !empty userId }">${ userId }</c:if></p>
        </div>
    </div>
    <div class="btns">
        <button id="goLogin" onclick="location.href='${contextPath}/member/login'">ë¡ê·¸ì¸íë¬ ê°ê¸°</button>
    </div>
        
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>