<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faq 작성 페이지</title>
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
           margin: auto;
       }
       
       /* 바디 화면  */
       #outer {
           /* border: 1px solid red; */
           width: 1400px;
           height: 100%;
           /* max-width: 100%; */
           margin: auto;
           margin-bottom: 40px;
       }

       #content {
           /* border: 1px solid green; */
           width: 1000px;
           height: 100%;
           margin: auto;
       }
       
       .insertArea {
           width : 80%;
           margin: auto;
           table-layout : fixed;
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
       
       #faqTable p {
       	   width : 600px; 
           height : 300px;
           text-align:left;
       }

       #faqTable td:not(last-child) {
           padding: 10px;
       }

       table {
           border-collapse: collapse;
           table-layout : fixed;
           /* width: 900px; */
       }

       tr {
           border-bottom: 2px solid rgb(218, 218, 218);
       }

       #faqTable {
           /* border: 2px solid rgb(211, 211, 211); */
           border-collapse: collapse;
           margin: auto;
           font-size: 14px;
           margin-bottom: 80px;
           min-width : 550px;
       }
      #faqTable td:nth-child(1){
           width: 230px;
           font-weight: bold;
       }

      #faqTable td:nth-child(2){
           width: 50px;
       }

       #faqTable td:nth-child(3){
           width: 120px;
           text-align: right;
           font-weight: bold;
       }

       #faqTable td:nth-child(4){
           width: 120px;
       }

       #faqTable td:nth-child(5){
           width: 160px;
           font-weight: bold;
       } 
       
       #faqTable td:last-child {
       	   width: 900px;
       }

       #btnArea {
           width: 700px;
           height: 80px;
           margin: auto;
           text-align: center;
       }

       #updatebtn,
       #deletebtn,
       #listbtn {
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
            <h1>FAQ </h1>
        </div>
        <div id="content">
            <div class="insertArea">
                
                 <table id="faqTable" style="word-wrap:break-word; table-layout: fixed">
                 	<tr>
                 		<td >카테고리</td>
                 		<c:choose>
						<c:when test="${ faq.dname != null }">
						<td colspan="5">${ faq.dname }</td>
						</c:when>
						<c:when test="${ faq.cname != null }">
						<td colspan="5">${ faq.cname }</td>
						</c:when>
						</c:choose>
                 	</tr>
                	<tr>
                		<td>제목</td>
                		<td colspan="5">${faq.ftitle }</td>
                	</tr>
                	<tr>
                		<td>글번호</td>
                		<td>${faq.fid }</td>
                		<td>작성자</td>
                		<td>${faq.fwriter }</td>
                        <td>작성날짜</td>
                        <td>${faq.fcreatedate }</td>
                	</tr>
                    <tr>
                        <td>내용</td>
                        <td colspan="5"><pre style="width: 100%; height: 300px; overflow: auto; white-space: pre-wrap">${faq.fcontent }</pre></td>
                    </tr>
                </table>
                
                <div id="btnArea">
                	<button id="listbtn" onclick="location.href='${ contextPath }/faq/list'">목록</button>
                    <button id="updatebtn" onclick="location.href='${ contextPath }/faq/updatePage?fid=${ faq.fid }'">수정</button>
                    <button id="deletebtn" onclick="location.href='${ contextPath }/faq/delete?fid=${ faq.fid }'">삭제</button>
                </div>
             </div>
        </div>
      
        
    </section>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>