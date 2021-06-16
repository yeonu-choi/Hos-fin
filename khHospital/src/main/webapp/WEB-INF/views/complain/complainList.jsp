<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ComplainList</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <style>
        .outer {
			width: 90%;
			height: auto;
			margin: auto;
			position:relative;
			min-height : 600px; 
   		}
        
        #notice {
			width : 700px;
			height : 70px;
			margin-bottom : 30px;
      	    margin-left : 40px;
        }
        
        h1 {
	    	text-align : center;
	        color : #00a5db;
	        margin-top : 30px;
   	 	}

        .searchArea button{
            width : 55px;
            height : 35px;
            background-color: rgb(57, 133, 247);
            color : white;
            border : none;
            border-radius: 3px;
            font-size : 18px;
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
        
        #list th:nth-child(5) {
            width : 50px;
        }
        
        #list tr:not(:last-child) {
      		border : 1px solid #f3f5f7;
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
	        padding : 8px;
	        text-align: center;
        }

		select {
			width : 100px;
			height : 35px;
		}
		
        #search {
        	width : 250px;
			height : 33px;
        }

        #list {
            width : 700px;
            margin-top: 20px;
        }
 
        #write {
            width : 100px;
            height : 40px;
            background-color:  rgb(57, 133, 247);
            border-radius: 3px;
            border : none;
            color : white;
            margin-top: 20px;
            font-size : 20px;
        }
        
    </style>
</head>
<body>
	
	<jsp:include page="../common/menubar.jsp"/>
    <h1>불편사항</h1>
    
    <div class="outer" align="center">
	    <div id="notice" align="left">
	        <p id="p1">
	            고객님의 의견은 병원 서비스 향상에 도움이 됩니다.<br>
	            고객님께서 보다 편리하게 KH대학병원을 이용하실 수 있도록 모든 임직원이 최선을 다해 노력하겠습니다.<br>
	             ＊ 회신이 필요한 사안에 따라 1주 이내에 답변을 드리지만 경우에 따라 초과될 수 있습니다.<br>
	             ＊ 운영 취지에 맞지 않거나 비방 및 욕설은 관리자에 의하여 임의 삭제될 수 있습니다.
	        </p>
	    </div>
	    
	    <div class="searchArea">
	   	<form action="${contextPath}/complain/search" method="get">
		   	<select id="searchCondition" name="searchCondition">
		   		<option value="all" <c:if test="${ param.searchCondition == 'all' }">selected</c:if>>전체</option>
	            <option value="title" <c:if test="${ param.searchCondition == 'title' }">selected</c:if>>제목</option>
		        <option value="content"<c:if test="${ param.searchCondition == 'content' }">selected</c:if>>내용</option>
		        <option value="writer" <c:if test="${ param.searchCondition == 'writer' }">selected</c:if>>작성자</option>
		   	</select>
		        <input type="search" id="search" name="searchValue" value="${ param.searchValue }">
		        <button>검색</button>
	   	</form>
	     
        </div>
        
        <div class="listArea">
            <table id="list">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                </tr>
	                <c:forEach items="${ list }" var="cb">
		                <tr onclick="selectComplain(${ cb.cbid })">
		                    <td>${ cb.cbid }</td>
		                    <td>${ cb.cbtitle }</td>
		                    <td>${ cb.cbwriter }</td>
		                    <td><fmt:formatDate value="${ cb.cbcreateDate }" pattern="yy.MM.dd"/></td>
		                    <td>${ cb.cbcount }</td>
		                </tr>
	                </c:forEach>
                
                
                <!-- 페이징바 구간 -->
				<tr>
					<td colspan="6">
					
					<!-- [이전] -->
					<c:if  test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="/board/list">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }">[이전]</a> &nbsp;
					</c:if>
					
					<!-- 페이지 숫자 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="red" size="4"><b>[${ p }]</b></font> &nbsp;
						</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pageination" value="/board/list">
								<c:param name="page" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						[다음]
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="/board/list">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url>
						<a href="${ after }">[다음]</a>
					</c:if>
					
					</td>
				</tr>
                    
            </table>
        </div>
        
        <c:if test="${ loginUser != null }">
         <div class="btnArea">
            <button class="wbtn" id="write" onclick="location.href='${ contextPath }/complain/write'">글쓰기</button>
        </div>
        </c:if>
        
    </div>
    <br><br><br><br>
    
    <jsp:include page="../common/footer.jsp"/>
    
    <script>
    	function selectComplain(cbid) {
    		location.href= '${contextPath}/complain/detail?cbid=' + cbid + '&page=${ pi.currentPage}';
    	}
    </script>
</body>
</html>