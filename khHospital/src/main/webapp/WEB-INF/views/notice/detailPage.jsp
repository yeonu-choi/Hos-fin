<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세 페이지</title>
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
           width: 1400px;
           height: 100%;
           max-width: 100%;
           margin: auto;
           margin-bottom: 40px;
       }

       #content {
           /* border: 1px solid green; */
           width: 1000px;
           height: 100%;
           margin: auto;
       }

       #faqTop {
           /* border: 1px solid blue; */
           width: 1000px;
           height: 140px;
           margin: auto;
           text-align: center;
           font-size: 30px;
           font-weight: bold;
           color: gray;
       }

       #noticeTable p {
           height : 300px;
           text-align:left;
           overflow: auto;
       }

       #noticeTable td:not(last-child) {
           padding: 15px;
       }

       table {
           border-collapse: collapse;
       }

       tr {
           border-bottom: 2px solid rgb(218, 218, 218);
       }

       #noticeTable {
           /* border: 2px solid rgb(211, 211, 211); */
           margin: auto;
           width: 80%;
           font-size: 14px;
           margin-bottom: 80px;
           min-width : 550px;
       }


       #noticeTable td:nth-child(1){
           width: 90px;
           font-weight: bold;
       }

       #noticeTable td:nth-child(2){
           width: 70px;
       }

       #noticeTable td:nth-child(3){
           /* border: 1px solid firebrick; */
           width: 80px;
           text-align: right;
           font-weight: bold;
       }

       #noticeTable td:nth-child(4){
           /* border: 1px solid firebrick; */
           width: 120px;
       }

       #noticeTable td:nth-child(5){
           /* border: 1px solid blueviolet; */
           width: 90px;
           font-weight: bold;
       }

       #btnArea {
           /* border: 1px solid slategray; */
           width: 700px;
           height: 80px;
           margin: auto;
           text-align: center;
       }

       #update_btn,
       #delete_btn,
       #list_btn {
           width: 100px;
           height: 35px;
           border: 1px solid gray;
           background-color: white;
           cursor: pointer;
       }
       
       pre {
       	 	line-height: 23px;
       }
    </style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<section id="outer">
        <div id="faqTop">
            <h1>공지사항 </h1>
        </div>
        <div id="content">
            <div id="detailArea">
                <table id="noticeTable">
                	<tr>
                		<td>제목</td>
                		<td colspan="4">${notice.ntitle }</td>
                	</tr>
                	<tr>
                		<td>글번호</td>
                		<td>${notice.nid }</td>
                		<td>작성자</td>
                		<td>${notice.nwriter }</td>
                        <td>작성날짜</td>
                        <td>${notice.ncreatedate }</td>
                	</tr>
                    <tr>
                        <td>내용</td>
                        <td colspan="5"><pre style="width: 100%; height: 300px; overflow: auto; white-space: pre-wrap">${notice.ncontent }</pre></td>
                    </tr>
                    <tr>
                        <td>첨부파일</td>
                        <td colspan="5">
							<c:if test="${ !empty notice.nfile }">
							<c:set var="fileName" value="${ fn:split(notice.nfile, '/' )}"/>
							<a href="${ contextPath }/resources${ notice.nfile }" download>
							${ fileName[fn:length(fileName)-1] }</a>
					</c:if>
						</td>
                    </tr>
                </table>
            </div>
            <div id="btnArea">
					<button id="list_btn" onclick="location.href='${ contextPath }/notice/list'">목록</button>
					<c:if test="${loginUser.userId eq 'admin11' }">
                    <button id="update_btn" onclick="location.href='${ contextPath }/notice/updatePage?nid=${ notice.nid }'">수정</button>
                    <button id="delete_btn" onclick="location.href='${ contextPath }/notice/delete?nid=${ notice.nid }'">삭제</button>
                    </c:if>
                </div>
        </div>
    </section>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>