<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>khHospital</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <style>
        #content{
            width:1100px;
            margin: auto;
            margin-top:70px;
            min-width: 600px;
            margin-bottom:200px;
        }
        
        
        .infoArea {
            width:700px;
            border : 1px solid rgba(224, 231, 236, 0.897);
            margin: auto;
            text-align: center;
            margin-top: 80px;
            padding: 20px;
        }
        
        .infoArea label{
            display: inline-block;
            width: 200px;
        }
        
        .infoArea button{
            width: 100px;
            height: 30px;
            border: 1px rgba(255, 255, 255, 0.918) solid;
            background-color:  rgba(169, 209, 241, 0.897);
            border-radius: 5px;
            color: white;
        }
    </style>

</head>
<body>
	<jsp:include page="../common/menubar.jsp"/> 
		
    <div id="content">
        <div class="infoArea">
			<div>
				<h2>${ loginUser.userName }님 예약 완료 되었습니다.</h2><br>
                <p>
                	<label>${o.deptName}</label>
                	<label>${o.dname}</label>
                </p>
                <p>	
                	<label>날짜 : ${o.adate}</label>
                	<label>시간 : ${o.atime}</label>
                </p>
                <br>
                <p>예약/상담 - 예약 조회 - 온라인 예약 조회에서 확인 가능합니다. &nbsp;&nbsp; <button onclick="location.href='${ contextPath }/appoint/online/list'">예약 조회</button></p>
                
			</div>
		</div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>