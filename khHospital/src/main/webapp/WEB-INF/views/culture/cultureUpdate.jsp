<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문화센터 작성</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/cultureDetail.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<body>
 	<jsp:include page="../common/menubar.jsp"/>

    <div class="title">
        <h1>문화센터</h1>
	
        <p>
            ${param.cid}번 강의 정보를 수정
            
        </p>
    </div>

    <!-- container-->
    <div class="container" id="container">
        <!-- content -->
        <div class="culture_wrap">
            <div class="culture_info">
                <div class="culture_write">
                    <form action="${ contextPath }/culture/update" id="writeForm" method="post" enctype="multipart/form-data">
                        
                        <h4>현재사진</h4>
                        <div>
                            <c:if test="${ !empty Culture.renameFileName }">
                                <img src="${ contextPath }/resources/cuploadFiles/${ Culture.renameFileName}" width="100%" height="100%">                        
                            </c:if>
                        </div>
                        <input type="hidden" name="cid" value="${ param.cid }" readonly>
                        <h4>변경할 사진첨부</h4>
                        <img src="" id="preview" width="100%" height="100%"/>
                        <input type="file" name="uploadFile" multiple="multiple" id="imgselect">
                        <h4>제목</h4>
                        <span class="input_area"><input type="text" name="ctitle" value="${ Culture.ctitle }" required></span>
                        <h4>부제목</h4>
                        <span class="input_area"><input type="text" name="csubtitle" value="${ Culture.csubtitle }" required></span>
                        <h4>내용</h4>	
                        <textarea name="ccontent" style="resize:none;" required>${ Culture.ccontent }</textarea>
                        
                        
                        <div class="btnArea">
                            <button class="btn" type="button" onclick="javascript:history.back();">뒤로가기</button>
                            <c:if test="${ loginUser.userId eq 'admin1' }">
                            <button class="updatebtn" type="submit">수정완료하기</button>   
                            </c:if>
                        </div>
                        
                    </form>
       
                </div>
         
            </div>
        </div>
		
    </div>
    
    <script>
	function cultureDelete() {
		var cid = ${param.cid}
	
		console.log(cid);
		location.href = '${ contextPath }/culture/delete?cid=' + cid;
		
	}
	
	/* 이미지 미리보기 스크립트  */
	$('#imgselect').change(function() {
		
    	setImageFromFile(this, '#preview');
    	
	});
	
	function setImageFromFile(input, expression) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $(expression).attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
    </script>
    
    

</body>
</html>