<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous"> 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
  <title>KH Hospital</title>
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
  </style>
</head>
<body>
	<jsp:include page="common/menubar.jsp"/>
	
	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="${contextPath}/resources/images/banner3.jpg" class="d-block w-100" alt="공지배너1">
          </div>
          <div class="carousel-item">
            <img src="${contextPath}/resources/images/banner3.jpg" class="d-block w-100" alt="공지배너2">
          </div>
          <div class="carousel-item">
            <img src="${contextPath}/resources/images/banner3.jpg" class="d-block w-100" alt="공지배너3">
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
                  <th><img src="${contextPath}/resources/images/qm1.png" onclick=""></th>
                  <th><img src="${contextPath}/resources/images/qm2.png" onclick=""></th>
                  <th><img src="${contextPath}/resources/images/qm3.png" onclick=""></th>
                  <th><img src="${contextPath}/resources/images/qm4.png" onclick=""></th>
                  <th><img src="${contextPath}/resources/images/qm5.png" onclick=""></th>
                </tr>
            </table>
          </div>
        </div>
      </div>
      <div id="mbottomArea">
        <div class="square menu1">
          <p class="qTitle">의료진 안내</p>
          <img src="${contextPath}/resources/images/line2.png" class="line">
          <p class="qContent c1">진료과별 의료진 정보와 진료 일정을</p>
          <p class="qContent c2">확인하실 수 있습니다.</p>
          <img src="${contextPath}/resources/images/nextbar.png" class="next" onclick="">
        </div>
        <div class="square menu2">
          <p class="qTitle">온라인 진료 예약</p>
          <img src="${contextPath}/resources/images/line1.png" class="line">
          <p class="qContent c1">날짜, 진료과, 의사를 직접 선택하여</p>
          <p class="qContent c2">예약하실 수 있습니다.</p>
          <img src="${contextPath}/resources/images/nextbar2.png" class="next" onclick="">
        </div>
        <div class="square menu3">
          <p class="qTitle">예약 내역 확인 및 취소</p>
          <img src="${contextPath}/resources/images/line2.png" class="line">
          <p class="qContent c1">예약했던 내역을</p>
          <p class="qContent c2">확인·취소하실 수 있습니다.</p>
          <img src="${contextPath}/resources/images/nextbar.png" class="next" onclick="">
        </div>
        <div class="square menu4">
          <p class="qTitle">1:1 전문의 상담</p>
          <img src="${contextPath}/resources/images/line1.png" class="line">
          <p class="qContent c1">진료 전 과별 전문의에게</p>
          <p class="qContent c2">상담하실 수 있습니다.</p>
          <img src="${contextPath}/resources/images/nextbar2.png" class="next" onclick="">
        </div>
      </div>
      <div id="boardArea">
        <div class="newsArea">
          <table id="news" width="100%" style="border-collapse:collapse">
              <tr class="line1">
                  <td>뉴스</td>
                  <td class="moreView" align="right">
                  <a href="">
                      <img src="${contextPath}/resources/images/more.png" width="17px" height="15px">
                  </a>
                  </td>
              </tr>
              <tr>
                  <td class="title"><img src="${contextPath}/resources/images/dot.jpg" class="dot"> 당뇨병 환자에게 이런 음식은 치명적…가려드세요</td>
                  <td class="date">2021.05.04</td>
              </tr>
              <tr>
                  <td class="title"><img src="${contextPath}/resources/images/dot.jpg" class="dot"> 테스트 뉴스 1</td>
                  <td class="date">2021.04.23</td>
              </tr>
              <tr>
                  <td class="title"><img src="${contextPath}/resources/images/dot.jpg" class="dot"> 테스트 뉴스 2</td>
                  <td class="date">2021.04.19</td>
              </tr>
              <tr>
                  <td class="title"><img src="${contextPath}/resources/images/dot.jpg" class="dot"> 테스트 뉴스 3</td>
                  <td class="date">2020.04.05</td>
              </tr>
              <tr>
                  <td class="title"><img src="${contextPath}/resources/images/dot.jpg" class="dot"> 테스트 뉴스 4</td>
                  <td class="date">2020.03.30</td>
              </tr>
              <tr>
                  <td class="title"><img src="${contextPath}/resources/images/dot.jpg" class="dot"> 테스트 뉴스 5</td>
                  <td class="date">2020.03.22</td>
              </tr>
              <tr>
                  <td class="title"><img src="${contextPath}/resources/images/dot.jpg" class="dot"> 테스트 뉴스 6</td>
                  <td class="date">2020.03.16</td>
              </tr>
          </table> 
      </div>
        <div class="noticeArea">
          <table id="notice" width="100%" style="border-collapse:collapse">
              <tr class="line1">
                  <td>공지사항</td>
                  <td class="${contextPath}/resources/images/moreView" align="right">
                  <a href="">
                      <img src="${contextPath}/resources/images/more.png" width="17px" height="15px">
                  </a>
                  </td>
              </tr>
              <tr>
                  <td class="title"><img src="${contextPath}/resources/images/dot.jpg" class="dot"> 안전한 코로나 19 예방 접종을 위해 예방접종 후…</td>
                  <td class="date">2021.05.11</td>
              </tr>
              <tr>
                  <td class="title"><img src="${contextPath}/resources/images/dot.jpg" class="dot"> 테스트 공지사항 1</td>
                  <td class="date">2021.05.02</td>
              </tr>
              <tr>
                  <td class="title"><img src="${contextPath}/resources/images/dot.jpg" class="dot"> 테스트 공지사항 2</td>
                  <td class="date">2021.04.28</td>
              </tr>
              <tr>
                  <td class="title"><img src="${contextPath}/resources/images/dot.jpg" class="dot"> 테스트 공지사항 3</td>
                  <td class="date">2020.04.09</td>
              </tr>
              <tr>
                <td class="title"><img src="${contextPath}/resources/images/dot.jpg" class="dot"> 테스트 공지사항 4</td>
                  <td class="date">2020.03.13</td>
              </tr>
              <tr>
                <td class="title"><img src="${contextPath}/resources/images/dot.jpg" class="dot"> 테스트 공지사항 5</td>
                  <td class="date">2020.02.27</td>
              </tr>
              <tr>
                <td class="title"><img src="${contextPath}/resources/images/dot.jpg" class="dot"> 테스트 공지사항 6</td>
                  <td class="date">2020.02.06</td>
              </tr>
          </table> 
      </div>
      </div>

      <jsp:include page="common/footer.jsp"/>
</body>
</html>
