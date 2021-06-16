<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        border-bottom: 2px solid #e3e3e3;
        padding-bottom: 30px;
        margin-bottom: 30px;
    }

    #fpArea { 
        width: 100%;
        height: 570px;
        position: relative;
        text-align: center;
    }

    .fpTitle {
        font-size: 17px;
        font-weight: 600;
        color: #8d8d8d;
    }

    .f1 {
        margin-top: 70px; 
        margin-bottom: 0;
     }

    .f2 { margin-top: 10px;}
    .f3 {margin-top: -7px;}
    
    #rTable { width: 50%; margin-top: 50px;}
    #newPwd, #confirm { 
        width: 400px; 
        height: 60px;
        padding-left: 20px;
        font-size: 15px;
        background: #f5f5f5;
        border: none;
        }
    
    #newPwd::placeholder, #confirm::placeholder {
        color: #bbbaba;
        font-weight: 600;
    }

    #confirm { margin-top: 20px;}

    #resetBtn { 
        width: 420px; 
        height: 60px; 
        margin-top: 60px;
        background: #bdbdbd;
        border: none;
        color: white;
        font-size: 18px;
        font-weight: 600;
        cursor: pointer;
        } 
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
    <div id="top">
        <p id="top-t">비밀번호 재설정</p>
    </div>
    <div id="fpArea">
        <p class="fpTitle f1">새로운 비밀번호를 입력해주세요.</p>
        <p class="fpTitle f2">8~20자 이내의 영어, 숫자, 특수 문자 모두 포함.</p>
        <p class="fpTitle f3">첫글자는 영어로 시작해야 하며 공백은 자동 제거됩니다.</p>
        <form id="resetPw2Form" action="${ contextPath }/member/resetPw2" method="post">
        <table id="rTable" style="border-collapse:collapse" align="center">
        <tr>
            <td align="center" colspan="2">
                <input type="password" id="newPwd" name="userPwd" 
                placeholder="새로운 비밀번호" onkeyup="deleteBlank(this);">
            </td>
        </tr> 
        <tr>
            <td align="center" colspan="2">
                <input type="password" id="confirm" placeholder="비밀번호 확인" onkeyup="deleteBlank(this);">
            </td>
        </tr>
        </table>
        <div class="btns">
        	<input type="hidden" name="phone" id="phone" value="${phone}">
        	<input type="hidden" name="userId" id="userId" value="${userId}">
            <button id="resetBtn" type="button">재설정하기</button>
        </div>
        </form>
    </div>
    <script>
	    function deleteBlank(e){
	        var a = e.val().replace(/ /gi, '');
	        e.val(a);
	    }
	    
	    $("#resetBtn").click(function() {
	    	var pwd1 = $("#newPwd").val();
	    	var pwd2 = $("#confirm").val();
	    	var num = pwd1.search(/[0-9]/g);
	    	var eng = pwd1.search(/[a-z]/ig);
	    	var spe = pwd1.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	    	
			if(pwd1 == ""){
    			alert('비밀번호를 입력해주세요.');
    		} else if(pwd2 == ""){
    			alert('비밀번호를 확인해주세요.');
    		} else if(pwd1.length < 8){
    			alert('비밀번호는 8자 이상 20자 이하여야 합니다.');
    		} else if(pwd1.length > 20){
    			alert('비밀번호는 8자 이상 20자 이하여야 합니다.');
    		} else if(pwd1.search(/\s/) != -1){
    			alert('비밀번호에는 공백을 입력할 수 없습니다.');
    		} else if(num < 0 || eng < 0 || spe < 0 ){
    			alert('비밀번호는 영문, 숫자, 특수문자를 혼합하여 입력해주세요.');
    		} else if(pwd1 != pwd2){
	    		alert('비밀번호가 일치하지 않습니다. 비밀번호를 확인해주세요.');
    		} else {
	    		$("#resetPw2Form").submit();
	    	}
	    });
    </script>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>