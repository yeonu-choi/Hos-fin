<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>KH대학병원</title>
    <style>
        #cArea {
            position: relative;
            width: 100%;
            text-align: center;
        }

        #vTable {
            width: 100%;

        }

        #cTitle { 
            margin-top: 30px;
            font-size: 26px;
            font-weight: 600;
            color: #00a5db;
            margin-bottom: 10px;
            }

        #cSub { 
            font-size: 17px;
            color: #929292;
            margin-top: 5px;
            }

        .vTable tr:not(:first-child) td { padding-top: 10px;}

        #userName, #verifyNo {
            width: 200px; 
            height: 40px;
            background: #f5f5f5;
            border: none;
            padding-left: 20px;
            font-size: 14px;
        }

        #email {
            width: 150px; 
            height: 40px;
            background: #f5f5f5;
            padding-left: 20px;
            border: none;
            font-size: 14px;
            padding-bottom: 0;
        }

        .verifyBtn {
            width: 50px; 
            height: 40px; 
            margin-left: -5px;
            border: none;
            background: #bdbdbd;
            color: white;
            font-weight: 600;
            cursor: pointer;
        }

        .btns { margin-top: 20px;}
        
        #goJoin {
            width: 120px;
            height: 40px;
            border: none;
            background: #bdbdbd;
            color: white;
            font-weight: 600;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>

	<c:if test="${ !empty msg }">
		<script>alert('${msg}');</script>
		<c:remove var="msg"/>
	</c:if>
	
	<c:if test="${ !empty verifyNo }">
		<c:set var="vNum" value="${ verifyNo }"/>
	</c:if>
	
    <div id="cArea">
        <p id="cTitle">이메일 인증</p>
        <p id="cSub">고객님의 이메일로 전송된 인증번호를 입력해주세요.</p>
        <form action="${ contextPath }/member/sendMail" method="post">
        <table class="vTable" style="border-collapse:collapse" align="center">
            <tr>
                <td align="center" colspan="2">
                    <input type="text" id="userName" name="userName" placeholder="이름 입력"
                    <c:if test="${!empty userName}">value='${ userName }'</c:if>>
                </td>
            </tr> 
            <tr>
                <td align="center" class="second">
                    <input type="email" id="email" name="email" placeholder="이메일 주소 입력"
                    <c:if test="${!empty email}">value='${email}'</c:if>>
                    <button type="submit" class="verifyBtn" id="vbtn2">발송</button>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <input type="text" id="verifyNo" placeholder="인증번호 입력">
                </td>
            </tr>
            </table>
            </form>
            <div class="btns">
                <button id="goJoin">인증하기</button>
            </div>
    </div>
    <script>
    $(document).on('click', '#goJoin', function(){
		
		var userNum = $("#verifyNo").val();
	    var sysNum = "${vNum}"; 
	    
		if($('#userName').val()==""){
			alert('이름을 입력해주세요.');
		} else if($('#email').val()==""){
			alert('이메일 주소를 입력해주세요.');
		} else if(userNum ==""){
			alert('인증번호를 입력해주세요.');
		} else {
			if(userNum.trim() == sysNum){
				alert('인증되었습니다.');
				$(opener.document).find('#un').val($('#userName').val());
        		$(opener.document).find('#in3').val($('#email').val());
        		window.close();
			} else {
				alert('인증번호가 일치하지 않습니다.');
			}			
		}
	});
    </script>
</body>
</html>