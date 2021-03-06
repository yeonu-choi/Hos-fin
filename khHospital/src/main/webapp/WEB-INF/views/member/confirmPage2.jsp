<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<title>KHëíë³ì</title>
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
        <p id="cTitle">ì´ë©ì¼ ì¸ì¦</p>
        <p id="cSub">ê³ ê°ëì ì´ë©ì¼ë¡ ì ì¡ë ì¸ì¦ë²í¸ë¥¼ ìë ¥í´ì£¼ì¸ì.</p>
        <form action="${ contextPath }/member/sendMail" method="post">
        <table class="vTable" style="border-collapse:collapse" align="center">
            <tr>
                <td align="center" colspan="2">
                    <input type="text" id="userName" name="userName" placeholder="ì´ë¦ ìë ¥"
                    <c:if test="${!empty userName}">value='${ userName }'</c:if>>
                </td>
            </tr> 
            <tr>
                <td align="center" class="second">
                    <input type="email" id="email" name="email" placeholder="ì´ë©ì¼ ì£¼ì ìë ¥"
                    <c:if test="${!empty email}">value='${email}'</c:if>>
                    <button type="submit" class="verifyBtn" id="vbtn2">ë°ì¡</button>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <input type="text" id="verifyNo" placeholder="ì¸ì¦ë²í¸ ìë ¥">
                </td>
            </tr>
            </table>
            </form>
            <div class="btns">
                <button id="goJoin">ì¸ì¦íê¸°</button>
            </div>
    </div>
    <script>
    $(document).on('click', '#goJoin', function(){
		
		var userNum = $("#verifyNo").val();
	    var sysNum = "${vNum}"; 
	    
		if($('#userName').val()==""){
			alert('ì´ë¦ì ìë ¥í´ì£¼ì¸ì.');
		} else if($('#email').val()==""){
			alert('ì´ë©ì¼ ì£¼ìë¥¼ ìë ¥í´ì£¼ì¸ì.');
		} else if(userNum ==""){
			alert('ì¸ì¦ë²í¸ë¥¼ ìë ¥í´ì£¼ì¸ì.');
		} else {
			if(userNum.trim() == sysNum){
				alert('ì¸ì¦ëììµëë¤.');
				$(opener.document).find('#un').val($('#userName').val());
        		$(opener.document).find('#in3').val($('#email').val());
        		window.close();
			} else {
				alert('ì¸ì¦ë²í¸ê° ì¼ì¹íì§ ììµëë¤.');
			}			
		}
	});
    </script>
</body>
</html>