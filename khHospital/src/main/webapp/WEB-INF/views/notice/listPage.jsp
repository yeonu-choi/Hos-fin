<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hospital 공지사항</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<style>
        * { box-sizing: border-box; }

        header,
        nav,
        section,
        body,
        footer {
            display: block;
            /* border: 1px solid red; */
        }

        body {
          /*  width: 1200px; 
           height: 1200px; */
           margin: auto;
       }
       
       
       /* 바디 화면  */
       #outer {
           /* border: 1px solid red; */
           height: 100%;
           width: 1400px;
           max-width: 100%;
           margin: auto;
       }

       #noticeTop {
           /* border: 1px solid blue;  */
           width: 1000px;
           height: 140px;
           margin: auto;
           text-align: center;
           font-size: 30px;
           font-weight: bold;
           color: gray;
       }

       .content {
           /* border: 1px solid green; */
           width: 1100px;
           /* max-width: 70%; */
           height: 50%;
           margin: auto;
           height: 600px;
       }

       .listArea {
           border: 2px solid rgb(175, 171, 171);
           padding: 5px;
           margin: auto;
           width: 100%;
           max-width: 100%;
       }

       #listTable td {
           cursor: pointer;
       }

       #listTable {
           text-align: center;
           border-collapse: collapse;
           line-height: 2.5;
           min-width : 570px;
           margin: auto;
       }

       #listTable th:nth-child(1){
           width: 50px;
       }

       #listTable th:nth-child(2){
           width: 500px;
       }

       #listTable th:nth-child(3){
           width: 100px;
       }

       #listTable th:nth-child(4){
           width: 150px;
       }
       
       #listTable th:nth-child(5){
           width: 50px;
       }
       
        #listTable th:nth-child(6){
           width: 100px;
       }
       
        #listTable td:nth-child(6) {
           line-height:1;
   	   }

       #listTable tr:not(:last-child) {
           border-bottom: 1px solid rgb(182, 184, 185);
       }
       
       .pageCount {
       	   text-align: center;
       	   margin-top: 20px;
       }
	
	   #btnArea{
	   	   /* margin-left: 270px; */
	   	   margin-top: 30px;
	   	   text-align: center;
	   }
	   
	   #btnArea * {
	   	    height : 30px;
      	    vertical-align:middle;
      		
	   }
	
	   #searchCondition {
	       width: 70px;
	       height: 30px;
	   }
	
	   input[type=search]{
	       height: 30px;
	       width: 300px;
	   }
	
       #btnArea button {
           width: 100px;
           height: 30px;
           border: 1px solid gray;
           background-color: white;
           cursor: pointer;
       }
       
    </style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<section id="outer">
        <div id="noticeTop">
            <h1>공지사항 </h1>
        </div>
        <div class="content">
            <div class="listArea">
                <table id="listTable">
                    <tr>
                        <th>번호</th>
                        <th>글제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                        <th>파일</th>
                    </tr>
                    <c:forEach items="${list}" var="n">
                    <tr onclick="selectNotice(${n.nid});">
                    	<td>${n.nid}</td>
                    	<td>${n.ntitle}</td>
                    	<td>${n.nwriter}</td>
                    	<td>${n.ncreatedate}</td>
                    	<td>${n.ncount}</td>
                    	<td>
						<c:if test="${ !empty n.nfile }">
						<img src="${ contextPath }/resources/images/fileicon.png" width="20">
						</c:if>
					</td>
                    </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="5"></td>
                    </tr>
                </table>
            </div>
            
            <div class="pageCount">
            	<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="/notice/list">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }">[이전]</a> &nbsp;
					</c:if>
					<!-- 페이지 숫자 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="red" size="4"><b>[ ${ p } ]</b></font> &nbsp;
						</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="/notice/list">
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
						<c:url var="after" value="/notice/list">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url>
						<a href="${ after }">[다음]</a>
					</c:if>
            </div>
            
            <div id="btnArea">
            <form action="${ contextPath }/notice/search" method="get">
				<select id="searchCondition" name="searchCondition">
					<option value="all" <c:if test="${ param.searchCondition == 'all' }">selected</c:if>>전체</option>
					<option value="writer" <c:if test="${ param.searchCondition == 'writer' }">selected</c:if>>작성자</option>
					<option value="title" <c:if test="${ param.searchCondition == 'title' }">selected</c:if>>제목</option>
					<option value="content" <c:if test="${ param.searchCondition == 'content' }">selected</c:if>>내용</option>
				</select>
				<input type="search" name="searchValue" value="${ param.searchValue }">
				<button>검색</button>
				<c:if test="${ loginUser.userId eq 'admin11' }">
				<button type="button" onclick="location.href='${ contextPath }/notice/write'">글작성</button>
				</c:if>
			</form>
            </div>
        </div>
    </section>
    
    <script>
		function selectNotice(nid){
			location.href='${ contextPath }/notice/detail?nid=' + nid;
		}
	</script>
    
    
    
    
    
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>