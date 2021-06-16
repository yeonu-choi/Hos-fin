<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<title>KH대학병원</title>
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
        <p id="top-t">비밀번호 찾기</p>
        <p id="top-s">비밀번호를 잊으셨나요? 회원 정보에 등록한 이메일 또는 휴대폰 번호를 통해 비밀번호 재설정 또는 임시 비밀번호 재발급을 받을 수 있습니다.</p>
    </div>
    <div id="fpArea">
        <div class="fp pwd1">
            <div class="title">
            <img src="${contextPath}/resources/images/pwd1.jpg"><span>이메일 계정으로 임시 비밀번호 발급</span>
            </div>
            <form id="tempPwForm" action="${ contextPath }/member/tempPw" method="post">
            <table class="vTable" style="border-collapse:collapse" align="center">
                <tr>
                    <td align="center" colspan="2">
                        <input type="text" id="userId" name="userId" placeholder="아이디 입력">
                    </td>
                </tr> 
                <tr>
                    <td align="center">
                        <input type="text" id="userName" name="userName" placeholder="이름 입력">
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <input type="email" id="email" name="email" placeholder="이메일 계정 입력">
                        <button class="sendBtn" id="vbtn1" type="button" onclick="temporaryPw();">비밀번호 발급</button>
                    </td>
                </tr>
                </table>
                </form>
                <div class="btns">
                    <button id="goLogin" type="button" onclick="location.href='${contextPath}/member/login'">로그인하러 가기</button>
                </div>
        </div>
        <script>
	    function temporaryPw(){
	    	var frm = document.getElementById("tempPwForm");
	    	var userId = document.getElementById("userId").value;
	        var userName = document.getElementById("userName").value;
	        var email = document.getElementById("email").value;
	    	
	        if(userId == ""){
				alert('아이디를 입력해주세요.');
				return;
			} else if(userName == ""){
				alert('이름을 입력해주세요.');
				return;
			} else if(email == ""){
				alert('이메일 주소를 입력해주세요.');
				return;
			}else {
				frm.submit();
			}
	    }
    	</script>
        <div class="fp pwd2">
            <div class="title">
            <img src="${contextPath}/resources/images/pwd2.jpg"><span>휴대폰 인증을 통한 비밀번호 재설정</span>
            </div>
            <form id="resetPwForm" action="${ contextPath }/member/resetPw" method="post">
            <table class="vTable" style="border-collapse:collapse" align="center">
                <tr>
                    <td align="center" colspan="2">
                        <input type="text" id="userId2" name="userId" placeholder="아이디 입력">
                    </td>
                </tr> 
                <tr>
                    <td align="center" class="second">
                        <input type="tel" id="phone" name="phone" placeholder="휴대폰 번호 입력">
                        <button class="verifyBtn" id="vbtn2" type="button">인증번호 받기</button>
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
                	<input type="hidden" name="text" id="realNo">
                    <button id="goReset" type="button">비밀번호 재설정 하기</button>
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
             alert("아이디를 입력해주세요");
          } else if(phone == "" || phone == null){
            alert("휴대폰 번호를 입력해주세요");
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
                		  alert("인증번호를 발송했습니다");
                	  };
                	  
                	  if(data.nullMember != null){
                		  alert("해당하는 회원이 없습니다.\\n 휴대폰 번호를 확인해주세요.");
                	  };

                	  if(data.fail != null){
                		  alert("인증번호 발송에 실패하였습니다.");
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
    			alert('아이디를 입력해주세요.');
    		} else if($('#phone').val()==""){
    			alert('휴대폰 번호를 입력해주세요.');
    		} else if($('#verifyNo').val()==""){
    			alert('인증번호를 입력해주세요.');
    		} else {
    			if(userNum.trim() == sysNum.trim()){
    				alert('인증되었습니다.');
    				frm.submit();
    			} else {
    				alert('인증번호가 일치하지 않습니다.');
    			}			
    		}
    	});
    	</script>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>