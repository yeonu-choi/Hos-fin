<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문화센터 작성</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/cultureUpdate.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<body>
 	<jsp:include page="../common/menubar.jsp"/>

    <div class="title">
        <h1>문화센터</h1>
	
        <p>
            ${param.cid}번 강의 정보를 상세히 보기
            
        </p>
    </div>

    <!-- container-->
    <div class="container" id="container">
        <!-- content -->
        <div class="culture_wrap">
            <div class="culture_info">
                <div class="culture_write">
                    <form action="" id="writeForm" method="post" enctype="multipart/form-data">
                        
                        <h4>사진</h4>
                        <div>
                            <c:if test="${ !empty Culture.renameFileName }">
                                <img src="${ contextPath }/resources/cuploadFiles/${ Culture.renameFileName}" width="100%" height="100%">
                                                        
                            </c:if>
                        </div>
                        <h4>제목</h4>
                        <span class="input_area"><input type="text" name="ctitle" value="${ Culture.ctitle }" readonly></span>
                        <h4>부제목</h4>
                        <span class="input_area"><input type="text" name="csubtitle" value="${ Culture.csubtitle }" readonly></span>
                        <h4>내용</h4>	
                        <textarea name="ccontent" style="resize:none;" readonly>${ Culture.ccontent }</textarea>
                        
                       
                        
                        <div class="btnArea">
                            <button class="btn" type="button" onclick="javascript:history.back();">뒤로가기</button>
                            <c:if test="${ loginUser.userId eq 'admin1' }">
                            <button onclick="cultureUpdate()" type="button">수정하기</button>
                            <button onclick="cultureDelete()" type="button">삭제하기</button>
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
	
	function cultureUpdate() {
		var cid = ${param.cid}
	
		console.log(cid);
		location.href = '${ contextPath }/culture/updatePage?cid=' + cid;
		
	}
    </script>
    
    

</body>
</html>