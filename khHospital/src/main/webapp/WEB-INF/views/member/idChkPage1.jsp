<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<title>KHëíë³ì</title>
   <style>
        #top {
            margin-top: 80px;
            text-align: center;
        }

        #top-t {
            margin-left: 10%;
            width: 80%;
            color: #00a5db;
            font-size: 43px;
            font-weight: 600;
            margin-bottom: 0;
        }

        #top-s {
            margin-left: 10%;
            width: 80%;
            margin-top: 25px;
            color: #404040;
            font-size: 19px;
            font-weight: 600;
            border-bottom: 2px solid #e3e3e3;
            padding-bottom: 30px;
        }

        #fiArea { 
            width: 100%;
            position: relative;
            text-align: center;
        }

        .fiTitle {
            font-size: 16px;
            font-weight: 600;
            color: #8d8d8d;
        }

        .f1 {
            margin-top: 40px; 
            margin-bottom: 0;
         }
        
        .f2 {margin-top: 8px;}

        #vTable { 
            width: 50%; 
            margin-left: 25%;
            }
        
        
        #userName,#verifyNo {
            width: 400px; 
            height: 60px;
            background: #f5f5f5;
            border: none;
            padding-left: 20px;
            font-size: 14px;
            }
        
        #email {
            width:300px; 
            height: 60px;
            background: #f5f5f5;
            padding-left: 20px;
            border: none;
            font-size: 14px;
            padding-bottom: 0;
        }
        
        #verifyBtn {
            width: 100px; 
            height: 60px; 
            margin-left: -5px;
            border: none;
            background: #bdbdbd;
            color: white;
            font-weight: 600;
            cursor: pointer;
            }
        
        .btns {
            width: 100%;
            height: 80px;
            position: relative;
            text-align: center;
            margin-bottom : 180px;
        }

        #nextBtn {
            width: 420px;
            height: 60px;
            border: none;
            background: #bdbdbd;
            color: white;
            font-weight: 600;
            font-size: 16px;
            cursor: pointer;
        }

        #vTable tr:first-child td { padding-top: 40px; }
        #vTable tr:not(:first-child) td { padding-top: 20px;}

        .btns { margin-top: 40px;}
    </style>
</head>
<body>
	<c:if test="${ !empty verifyNo }">
	<c:set var="vNum" value="${ verifyNo }"/>
	</c:if>
	
	<jsp:include page="../common/menubar.jsp"/>
	
    <div id="top">
        <p id="top-t">ìì´ë ì°¾ê¸°</p>
        <p id="top-s">ìì´ëë¥¼ ìì¼ì¨ëì? ê°ì ì ìë ¥íì¨ë ì ë³´ë¥¼ ìë ¥í´ ìì´ëë¥¼ íì¸íì¤ ì ììµëë¤.</p>
    </div>
    <div id="fiArea">
        <p class="fiTitle f1">íìëì ì´ë©ì¼ ê³ì ì íì¸í´ì£¼ì¸ì.</p>
        <p class="fiTitle f2">ì¸ì¦ë²í¸ë¥¼ ì ì¡í´ëë¦½ëë¤.</p>
        <form id="idChkForm" action="${ contextPath }/member/idChkMail" method="post">
        <table id="vTable" style="border-collapse:collapse" align="center">
        <tr>
            <td align="center" colspan="2">
                <input type="text" id="userName" name="userName" placeholder="ì´ë¦ ìë ¥"
                <c:if test="${ !empty userName }">value="${ userName }"</c:if>>
            </td>
        </tr> 
        <tr>
            <td align="center" class="second">
                <input type="email" id="email" name="email" placeholder="ì´ë©ì¼ ê³ì  ìë ¥"
                <c:if test="${ !empty email }">value="${ email }"</c:if>>
                <button type="button" id="verifyBtn" onclick="submitChk();">ì¸ì¦ë²í¸ ë°ê¸°</button>
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
            <button type="button" id="nextBtn">ë¤ì</button>
        </div>
    </div>
    <script>
	    function submitChk(){
	    	var frm = document.getElementById("idChkForm");
	        var userName = document.getElementById("userName").value;
	        var email = document.getElementById("email").value;
	    	
	    	if(userName == ""){
				alert('ì´ë¦ì ìë ¥í´ì£¼ì¸ì.');
				return;
			} else if(email == ""){
				alert('ì´ë©ì¼ ì£¼ìë¥¼ ìë ¥í´ì£¼ì¸ì.');
				return;
			}else {
				frm.submit();
			}
	    }

		$(document).on('click', '#nextBtn', function(){			
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
						location.href="${contextPath}/member/idChk2?userName=${userName}&email=${email}";
					} else {
						alert('ì¸ì¦ë²í¸ê° ì¼ì¹íì§ ììµëë¤.');
					}			
				}
			});
    </script>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>