<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Reservation</title>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <style>
        .outer {
			width: 90%;
			height: auto;
			margin: auto;
			position:relative;
			min-height : 600px; 
   		}

		h1 {
	    	text-align : center;
	        color : #00a5db;
	        margin-top : 60px;
   	 	}

        h2 {
        	padding-bottom: 10px;
	    }
	
	    h3 {
	        padding : 5px;
	    }

        .menu {
	        background-color: rgb(57, 133, 247);
	        text-align: center;
	        color : white;
	        width : 200px;
	        height: 25px;
	        font-weight: bold;
        }  
        
        .n1 {
        	width : 550px;
        }

		#p1 {
			font-size : 18px;
		}

        #p2 {
            font-size: 16px;
        } 

        .pro {
			display: flex;
            flex-direction: row;
        }

        #profile {
           /*  align-self: center; */
            margin-right: 20px;
            margin-top : 20px;
        }


        #list {
            width : 400px;
            height: auto;
            margin-top: 20px;
            border : 1px solid gray;
        }

        #book{
            background-color: rgb(57, 133, 247);
            width : 100px;
            height : 40px;
            border-radius: 3px;
            color : white;
            border : none;
            margin-top: 20px;
            font-size : 20px;
        }

    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
    <div class="outer" align="center">

<%--         <div class="menuArea">
            <table id="menu">
                <tr>
	             <td class="menu mp" onclick="location.href='${ contextPath }/mypage/modify'">개인 정보 수정</td>
	             <td class="menu re" onclick="location.href='${ contextPath }/mypage/reservation'">예약 내역 확인</td>
	             <td class="menu coun" onclick="location.href='${ contextPath }/mypage/counsel'">1:1 전문의 상담</td>
	         </tr>
            </table>
        </div> --%>

        <h1 align="center">진료 예약 현황</h1>
        <div class="n1">
	        <div class="pro">
	        <img src="../resources/images/profile.png" width="70px" height="70px" id="profile">
		        <div id="notice">
		            <p id="p1">${ loginUser.userName } 님의 예약내역이 []건 있습니다.</p>
		            <hr width="400px">
		            <p id="p2" align="left">진료 예약 현황을 조회할 수 있습니다.<br>
		               예약 취소는 인터넷 진료 예약, 젼화예약만 하루전까지 가능합니다.<br>
		               당일 예약 취소는 전화로 문의주세요.<br>
		               예약 문의 : 1500 - 1111
		            </p>
		        </div>
    		</div>
    	</div>

	<div class="listArea">
	<c:if test="${ !empty list }">
		 <table id="list" align="center">
            <tr>
                <td>진료과</td>
                <td>주치의</td>
                <td>예약일자</td>
                <td>예약현황</td>
            </tr>
            
            <c:forEach items="${ list }" var="r">
            	<tr onclick="">
            		<td>${r.did }</td>
            		<td>${r.dname }</td>
            		<td>${r.adate }/${r.atime }</td>
            		<td>${r.astatus }</td>
            	</tr>
            </c:forEach>
          </table>
	</c:if>
	</div>
        <c:if test="${ empty list }">
        	<img src="../resources/images/no1.png" width="200px" height="200px">
        	<p>예약 내역이 없습니다.</p>
		</c:if>
        <div class="btnArea" align="center">
            <button id="book" onclick="location.href='${contextPath}/'">예약하기</button>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>