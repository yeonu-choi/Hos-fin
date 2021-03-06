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

    #fpArea { 
        width: 100%;
        position: relative;
        text-align: center;
        margin-top: 100px;
        }
    
    .fp { 
        width: 35%; 
        float:left;
        height: 530px;
        border: 2px solid #e1e0e0;
        margin-bottom: 170px;
        }
    
    .pwd1 { margin-left: 15%; border-right: none;}
    
    #fpArea img { height: 80px;}

    .title { 
        width: 80%;
        margin-top: 30px;
        display: table;
        margin-left: 8.5%;
        }
    
    .title span { 
        display: table-cell; 
        vertical-align: middle;
        font-size: 23px;
        font-weight: 600;
        color: #01aad5;
        }
    
    .vTable tr:first-child td { padding-top: 40px; }
    .vTable tr:not(:first-child) td { padding-top: 20px;}

    #userId, #userName, #userId2, #verifyNo {
        width: 400px; 
        height: 60px;
        background: #f5f5f5;
        border: none;
        padding-left: 20px;
        font-size: 14px;
    }

    #email, #phone {
        width:300px; 
        height: 60px;
        background: #f5f5f5;
        padding-left: 20px;
        border: none;
        font-size: 14px;
        padding-bottom: 0;
    }

    .verifyBtn, .sendBtn {
        width: 100px; 
        height: 60px; 
        margin-left: -5px;
        border: none;
        background: #bdbdbd;
        color: white;
        font-weight: 600;
        cursor: pointer;
    }

    .btns { margin-top: 40px;}

    #goReset, #goLogin {
        width: 420px;
        height: 60px;
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
	<c:if test="${ !empty verifyNo }">
	<c:set var="vNum" value="${ verifyNo }"/>
	</c:if>
	
	<jsp:include page="../common/menubar.jsp"/>
		
    <div id="top">
        <p id="top-t">ë¹ë°ë²í¸ ì°¾ê¸°</p>
        <p id="top-s">ë¹ë°ë²í¸ë¥¼ ìì¼ì¨ëì? íì ì ë³´ì ë±ë¡í ì´ë©ì¼ ëë í´ëí° ë²í¸ë¥¼ íµí´ ë¹ë°ë²í¸ ì¬ì¤ì  ëë ìì ë¹ë°ë²í¸ ì¬ë°ê¸ì ë°ì ì ììµëë¤.</p>
    </div>
    <div id="fpArea">
        <div class="fp pwd1">
            <div class="title">
            <img src="${contextPath}/resources/images/pwd1.jpg"><span>ì´ë©ì¼ ê³ì ì¼ë¡ ìì ë¹ë°ë²í¸ ë°ê¸</span>
            </div>
            <form id="tempPwForm" action="${ contextPath }/member/tempPw" method="post">
            <table class="vTable" style="border-collapse:collapse" align="center">
                <tr>
                    <td align="center" colspan="2">
                        <input type="text" id="userId" name="userId" placeholder="ìì´ë ìë ¥">
                    </td>
                </tr> 
                <tr>
                    <td align="center">
                        <input type="text" id="userName" name="userName" placeholder="ì´ë¦ ìë ¥">
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <input type="email" id="email" name="email" placeholder="ì´ë©ì¼ ê³ì  ìë ¥">
                        <button class="sendBtn" id="vbtn1" type="button" onclick="temporaryPw();">ë¹ë°ë²í¸ ë°ê¸</button>
                    </td>
                </tr>
                </table>
                </form>
                <div class="btns">
                    <button id="goLogin" type="button" onclick="location.href='${contextPath}/member/login'">ë¡ê·¸ì¸íë¬ ê°ê¸°</button>
                </div>
        </div>
        <script>
	    function temporaryPw(){
	    	var frm = document.getElementById("tempPwForm");
	    	var userId = document.getElementById("userId").value;
	        var userName = document.getElementById("userName").value;
	        var email = document.getElementById("email").value;
	    	
	        if(userId == ""){
				alert('ìì´ëë¥¼ ìë ¥í´ì£¼ì¸ì.');
				return;
			} else if(userName == ""){
				alert('ì´ë¦ì ìë ¥í´ì£¼ì¸ì.');
				return;
			} else if(email == ""){
				alert('ì´ë©ì¼ ì£¼ìë¥¼ ìë ¥í´ì£¼ì¸ì.');
				return;
			}else {
				frm.submit();
			}
	    }
    	</script>
        <div class="fp pwd2">
            <div class="title">
            <img src="${contextPath}/resources/images/pwd2.jpg"><span>í´ëí° ì¸ì¦ì íµí ë¹ë°ë²í¸ ì¬ì¤ì </span>
            </div>
            <form id="resetPwForm" action="${ contextPath }/member/resetPw" method="post">
            <table class="vTable" style="border-collapse:collapse" align="center">
                <tr>
                    <td align="center" colspan="2">
                        <input type="text" id="userId2" name="userId" placeholder="ìì´ë ìë ¥">
                    </td>
                </tr> 
                <tr>
                    <td align="center" class="second">
                        <input type="tel" id="phone" name="phone" placeholder="í´ëí° ë²í¸ ìë ¥">
                        <button class="verifyBtn" id="vbtn2" type="button">ì¸ì¦ë²í¸ ë°ê¸°</button>
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
                	<input type="hidden" name="text" id="realNo">
                    <button id="goReset" type="button">ë¹ë°ë²í¸ ì¬ì¤ì  íê¸°</button>
                </div>
        </div>
        <script> 
    	$(document).on('click', '#vbtn2', function(){
    		var number = Math.floor(Math.random() * 100000) + 100000;
            if(number>100000){
               number = number - 10000;
            }

            $("#realNo").val(number);
         
         var phone = $("#phone").val();
         var userId = $("#userId2").val();
         
         if(userId == "" || userId == null){
             alert("ìì´ëë¥¼ ìë ¥í´ì£¼ì¸ì");
          } else if(phone == "" || phone == null){
            alert("í´ëí° ë²í¸ë¥¼ ìë ¥í´ì£¼ì¸ì");
         } else {
                 $.ajax({
                     url:"resetPwSms",
                     type:"post",
                     data:{
                    	  userId: $("#userId2").val(),
                    	  phone: $("#phone").val(),
                          realNo: $("#realNo").val()
                          },
                   success:function(data){
                	  if(data.success != null){
                		  alert("ì¸ì¦ë²í¸ë¥¼ ë°ì¡íìµëë¤");
                	  };
                	  
                	  if(data.nullMember != null){
                		  alert("í´ë¹íë íìì´ ììµëë¤.\\n í´ëí° ë²í¸ë¥¼ íì¸í´ì£¼ì¸ì.");
                	  };

                	  if(data.fail != null){
                		  alert("ì¸ì¦ë²í¸ ë°ì¡ì ì¤í¨íììµëë¤.");
                	  };  
                     },
                     error : function(e){
     					console.log(e);
     				 }
                  });
               }
      	});
    		
    
    	$(document).on('click', '#goReset', function(){
    		var frm = $("#resetPwForm");
    		var userNum = $("#verifyNo").val();
    	    var sysNum = $("#realNo").val();    
    	    
    		if($('#userId2').val()==""){
    			alert('ìì´ëë¥¼ ìë ¥í´ì£¼ì¸ì.');
    		} else if($('#phone').val()==""){
    			alert('í´ëí° ë²í¸ë¥¼ ìë ¥í´ì£¼ì¸ì.');
    		} else if($('#verifyNo').val()==""){
    			alert('ì¸ì¦ë²í¸ë¥¼ ìë ¥í´ì£¼ì¸ì.');
    		} else {
    			if(userNum.trim() == sysNum.trim()){
    				alert('ì¸ì¦ëììµëë¤.');
    				frm.submit();
    			} else {
    				alert('ì¸ì¦ë²í¸ê° ì¼ì¹íì§ ììµëë¤.');
    			}			
    		}
    	});
    	</script>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>