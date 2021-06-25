<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<style>
   h2 {
      text-align : center;
      color : #00a5db;
      padding-top : 20px;
   }
   
   table{
      margin:auto;
   }
   
   td {
      text-align:right;
   }
   
   input {
   	height : 25px;
   	width : 200px;
   	margin : 4px;
   }
   
   input::placeholder {
   	text-align : center;
   	font-size : 15px;
   }
   
   button:hover {
      cursor:pointer
   }
   
   button {   
      width:120px;
      height:40px;
      color:white;
      background:rgb(57, 133, 247);
      border:none;
      border-radius:5px;
      font-size : 18px;
   }
   
   #cancelBtn {
   	  background:lightgray;
   	  color : black;
   	  margin-left : 10px;
   }
   
</style>
</head>
<body>
	<h2>비밀번호 변경</h2>
	<span align="center">
		<p>비밀번호는 8~20자 이내<br>영문, 숫자, 특수문자 중 2가지 이상 포함</p> 
	</span>
	
	<form id="pwdUpdate">
	<table>
		<tr>
			<td><input type="password" name="userPwd" id="userPwd" maxlength="20" placeholder="현재 비밀번호"></td>
		</tr>
		<tr>
			<td><input type="password" name="newPwd" id="newPwd" maxlength="20" placeholder="새 비밀번호"></td>
		</tr>
		<tr>
			<td><input type="password" name="newPwd2" id="newPwd2" maxlength="20" placeholder="새 비밀번호 확인"></td>
		</tr>
	</table>
	
	<br><br>
	<div class="btn" align="center">
		<button id="pwdUpdateBtn" type="button">변경</button>
		<button id="cancelBtn" onclick="window.close()">취소</button>
	</div>
	</form>
	
	<script>
		$("#pwdUpdateBtn").click(function(){
			var userPwd = $("#userPwd").val();
			var newPwd = $("#newPwd").val();
			var newPwd2 = $("#newPwd2").val();
	    	var eng = newPwd.search(/[a-z]/ig);
	    	var num = newPwd.search(/[0-9]/g);
	    	var sc = newPwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	    
	    	if(userPwd == "") {
	    		alert('현재 비밀번호를 입력해주세요.');
	    	 	$("#userPwd").focus();
	    	} else if(newPwd == "") {
	    		alert('새 비밀번호를 입력해주세요.');
	    		$("#newPwd").focus();
	    	} else if(newPwd2 == "") {
	    		alert('새 비밀번호 확인을 입력해주세요.');
	    		$("#newPwd2").focus();
	    	} else if(newPwd.length < 8) {
	    		alert('비밀번호는 8자 이상 20자 이하로 입력해주세요.');
	    		$("#newPwd").focus();
	    	} else if(newPwd.search(/\s/) != -1) {
	    		alert('비밀번호에는 공백이 포함될 수 없습니다.');
	    		$("#newPwd").focus();
	    	} else if(num < 0 && eng < 0 || num < 0 && sc < 0 || sc < 0 && eng < 0) {
	    		alert('비밀번호에는 영문, 숫자, 특수문자 중 2가지 이상 포함해야 합니다.');
	    		$("#newPwd").focus();
	    	} else if(newPwd != newPwd2) {
	    		alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요.');
	    	 	$("#newPwd").focus();
	    	} else {
	    		$.ajax({
	    			url : "${contextPath}/mypage/pwdUpdate",
	    			data : {userPwd:userPwd, newPwd:newPwd},
	    			type : "POST",
	    			success : function(data){
	    				console.log(data);
	    				if(data == "confirm") {
	    					alert('비밀번호가 변경되었습니다. 다시 로그인해 주세요.');
	    					window.opener.location.href="${contextPath}/member/login"; 
	    		    		window.close();
	    		    		
	    				} else {
	    					alert('현재 비밀번호가 일치하지 않습니다.');
	    					$("#userPwd").focus();
	    				}
	    			},
	    			error : function(e){
	    				console.log(e);
	    			}
	    		});
	   	
	    	}
	    		
		})
	</script>
	
	
</body>
</html>