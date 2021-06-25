<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문화센터 작성</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<body>
<style>

.title h1 {
    margin-top: 50px;
    text-align: center;
    height: 200px;
    font-size: 42px;
    line-height: 200px;
    
}

.title p {
    border-top: 3px solid #a08b65;
    text-align: center;
    margin-bottom: 50px;
}

/* container */
.container {
   margin-bottom: 200px;
   
}

.culture_wrap > div{
    width: 1200px;
 
    height: 1500px;
}

.culture_info {
    margin-left: auto;
    margin-right: auto;
}

.culture_write {
    margin-top: 20px;
   
    height: 1000px;
    
}

.culture_list > ul {
    list-style: none; 
      
}

.culture_list ul li {
    position: relative;
    width: 100%;
    border: 1px solid red;
    float: left;
    margin-left: 30px;
    margin-bottom: 30px;
    height: 500px;
}

/* 사진 등록 */

.culture_write  {
    
    width: 100%;
    height: auto;
}

#writeForm {
    width: 600px;
    margin-left: auto;
    margin-right: auto;
    padding: 50px;
    border: 2px solid #006a79;
}

#writeForm h4 {
    font-size: 20px;
    margin-bottom: 20px;
    margin-top: 20px;
}

.input_area input {
    border: 2px solid #006a79;
    padding: 10px;
    width: 90%;
    
}

textarea {
    width : 90%;
    height : 200px;
    padding : 10px 10px 14px 10px;
    border: solid 2px #006a79;
}

.btnArea {
    text-align: center;
   
    margin-top: 20px;
}
.btnArea button {
    cursor: pointer;
    background-color: #006a79;
    width: 120px;
    height: 40px;
    color: white;
}

</style>
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
    <jsp:include page="../common/footer.jsp"/>
    

</body>
</html>