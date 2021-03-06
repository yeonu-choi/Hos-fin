<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        #cArea, #sArea {
            width: 100%;
            position: relative;
        }

        #cc { 
            width: 50%;
            margin-left: 25%;
            }
        
        #cc p {
            font-size: 16px;
            color: black;
        }

        .c1 { margin-top: 60px;}

        #sc1, #sc2 {
            width: 60%;
            height: 100px;
            margin-left: 20%;
            background: #f6f7f9;
            border: 2px solid #ededed;
        }

        #sc1 { 
            margin-top: 50px; 
            border-bottom: none;
        }

        #sc2 { border-top: none;}

        #sArea a {
            text-decoration: none;
            color: #4c4d4f;
            font-size: 18px;
            font-weight: 600;
            display: inline-block;
        }

        #sc1 a { margin-top: 46px;}
        #sc2 a { margin-top: 30px;}

        #sArea a:hover { 
            color: #00a4da;
            cursor: pointer;
            }

        .dept1, .dept5 { margin-left: 8%;}
        .dept2, .dept3, .dept4 { margin-left: 18%;}
        .dept6, .dept7 {margin-left: 15%;}
        #sArea { margin-bottom: 200px;}
    </style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
    <div id="top">
        <p id="top-t">1:1 ì ë¬¸ì ìë´</p>
        <p id="top-s">ê¶ê¸íì  ì§í ëë ê±´ê° ê´ë ¨ ë¬¸ìë¥¼ ë¨ê²¨ì£¼ìë©´ 
            ë¶ì¼ë³ ìµê³ ì ì ë¬¸ìê° ì¹ì íê² ëµë³í´ëë¦½ëë¤.</p>
    </div>
    <div id="cArea">
        <div id="cc">
            <p class="caution c1">Â· ìë´ê¸ì ìì±íì¤ ëë ë¡ê·¸ì¸ì´ íìí©ëë¤.</p>
            <p class="caution">Â· ê²ìí ì±ê²©ì ë§ì§ ìë ê¸(ë¹ë°©, ê´ê³ ì±)ì ê´ë¦¬ìì ìí´ ìì ì­ì ë  ì ììµëë¤.</p>
            <p class="caution">Â· ê³ ê°ëì ìë´ ë´ì© ë° ê°ì¸ ì ë³´ ë³´í¸ë¥¼ ìí´ ìë´ê¸ì ë¹ê³µê° ê¸ë¡ë§ ë±ë¡ ê°ë¥ í©ëë¤.</p>
            <p class="caution">Â· ê²ìê¸ ìì  ë° ì­ì ê° ê°ë¥íë ì ë¬¸ìì ëµë³ì´ ë¬ë¦° ì´íìë ìì  ë° ì­ì ê° ë¶ê°í©ëë¤.</p>
            <p class="caution">Â· ìëìì ìë´ì ìíìë ì§ë£ê³¼ë¥¼ ì íí í 
                í´ë¹ ì§ë£ ê³¼ëª©ì ìë§ë ìë´ê¸ì ìì±í´ì£¼ìê¸° ë°ëëë¤.</p>
        </div>
    </div>
    <div id="sArea">
       <div id="sc1">
            <a class="dept1" href="${contextPath}/counsel/list?did=9">Â· ë´ê³¼</a>
            <a class="dept2" href="${contextPath}/counsel/list?did=1">Â· ì¸ê³¼</a>
            <a class="dept3" href="${contextPath}/counsel/list?did=8">Â· ì°ë¶ì¸ê³¼</a>
            <a class="dept4" href="${contextPath}/counsel/list?did=7">Â· ììì²­ìëê³¼</a>
        </div>
        <div id="sc2">
            <a class="dept5" href="${contextPath}/counsel/list?did=13">Â· ì ì ê±´ê°ìíê³¼</a>
            <a class="dept6" href="${contextPath}/counsel/list?did=11">Â· ì¹ê³¼</a>
            <a class="dept7" href="${contextPath}/counsel/list?did=6">Â· ììì¸ê³¼</a>
        </div>
    </div>
        
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>