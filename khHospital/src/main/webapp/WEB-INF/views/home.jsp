<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous"> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<title>KHëíë³ì</title>
<style>
<style>
      body {
        margin: 0;
        padding: 0;
        height: 100%;
      }

      #carouselExampleControls {
        width: 100%;
      }

      .carousel-item img{
        width: 100%;
        height: 495px;
      }

      #middelArea {
        width: 100%;
        height: 100px;
        background: rgb(247,247,247);
        border-bottom: 2px solid rgb(226,226,226);
        position: relative;
      }

      #m_mArea{
        width: 60%;
        max-width: 60%;
        height: 100%;
        float: left;
        margin-left: 22.5%;
      }

      #hNum {
        width: 20%;
        height: 100%;
        max-width: 20%;
        float: left;
      }
      
      #tInfo {    
        padding-left: 10px;
        width: 20%;
        max-width: 20%;
        height: 100%;
        float: left;
      }

      
      #qmArea {
        float: left;
        width: 60%;
        max-width: 60%;
        height: 100%;
      }

      #hNum img {
        width: 180px;
        max-width: 100%;
        height: 90px;
      }

      #tInfo img {
        width: 180px;
        max-width: 100%;
        height: 90px;
        padding-top: 5px;
      }
      
      #qmArea img {
        width: 105px;
        max-width: 95%;
        height: 90px;
        cursor: pointer;
        padding-top: 5px;
        padding-left: 10px;
      }

      #mbottomArea {
        width: 100%;
        height: 330px;
        position: relative;
        float: left;
      }

      .square {
        margin-top: 20px;
        width: 18%;
        height: 100%;
        float: left;
        text-align: center !important;
      }

      .square:first-child {
        margin-left: 14%;
      }

      .menu1 {
        background: #f7f7f7;
      }

      .menu2 {
        background: #73bdee;
      }

      .menu3 {
        background: #e9e9e9;
      }

      .menu4 {
        background: #0f6298;
      }

      .menu1 .qTitle,
      .menu3 .qTitle {
        font-size: 20px;
        font-weight: 600;
        margin-top: 80px;
      }

      .menu2 .qTitle,
      .menu4 .qTitle {
        color: white;
        font-size: 20px;
        font-weight: 600;
        margin-top: 80px;
        margin-bottom: 10px;
      }

      .menu2 .qContent,
      .menu4 .qContent {
        color: white;
      }

      .c1 {
        margin-top: 10px;
      }

      .c2 {
        line-height: 0px;
      }

      .line {
        width: 30px;
      }

      .next{
        margin-top: 40px;
        width: 20px;
        cursor: pointer;
      }

      #boardArea {
        width: 100%;
        height: 380px;
        margin-bottom: 70px;
        position: relative;
        float: left;

      }

      .newsArea {
        width: 30%;
        float: left;
        margin-left: 15%;
        margin-top: 60px;
      }

      .noticeArea {
        width: 30%;
        float: left;
        margin-left: 10%;
        margin-top: 60px;
      }

      .line1 {
        border-bottom: 20px solid white;
      }

      .line1 td {
        font-size: 23px;
        color: #2f79c0;
        font-weight: 600;
      }

      .line1 img {
        width: 22px;
        height: 22px;
        float: right;
      }

      .dot {
        width: 5px;
      }

      .title{
        padding-top: 8px;
        cursor: pointer;
      }
      .date {
        padding-top: 8px;
        text-align : right;
      }
      
      .blank {
        height: 200px;
      }
      
      .line1 img { cursor: pointer; }
