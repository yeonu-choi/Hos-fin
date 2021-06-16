<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>전문의 상담</title>
 <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
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
    
    #notice {
    	width : 600px;
    } 

    #p2 {
        font-size: 12px;
    } 

    .pro {
        display: flex;
        flex-direction: row;
    }

    img {
        align-self: center;
        margin-right: 20px;
    }


    #list {
        width : 600px;
        height: auto;
        margin-top: 20px;
        border : 1px solid gray;
        padding : 2px;
    }
    
    #list td {
    	  	cursor : pointer;
		}

        #list th:nth-child(1) {
            width : 50px;
        }
        
        #list th:nth-child(2) {
            width : 300px;
        }
        
        #list th:nth-child(3) {
            width : 50px;
        }
        
        #list th:nth-child(4) {
            width : 50px;
        }
   		
        .listArea th {
	    	text-align : center;
	    	font-width : bold;
	    	background-color : #87CEFA;
	    	color : black;
    	}

        table {
        	border-collapse: collapse;
        }

        th, td {
	        padding : 7px;
	        text-align: center;
        }

	    #coun{
	        background-color: rgb(57, 133, 247);
	        width : 180px;
	        height : 40px;
	        border-radius: 3px;
	        color : white;
	        border : none;
	        margin-top: 20px;
	        font-size : 20px;
	    }

</style>
<body>
<jsp:include page="../common/menubar.jsp"/>
    <div class="outer" align="center">
        <h1>1:1 전문의 상담</h1>
        
        <%-- <div class="menuArea">
            <table id="menu">
               <tr>
	             <td class="menu mp" onclick="location.href='${ contextPath }/mypage/modify'">개인 정보 수정</td>
	             <td class="menu re" onclick="location.href='${ contextPath }/mypage/reservation'">예약 내역 확인</td>
	             <td class="menu coun" onclick="location.href='${ contextPath }/mypage/counsel'">1:1 전문의 상담</td>
	         </tr>
            </table>
        </div> --%>

        <div id="notice" align="center">
            <p id="p1" align="left">
                의료 상담, 건강 상담을 위한 '1:1 전문의 상담'을 이용해 주세요.<br>
                양질의 상담 서비스를 위해 교수님별 일일 상담 건수를 제한하고 있습니다.<br>
                병원 이용 및 기타 문의사항은 건의/블편사항 게시판 또는 1588-1111로 문의하여 주십시오.<br>
                모든 게시판 성격에 맞지 않는 글(비방, 광고성)은 관리자에 의하여 임의 삭제될 수 있습니다.
            </p>
        </div>
		
		<div class="listArea">
		<c:if test="${ !empty list }">
			<table id="list">
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성일</th>
					<th>답변상태</th>
				</tr>
				
				<c:forEach items="${ list }" var="cs">
					<tr onclick="selectCounsel(${ cs.cid })">
						<td>${ cs.cid }</td>
						<td>${ cs.ctitle }</td>
						<td><fmt:formatDate value="${ cs.ccreateDate }" pattern="yy.MM.dd"/></td>
						<td>${ cs.cstatus }</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		</div>
        <c:if test="${ empty list }">
        <img src="../resources/images/no2.png" width="200px" height="200px">
        	<p>상담 내역이 없습니다.</p>
        </c:if>

        <div class="btnArea" align="center">
            <button id="coun" onclick="location.href='${contextPath}/counsel/select'">1:1 상담하기</button>
        </div>
        
    </div>
    
    <script>
    	function selectCounsel(cid) {
    		location.href='${contextPath}/counsel/detail?cid' + cid + "&page=${pi.currentPage}";
    	}
    </script>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>