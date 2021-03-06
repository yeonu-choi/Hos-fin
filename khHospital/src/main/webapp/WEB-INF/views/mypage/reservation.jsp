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
   	 	
        .menu {
	        background-color: rgb(57, 133, 247);
	        text-align: center;
	        color : white;
	        width : 200px;
	        height: 25px;
	        font-weight: bold;
        }  
        
        .n1 {
        	width : 600px;
        }

		#p1 {
			font-size : 20px;
		}

        #p2 {
            font-size: 18px;
        } 
        
        #p3{
        	font-size : 20px;
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
        width : 600px;
        height: auto;
        margin-top: 20px;
        border : 1px solid gray;
        border-collapse: collapse;
    }

        #list th:nth-child(1) {
            width : 60px;
        }
        
        #list th:nth-child(2) {
            width : 120px;
        }
        
        #list th:nth-child(3) {
            width : 60px;
        }
        
        #list th:nth-child(4) {
            width : 120px;
        }

        #list th:nth-child(5) {
            width : 120px;
        }

        #list th {
            background-color:lightgray;
            color :black;
            padding : 5px;
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
            margin-bottom : 60px;
        }
        
        #qres {
        	background-color: rgb(57, 133, 247);
        	border-radius: 3px;
            color : white;
            border : none;
            width : 150px;
            height : 20px;
        }

        #no{
            background-color: lightblue;
            width : 80px;
            height : 20px;
            color : white;
            border : none;
            border-radius: 3px;
        }



    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/>
    <div class="outer" align="center">

        <h1 align="center">?????? ?????? ??????</h1>
        <div class="n1">
	        <div class="pro">
	        <img src="../resources/images/profile.png" width="70px" height="70px" id="profile">
		        <div id="notice">
		            <p id="p1">${ loginUser.userName } ?????? ??????????????? [${ pi.listCount }]??? ????????????.</p>
		            <hr width="500px">
		            <p id="p2" align="left">
		               ?????? ?????? ????????? ????????? ??? ????????????.<br>
		               ?????? ????????? ????????? ?????? ??????, ??????????????? ??????????????? ???????????????.<br>
		               ????????? ?????? ????????? ?????? ???????????????.
		               <button id="qres" onclick="location.href='${contextPath}/appoint/quick/search'">?????? ?????? ?????? ??????</button><br>
		               ?????? ?????? ????????? ????????? ???????????????.<br>
		               ?????? ?????? : 1500 - 1111
		            </p>
		        </div>
    		</div>
    	</div>

	<div class="listArea">
	<c:if test="${ !empty onlist }">
		 <table id="list" align="center">
            <tr>
            	<th>?????????</th>
                <th>?????????</th>
                <th>?????????</th>
                <th>????????????</th>
                <th>????????????</th>
                <th>????????????</th>
            </tr>
            
            <c:forEach items="${ onlist }" var="on">
            	<tr align="center">
            		<td height="25px">${on.userName }</td>
            		<td>${on.deptName}</td>
            		<td>${on.dname }</td>
            		<td>${on.adate }</td>
            		<td>${on.atime }</td>
            		<td>${on.astatus }
            		<c:if test="${on.astatus ne '????????????' }">
            				<button id="no" onclick="resNo(${on.aid})">????????????</button>
            			</c:if>
            			</td>
            	</tr>
            </c:forEach>
          </table>
	</c:if>
	</div>
        <c:if test="${ empty onlist }">
        	<img src="../resources/images/no1.png" width="200px" height="200px">
        	<p id="p3">????????? ?????? ?????? ????????? ????????????.</p>
		</c:if>
        <div class="btnArea" align="center">
            <button id="book" onclick="location.href='${contextPath}/appoint/online'">????????????</button>
        </div>
    </div>
    <script>
    	function resNo(aid) {
    		if(confirm("????????? ?????????????????????????"))
    		location.href="${ contextPath }/mypage/reservation/cancel?aid=" + aid;
    		
    	}
    </script>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>