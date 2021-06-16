<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>칭찬 게시판</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <style>
        #content{
            width:75%;
            margin: auto;
            margin-top:80px;
            margin-bottom:80px;
            min-width: 600px;
        }
        
        #content h1{
    		font-size: 2em;
        	font-weight:1000;
        }
        
        
        .container {
            width: 80%;
            height: 250px;
            margin: auto;
            text-align: center;
            padding: 30px;
            margin-bottom: 50px;
        }
        
        .container .row{
        	border: 1px #ccc9c9 solid;
        	padding-top:30px;
        	border-radius: 10px;
        	
        }

        .container .col{
            width: 200px;
            height: 110px;
            padding: 10px;
            margin: 2% 4%;
            overflow:hidden; 
            /* border: 1px #ccc9c9 solid; */
        }
        
        .col{
        	cursor: pointer;
        }

        
        /* search */
        .searchArea{
            min-width: 400px;
        }

        .searchArea input, #searchSelect, #searchBtn{
            border : 1px rgba(204, 202, 202, 0.918) solid;
            border-radius: 3px;
            vertical-align: middle;
            padding: 1px 5px;
        }

        .searchArea input{
            width: 250px;
            height: 36px;
        }

        #searchSelect{
            width: 100px;
            height : 40px;
        }
        
        #searchBtn{
            width: 50px;
            height : 40px;
            background-color : white;
        }
        
        /* table */
        .tableArea{
            margin: auto;
            margin-top: 30px;
            width: 100%;
        }

        #listTable{
            width: 100%;
            text-align: center;
            border-top : 2px rgba(197, 197, 197, 0.918) solid;
            border-collapse : collapse;
        }
        
        #listTable th{
            background-color: rgb(233 241 251);
            border-bottom: 1px rgb(215 220 220) solid;
            height: 45px;
        }

        #listTable tbody td{
            border-bottom: 1px rgba(224, 226, 226, 0.918) solid;
            height: 42px;
            cursor: pointer;
        }

        td:nth-child(1){
            width: 8%;
        }

        td:nth-child(3), td:nth-child(4){
            width: 10%;
        }

        /* page */
        .pageArea{
            margin-top:50px;
            text-align: center;
        }

        .pageArea a{
            margin: 4px 3px;
            padding: 5px 10px;
            text-decoration: none;
            border :1px rgba(194, 219, 240, 0.87) solid;
            color: rgba(162, 184, 202, 0.87);
        }

        /* button */
        .btnArea button{
            width: 100px;
            height: 30px;
            border: 1px rgba(255, 255, 255, 0.918) solid;
            background-color:  rgba(169, 209, 241, 0.897);
            border-radius: 5px;
            color: white;
            margin-top : 3%;
        }

    </style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/> 

    <div id="content">
        <h1>칭찬합시다</h1>
        
        <p class="txt">
		        병원 이용중 친절한 직원을 칭찬해주세요.<br>
		        소중한 칭찬 한마디를 귀담아 듣고, 고객 서비스에 최선을 다하겠습니다.
        </p>
        
		<c:if test="${ tlist.size() == 3 }">
	        <div class="container">
	        	<div class="row">
	        	<h4><b>BEST 게시글</b></h4>
		        	<c:forEach items="${ tlist }" var="t">
		        		<div class="col">
		        			<p onclick="detailPage(${t.cno});">${ t.ctitle }<br></p>
		                </div>
		            </c:forEach>
	            </div>
	        </div>
	    </c:if>
        
        <div class="boardList">
            <div class="searchArea" align="right">
                <form action="${ contextPath }/compliment/search" method="get">
                <select id="searchSelect" name="searchSelect">
                    <option value="total" <c:if test="${ param.searchSelect == 'total' }">selected</c:if>>전체</option>
                    <option value="title" <c:if test="${ param.searchSelect == 'title' }">selected</c:if>>제목</option>
                    <option value="content" <c:if test="${ param.searchSelect == 'content' }">selected</c:if>>내용</option>
                </select>
                <input type="text" name="search" placeholder="내용을 입력해주세요" value="${ param.search }">
                <button id="searchBtn"><i class="bi bi-search"></i></button>
                </form>
            </div>

            <div class="tableArea" align="center">
                <table id="listTable">
                    <thead>
                        <tr>
                        	<th>NO.</th>
                        	<th>제목</th>
                            <th>작성자</th>
                            <th>조회수</th>
                        </tr>
                    </thead>
                   	<tbody>
                    	<c:if test="${ not empty clist }">
                    		<c:forEach items="${ clist }" var="c">
	                        <tr onclick="detailPage(${c.cno});">
	                            <td>${ c.cno }</td>
	                            <td>${ c.ctitle }</td>
	                            <td>${ c.userName }</td>
	                            <td>${ c.ccount }</td>
	                        </tr>
	                        </c:forEach>
                        </c:if>
                        <c:if test="${ empty clist }">
	                        <tr>
	                        	<td colspan="4" style="cursor: text;">작성된 게시글이 없습니다.</td>
	                        </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
			
			
			<!-- 페이징 처리 -->
            <div class="pageArea">
            	<c:if test="${ not empty clist }">
	            	<c:if test="${ pi.currentPage eq 1 }">
	                	<a><i class="bi bi-chevron-double-left"></i></a>
	                	<a><i class="bi bi-chevron-compact-left"></i></a>
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:if test="${ param.search eq null}">
							<c:url var="start" value="/compliment/list" >
								<c:param name="page" value="1"/>
							</c:url>
							<c:url var="before" value="/compliment/list">
								<c:param name="page" value="${ pi.currentPage -1 }"/>
							</c:url>
		                </c:if>
		                <c:if test="${ param.search ne null}">
							<c:url var="start" value="/compliment/search" >
								<c:param name="page" value="1"/>
								<c:param name="searchSelect" value="${ param.searchSelect }"/>
								<c:param name="search" value="${ param.search }"/>
							</c:url>
							<c:url var="before" value="/compliment/search">
								<c:param name="page" value="${ pi.currentPage -1 }"/>
								<c:param name="searchSelect" value="${ param.searchSelect }"/>
								<c:param name="search" value="${ param.search }"/>
							</c:url>	
		                </c:if>
		                <a href="${ start }"><i class="bi bi-chevron-double-left"></i></a>
		                <a href="${ before }"><i class="bi bi-chevron-compact-left"></i></a>
	                </c:if>
	                
	                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.maxPage }">
	                	<c:if test="${ pi.currentPage eq p }">
	                		<a style="background-color:#e9eefb">${ p }</a>
	                	</c:if>
		                <c:if test="${ pi.currentPage ne p }">
		                	<c:if test="${ param.search eq null }">
		                		<c:url var="pagination" value="/compliment/list">
		                			<c:param name="page" value="${ p }"/>
		                		</c:url>
		                	</c:if>
		                	<c:if test="${ param.search ne null }">
		                		<c:url var="pagination" value="/compliment/search">
		                			<c:param name="page" value="${ p }"/>
		                			<c:param name="searchSelect" value="${ param.searchSelect }"/>
		                			<c:param name="search" value="${ param.search }"/>
		                		</c:url>
		                	</c:if>
		                	<a href="${ pagination }">${ p }</a>
		                </c:if>
                	</c:forEach>
				
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:if test="${ param.search eq null }">
							<c:url var="after" value="/compliment/list">
								<c:param name="page" value="${ pi.currentPage + 1 }"/>
							</c:url>
							<c:url var="end" value="/compliment/list">
								<c:param name="page" value="${ pi.maxPage }"/>
							</c:url>
						</c:if>
						<c:if test="${ param.search ne null }">
							<c:url var="after" value="/compliment/search">
								<c:param name="page" value="${ pi.currentPage + 1 }"/>
								<c:param name="searchSelect" value="${ param.searchSelect }"/>
								<c:param name="search" value="${ param.search }"/>
							</c:url>
							<c:url var="end" value="/compliment/search">
								<c:param name="page" value="${ pi.maxPage }"/>
								<c:param name="searchSelect" value="${ param.searchSelect }"/>
								<c:param name="search" value="${ param.search }"/>
							</c:url>
						</c:if>
					    <a href="${ after }"><i class="bi bi-chevron-right"></i></a>
	                	<a href="${ end }"><i class="bi bi-chevron-double-right"></i></a>
					</c:if>
					<c:if test="${ pi.currentPage eq pi.maxPage }">
	                	<a><i class="bi bi-chevron-right"></i></a>
	                	<a><i class="bi bi-chevron-double-right"></i></a>
	                </c:if>
                </c:if>
            </div>
			
            <div class="btnArea" align="right">
            	<c:if test="${ not empty loginUser }">
                	<button type="button" onclick="location.href='${ contextPath }/compliment/insertPage'">등록</button>
                </c:if>
            </div>
        </div>
    </div>
    
    <script>
    	function detailPage(cno){
    		location.href='${ contextPath }/compliment/detail?cno=' + cno + "&page=${ pi.currentPage }";
    	}
    </script>
    
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>