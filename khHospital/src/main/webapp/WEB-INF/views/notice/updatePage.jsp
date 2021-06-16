<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성 페이지</title>
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

       #updateForm {
           padding: 20px 150px;
           /* margin: auto; */
       }

       #n_title {
           width: 700px;
           height: 50px;
           margin-bottom: 20px;
           padding: 20px;
       }

       textarea {
           width: 700px;
           height: 500px;
           padding: 20px 10px 10px 10px;
       }
       
      
       #btnArea {
           /* border: 1px solid slategray; */
           width: 700px;
           height: 80px;
           margin: auto;
           padding: 30px 300px;
       }

       #insert_btn {
           width: 100px;
           height: 35px;
           border: 1px solid gray;
           background-color: white;
           cursor: pointer;
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
            <div id="insertArea">
                <form action="${ contextPath }/notice/update" id="updateForm" method="POST" enctype="multipart/form-data">
                <input type="text" name="nwriter" value="${ loginUser.userId }" style="display:none;" readonly>
                <span><input type="text" name="ntitle" id="n_title" value="${ notice.ntitle }" ></span>
                <textarea name="ncontent" style="resize:none;" required> ${ notice.ncontent } </textarea>
				<label>수정할 첨부파일</label>
				<input type="file" name="uploadFile">
				<c:if test="${ !empty notice.nfile }">
				<h4>현재 업로드한 파일</h4>
				<c:set var="fileName" value="${ fn:split( notice.nfile, '/') }"/>
				<a href="${ contextPath }/resources${ notice.nfile }" download>
				${ fileName[fn:length(fileName)-1] }
				</a>
				
				<input type="hidden" name="nfile" value="${ notice.nfile }"/>
				</c:if>
				<input type="hidden" name="nid" value="${ notice.nid }"/>
                <div id="btnArea">
                    <button id="insert_btn">등록</button>
                </div>
                </form>
            </div>
        </div>
    </section>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>