</style>
</head>
<body>
	<jsp:include page="common/menubar.jsp"/>
	
	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="${contextPath}/resources/images/banner3.jpg" class="d-block w-100" alt="ê³µì§ë°°ë1">
          </div>
          <div class="carousel-item">
            <img src="${contextPath}/resources/images/banner3.jpg" class="d-block w-100" alt="ê³µì§ë°°ë2">
          </div>
          <div class="carousel-item">
            <img src="${contextPath}/resources/images/banner3.jpg" class="d-block w-100" alt="ê³µì§ë°°ë3">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
      <div id="middelArea">
        <div id="m_mArea">
          <div id="hNum">
              <img src="${contextPath}/resources/images/rnum.png">
          </div>
          <div id="tInfo">
             <img src="${contextPath}/resources/images/ctime.jpg">
          </div>
          <div id="qmArea">
            <table>
                <tr>
                  <th><img src="${contextPath}/resources/images/qm1.png" onclick="location.href='${ contextPath }/infor/floor/'"></th>
                  <th><img src="${contextPath}/resources/images/qm2.png" onclick="location.href='${ contextPath }/infor/document/'"></th>
                  <th><img src="${contextPath}/resources/images/qm3.png" onclick=""></th>
                  <th><img src="${contextPath}/resources/images/qm4.png" onclick=""></th>
                  <th><img src="${contextPath}/resources/images/qm5.png" onclick="location.href='${ contextPath }/infor/location/'"></th>
                </tr>
            </table>
          </div>
        </div>
      </div>
      <div id="mbottomArea">
        <div class="square menu1">
          <p class="qTitle">ìë£ì§ ìë´</p>
          <img src="${contextPath}/resources/images/line2.png" class="line">
          <p class="qContent c1">ì§ë£ê³¼ë³ ìë£ì§ ì ë³´ì ì§ë£ ì¼ì ì</p>
          <p class="qContent c2">íì¸íì¤ ì ììµëë¤.</p>
          <img src="${contextPath}/resources/images/nextbar.png" class="next" onclick="location.href='${ contextPath }/medical/department'">
        </div>
        <div class="square menu2">
          <p class="qTitle">ì¨ë¼ì¸ ì§ë£ ìì½</p>
          <img src="${contextPath}/resources/images/line1.png" class="line">
          <p class="qContent c1">ë ì§, ì§ë£ê³¼, ìì¬ë¥¼ ì§ì  ì ííì¬</p>
          <p class="qContent c2">ìì½íì¤ ì ììµëë¤.</p>
          <img src="${contextPath}/resources/images/nextbar2.png" class="next" onclick="location.href='${ contextPath }/appoint/online'">
        </div>
        <div class="square menu3">
          <p class="qTitle">ìì½ ë´ì­ íì¸ ë° ì·¨ì</p>
          <img src="${contextPath}/resources/images/line2.png" class="line">
          <p class="qContent c1">ìì½íë ë´ì­ì</p>
          <p class="qContent c2">íì¸Â·ì·¨ìíì¤ ì ììµëë¤.</p>
          <img src="${contextPath}/resources/images/nextbar.png" class="next" onclick="location.href='${ contextPath }/appoint/online/list'">
        </div>
        <div class="square menu4">
          <p class="qTitle">1:1 ì ë¬¸ì ìë´</p>
          <img src="${contextPath}/resources/images/line1.png" class="line">
          <p class="qContent c1">ì§ë£ ì  ê³¼ë³ ì ë¬¸ììê²</p>
          <p class="qContent c2">ìë´íì¤ ì ììµëë¤.</p>
          <img src="${contextPath}/resources/images/nextbar2.png" class="next" onclick="location.href='${contextPath}/counsel/select'">
        </div>
      </div>
      <div id="boardArea">
        <div class="newsArea">
          <table id="news" width="100%" style="border-collapse:collapse">
              <tr class="line1">
                  <td>ë´ì¤</td>
                  <td class="moreView" align="right">
           		  <c:if test="${sessionScope.loginUser.grade == 'ê´ë¦¬ì' }">
                      <img src="${contextPath}/resources/images/more.png" onclick="showInsert();" width="17px" height="15px">
                  </c:if>
                  </td>
              </tr>
              <c:if test="${ empty list }">
            	<tr>
                <td class="blank" align="center" colspan="2" rowspan="7">ë±ë¡ë ë´ì¤ê° ììµëë¤.</td>
              	</tr>
           	  </c:if>
           	  <c:if test="${ !empty list }">
           	  <c:forEach items="${list}" var="n">
              <tr onclick="toNewsPage('${n.nlink}')">
                  <td class="title"><img src="${contextPath}/resources/images/dot.jpg" class="dot">&nbsp;${n.ntitle}</td>
                  <td class="date">${n.ncreateDate}</td>
              </tr>
              </c:forEach>
      		  </c:if>
          </table> 
      </div>
      <script>
	      function showInsert(){
	      	var popupWidth = 450;
	      	var popupHeight = 400;
	
	      	var left = (screen.availWidth - popupWidth) / 2;
	      	if( window.screenLeft < 0){
	      	left += window.screen.width*-1;
	      	}
	      	else if ( window.screenLeft > window.screen.width ){
	      	left += window.screen.width;
	      	}
	
	      	var top = (screen.availHeight - popupHeight) / 2 - 10;
	
	      	var options = 'resizable=no,left=' + left + ',top=' + top +', width=' + popupWidth+ ',height=' + popupHeight;
	
	      	window.open("${ contextPath }/main/newsPage","KHëíë³ì", options);
	      }
	      
	      function toNewsPage(link){
	    	  location.href= link;
	      }
      </script>
        <div class="noticeArea">
          <table id="notice" width="100%" style="border-collapse:collapse">
              <tr class="line1">
                  <td>ê³µì§ì¬í­</td>
                  <td class="${contextPath}/resources/images/moreView" align="right">
                  <a href="${ contextPath }/notice/list">
                      <img src="${contextPath}/resources/images/more.png" width="17px" height="15px">
                  </a>
                  </td>
              </tr>
              <c:if test="${ empty nlist }">
            	<tr>
                <td class="blank" align="center" colspan="2" rowspan="7">ë±ë¡ë ê³µì§ì¬í­ì´ ììµëë¤.</td>
              	</tr>
           	  </c:if>
           	  <c:if test="${ !empty nlist }">
           	  <c:forEach items="${nlist}" var="n">
              <tr onclick="toNoticeDetail('${n.nid}')">
                  <td class="title"><img src="${contextPath}/resources/images/dot.jpg" class="dot">&nbsp;${n.ntitle}</td>
                  <td class="date">${n.ncreatedate}</td>
              </tr>
              </c:forEach>
      		  </c:if> 
          </table>
          <script>
          	function toNoticeDetail(nid){
          		location.href="${ contextPath }/notice/detail?nid=" + nid;
          	}
          </script> 
      </div>
      </div>
      
      <jsp:include page="common/footer.jsp"/>
</body>
</html>
