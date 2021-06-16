<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<style>
    .outer {
		width: 90%;
		min-width:700px;
		height: 800px;
		margin: auto;
		margin-top: 20px;
		position:relative;
    }
    
    #menu {
    		cursor : pointer;
    }
    
    .s {
    	color : orange;
    	
    }

    .menu {
        background-color: rgb(57, 133, 247);
        text-align: center;
        color : white;
        width : 200px;
        height: 20px;
        font-weight: bold;
    }

    .tableArea td{
        padding-bottom: 5px;
    }

    table{
        border-collapse: collapse;
    }
    
    #modify {
    	width : 500px;
    	height : auto;
    	font-size : 20px;
    }
    

    th, td {
        border: 1px solid lightgray;
        padding : 6px;
     }

    label {
        margin-left: 10px;
    }

  	h1 {
	    text-align : center;
	    color : #00a5db;
	    margin-top : 60px;
   	}


    h2 {
        padding : 5px;
    }

    #pwdUpdate {
        background-color: rgb(57, 133, 247);
        color : white;
        border : none;
        border-radius: 3px;
        width : 150px;
        height : 32px;
        font-size : 18px;
    }

    .btnArea button{
        margin-top : 20px;
        border : none;
        border-radius: 3px;
    }

    #update{
        height : 40px;
        width : 60px;
        margin-right: 20px;
        background-color: rgb(57, 133, 247);
        color : white;
        font-size : 20px;
    }

    #cancel {
        height : 40px;
        width : 60px;
        font-size : 20px;
        
    }

    #withdrawal {
        height : 40px;
        width : 160px;
        font-size : 20px;
        color : darkgray;
        border : none;
        border-radius: 3px;
        margin-top : 20px;
        margin-left : -20px;
    }
    
    #userId {
    	display : invisible;
    }
    
    #modify th {
    	text-align : left;
    	font-width : bold;
    	background: #f8f8f8;
        padding-left: 20px;
    }
    
     #modify td {
        padding-left: 20px;
    }
    
    input {
    	height : 25px;
   		width : 200px;
   		font-size : 15px;
    }
    
    #p1 {
    	font-size : 15px;
    	margin-top : 5px;
    	margin-bottom : -5px;
    }
    </style>
</head>
<body>
<body>
<jsp:include page="../common/menubar.jsp"/>
    
    <div class="outer">

	   <%--  <div class="menuArea" align="center">
	     <table id="menu">
	         <tr>
	             <td class="menu mp" onclick="location.href='${ contextPath }/mypage/update'">개인 정보 수정</td>
	             <td class="menu re" onclick="location.href='${ contextPath }/mypage/reservation'">예약 내역 확인</td>
	             <td class="menu coun" onclick="location.href='${ contextPath }/mypage/counsel'">1:1 전문의 상담</td>
	         </tr>
	     </table>
	    </div>
 --%>
        <div class="tableArea" align="center">
            <h1 align="center">회원 정보 수정</h1>
            
            <form class="updateForm" action="${ contextPath }/mypage/update" method="post">
            
            <table id="modify" align="center">
                <tr>
                    <th width="40%" height="40px"><span class="s">* </span>아이디</th>
                    <td><input type="text" name="id" id="userId" value="${ loginUser.userId }"
                    	style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" readonly></td>
                </tr>
                <tr>
                    <th width="40%" height="40px"><span class="s">* </span>비밀번호</th>
                    <td><button id="pwdUpdate" type="button" onclick="pwdChange();">비밀번호 수정</button></td>
                </tr>
                <tr>
                    <th width="40%" height="40px"><span class="s">* </span>이름</th>
                    <td><input type="text" name="userName" id="userName" value="${ loginUser.userName }"></td>
                </tr>
                <tr>
                    <th width="40%" height="40px"><label>성별</label></th>
                    <td><input type="text" name="gender" id="gender" value="${ loginUser.gender }"></td>
                </tr>
                 <tr>
                    <th width="40%" height="40px"><label>생년월일</label></th>
                    <td><input type="text" name="birth" id="birth" value="${ loginUser.birth }"></td>
                </tr>
                 <tr>
                    <th width="40%" height="40px"><label>연락처</label></th>
                    <td><input type="text" id="phone" name="phone" value="${ loginUser.phone }">
                    <p id="p1">'-'는 제외하여 입력해주세요.</p></td>
				</tr>
                 <tr>
                    <th width="40%" height="40px"><span class="s">* </span>이메일</th>
                    <td><input type="text" id="email" name="email" value="${ loginUser.email }"></td>
                </tr>
                  
            </table>
        
            <div class="btnArea" align="center">
                <button id="update">수정</button>
           </div>
            </form>
            <button id="withdrawal" onclick="location.href='${contextPath}/mypage/delete'">회원탈퇴</button>
   		</div>
   </div>
   
   <script>
   	function pwdChange() {
   		window.open("${ contextPath }/mypage/pwdUpdate", "비밀번호 변경", "width=350, height=400, left=600");
   	}
   </script>

<jsp:include page="../common/footer.jsp"/>
 
</body>

</html>