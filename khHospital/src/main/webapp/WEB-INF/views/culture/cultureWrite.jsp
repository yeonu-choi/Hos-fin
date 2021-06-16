<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문화센터 작성</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/cultureWrite.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<body>
 	<jsp:include page="../common/menubar.jsp"/>

    <div class="title">
        <h1>문화센터 등록</h1>

        <p>
            강의 정보를 등록해주세요!~
        </p>
    </div>

    <!-- container-->
    <div class="container" id="container">
        <!-- content -->
        <div class="culture_wrap">
            <div class="culture_info">
                <div class="culture_write">
                    <form action="${ contextPath }/culture/insert" id="writeForm" method="post" enctype="multipart/form-data">
                        
                        <h4>사진 첨부파일</h4>
                        <input type="file" name="uploadFile" id="thumbnail">
                        <h4>제목</h4>
                        <span class="input_area"><input type="text" name="ctitle"></span>
                        <h4>부제목</h4>
                        <span class="input_area"><input type="text" name="csubtitle"></span>
                        <h4>내용</h4>	
                        <textarea name="ccontent" style="resize:none;"></textarea>
                        
                        <div class="btnArea">
                            <button class="writebtn">등록하기</button>
                        </div>
                    </form>
       
                </div>
         
            </div>
        </div>

    </div>
    
    

</body>
</html>