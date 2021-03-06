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
    <h1>????????????</h1>
    
    <div class="outer" align="center">
	    <div id="notice" align="left">
	        <p id="p1">
	            ???????????? ????????? ?????? ????????? ????????? ????????? ?????????.<br>
	            ??????????????? ?????? ???????????? KH??????????????? ???????????? ??? ????????? ?????? ???????????? ????????? ?????? ?????????????????????.<br>
	             ??? ????????? ????????? ????????? ?????? 1??? ????????? ????????? ???????????? ????????? ?????? ????????? ??? ????????????.<br>
	             ??? ?????? ????????? ?????? ????????? ?????? ??? ????????? ???????????? ????????? ?????? ????????? ??? ????????????.
	        </p>
	    </div>
	    <br>
	    <div class="searchArea">
	    <br>
	   	<form action="${contextPath}/complain/search" method="get">
		   	<select id="searchCondition" name="searchCondition">
		   		<option value="all" <c:if test="${ param.searchCondition == 'all' }">selected</c:if>>??????</option>
	            <option value="title" <c:if test="${ param.searchCondition == 'title' }">selected</c:if>>??????</option>
		        <option value="content"<c:if test="${ param.searchCondition == 'content' }">selected</c:if>>??????</option>
		        <option value="writer" <c:if test="${ param.searchCondition == 'writer' }">selected</c:if>>?????????</option>
		   	</select>
		        <input type="search" id="search" name="searchValue" value="${ param.searchValue }">
		        <button>??????</button>
	   	</form>
	     
        </div>
        
        <div class="listArea">
            <table id="list">
                <tr>
                    <th>??????</th>
                    <th>??????</th>
                    <th>?????????</th>
                    <th>?????????</th>
                    <th>?????????</th>
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
                
                
                <!-- ???????????? ?????? -->
				<tr>
					<td colspan="6">
					
					<!-- [??????] -->
					<c:if  test="${ pi.currentPage <= 1 }">
						[??????] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="/board/list">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }">[??????]</a> &nbsp;
					</c:if>
					
					<!-- ????????? ?????? -->
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
					
					<!-- [??????] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						[??????]
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="/board/list">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url>
						<a href="${ after }">[??????]</a>
					</c:if>
					
					</td>
				</tr>
                    
            </table>
        </div>
        
        <c:if test="${ loginUser != null }">
         <div class="btnArea">
            <button class="wbtn" id="write" onclick="location.href='${ contextPath }/complain/write'">?????????</button>
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