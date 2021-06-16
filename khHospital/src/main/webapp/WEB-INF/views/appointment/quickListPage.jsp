<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>khHospital</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <style>
        #content{
            width:75%;
            margin: auto;
            margin-top:80px;
            margin-bottom : 70px;
            padding-left:150px;
            min-width: 600px;
        }
        
        h1{
        	padding-right:130px;
        }

        /* img, txt*/
        .infoArea{
            position: relative;
        }

        .infoArea div{
            float: left;
        }
        
        .txtArea{
            width: 80%;
            margin-bottom: 30px;
        }

        .resultArea{
            width: 85%;
            min-width: 600px;
            padding: 30px;
            text-align: center;
        }
		
		
        /* table */
        #listTable{
            width: 100%;
            text-align: center;
            border-top : 2px rgba(197, 197, 197, 0.918) solid;
            border-bottom: 1px rgba(204, 202, 202, 0.918) solid;
            border-collapse : collapse;
        }

        #listTable th{
            background-color: rgba(253, 253, 253, 0.897);
            border-bottom: 1px rgba(184, 187, 187, 0.918) solid;
            height: 33px;
            width: 12%;
        }

        #listTable tbody td{
            border-bottom: 1px rgba(224, 226, 226, 0.918) solid;
            height: 50px;
        }

        /*th:nth-child(1){
            width: 7%;
        }*/

        
		#listTable th:nth-child(4){
            width: 28%;
        } 
	
        #listTable th:last-child{
            width: 20%;
        }

        #listTable button {
            width: 80px;
            height: 27px;
            border: 1px rgba(255, 255, 255, 0.918) solid;
            background-color:   rgba(163, 195, 219, 0.897);
            border-radius: 5px;
            color: white;
        }


        /* page */
        .pageArea{
        	position: relative;
        	margin-top:50px;
        }

        .pageArea a{
            margin: 4px 3px;
            padding: 5px 10px;
            text-decoration: none;
            border :1px rgba(194, 219, 240, 0.87) solid;
            color: rgba(162, 184, 202, 0.87);
        }

		.btnArea{
            text-align: center;
        }

        .btnArea button{
            width: 100px;
            height: 30px;
            border: 1px rgba(255, 255, 255, 0.918) solid;
            background-color:  rgba(169, 209, 241, 0.897);
            border-radius: 5px;
            color: white;
            margin-top : 4%;
        }

    </style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/> 
	
	<div id="content"> 
        <h1 align="center">빠른 진료 예약 내역</h1>
        <div class="infoArea">
        
            <div class="imgArea"><img src="${ contextPath }/resources/image/appointment/의사image.jpg" width="120px" height="150px"></img></div>
            <div class="txtArea">
                <p>${ param.qname }님의 [${ pi.listCount }]건의 예약 현황이 있습니다. </p>
                <hr>
                <p>
		                    예약 취소는 인터넷 진료예약, 전화예약만 하루 전까지 가능합니다.<br>
		                    당일 예약 취소는 전화로 문의 주세요.<br>
		                    예약 문의 : 1500 -1111
                </p>
            </div>
        </div>

        <div class="resultArea">
            <div class="tableArea">
                <table id="listTable">
                    <thead>
                        <tr>
                            <th>환자명</th>
                            <th>연락처</th>
                            <th>연락 가능 시간</th>
                            <th>간단한 증상 또는 문의 사항</th>
                            <th>예약날짜</th>
                            <th>현황</th>
                        </tr>
                    </thead>
                    <tbody>
                     	<c:forEach items="${ qalist }" var="qa" >
                        <tr>
                            <td>${ qa.qname }</td>
                            <td>${ qa.qphone }</td>
                            <td>${ qa.qtime}</td>
                            <td>${ qa.qetc }</td>
                            <td>${ qa.edate }</td>
                            <td>${ qa.qstatus }
                              	<c:if test="${ qa.qstatus eq '예약완료'}">
                              	<button id="cancelBtn" onclick="cancelCheck(${ qa.qid });">예약 취소</button>
                              	</c:if>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            
            <script>
            	function cancelCheck(qid){
            		if(confirm("해당 예약 취소하시겠습니까?"))
            			location.href='${contextPath}/appoint/quick/update?qid=' + qid;
            	}
            </script>
            
            <div class="pageArea">
                <!-- [이전] -->
                <c:if test="${ pi.currentPage eq 1 }">
	               	<a><i class="bi bi-chevron-double-left"></i></a>
	                <a><i class="bi bi-chevron-compact-left"></i></a>
    			</c:if>
    				
    			<c:if test="${ pi.currentPage > 1 }" >
    				<c:url var="start" value="/appoint/quick/list">
    					<c:param name="page" value="1"/>
    					<c:param name="qname" value="${ param.qname }"/>
    					<c:param name="qphone" value="${ param.qphone }"/> 
    				</c:url>
    				<c:url var="before" value="/appoint/quick/list">
    					<c:param name="page" value="${ pi.currentPage - 1 }"/>
    					<c:param name="qname" value="${ param.qname }"/>
    					<c:param name="qphone" value="${ param.qphone }"/> 
	                </c:url>
	    			<a href="${ start } "><i class="bi bi-chevron-double-left"></i></a>
	                <a href="${ before }"><i class="bi bi-chevron-compact-left"></i></a>
    			</c:if>
    				
                <!-- 페이지 숫자 -->
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }" >
                  	<c:if test="${ pi.currentPage eq p }">
                 		<a style="background-color:#e9eefb">${ p }</a>
                   	</c:if>
                   	<c:if test="${ pi.currentPage ne p }">
                   		<c:url var="pagination" value="/appoint/quick/list">
							<c:param name="page" value="${ p }"/>
    						<c:param name="qname" value="${ param.qname }"/>
    						<c:param name="qphone" value="${ param.qphone }"/> 
						</c:url>
					<a href="${ pagination }">${ p }</a> 
                   	</c:if>
                </c:forEach>
    				
    			<!-- 다음  -->
    			<c:if test="${ pi.currentPage < pi.maxPage }">
    				<c:url var="after" value="/appoint/quick/list">
    					<c:param name="page" value="${ pi.currentPage + 1 }"/>
    					<c:param name="qname" value="${ param.qname }"/>
    					<c:param name="qphone" value="${ param.qphone }"/> 
    				</c:url>
    				<c:url var="end" value="/appoint/quick/list">
    					<c:param name="page" value="${ pi.maxPage }"/>
    					<c:param name="qname" value="${ param.qname }"/>
    					<c:param name="qphone" value="${ param.qphone }"/> 
    				</c:url>
    				<a href="${ after }"><i class="bi bi-chevron-right"></i></a>
                   	<a href="${ end }"><i class="bi bi-chevron-double-right"></i></a>
    			</c:if>
    			<c:if test="${ pi.currentPage eq pi.maxPage }">
                   	<a><i class="bi bi-chevron-right"></i></a>
                   	<a><i class="bi bi-chevron-double-right"></i></a>
                </c:if>
            </div>
            
        	<div class="btnArea">
        		<button type="button" onclick="location.href='${contextPath}/appoint/quick'">예약하기 </button>
        	</div>
            
        </div>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>