<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        height: 20%;
        width: 100%;
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
        padding-bottom: 30px;
        border-bottom: 2px solid #e3e3e3;
    }

    #cArea {
        text-align: center;
        margin-top: 70px;
        width: 100%;
    }

    #cTitle {
        font-size: 26px;
        font-weight: 600;
        color: #404040;
        margin-bottom: 10px;
    }

    #cSub {
        font-size: 17px;
        color: #929292;
        margin-top: 5px;
    }

    #verifyBtn {
        width: 10%;
        height: 45px;
        background: white;
        border: 1px solid #929292;
        color: #404040;
        font-size: 19px;
        font-weight: 600;
        cursor: pointer;
    }

    .joinArea {
        width: 100%;
        position: relative;
        margin-bottom: 200px;
    }

    #join {
        margin-top: 35px;
        width: 80%;
    }

    #in1, #in2 { margin-top: 18px; }
    
    #in3 { margin-top: 7px;}

    #un { margin-top: 5px;}

    #join input { 
        width: 200px; 
        height: 28px;
        }
    
    .innerText { 
        margin-top: 5px; 
        font-size: 14px; 
        }
    
    .empa {
        color : #699be4; 
        font-size: 21px; 
        font-weight: 600;
        }
   
    #join tr:first-child { border-top: 3px solid #09a4dd;}
    #join tr:not(:last-child) { border-bottom: 1px solid #cfcece; }
    #join tr:last-child { border-bottom: 3px solid #e9e9e9;}
    
    #join th { 
        text-align: right; 
        font-weight: 500; 
        background: #f8f8f8;
        padding-right: 20px;
        }
    
    #join td { padding-left : 15px; }
    select { width: 130px; height: 30px; }
    
    .btns { 
        width: 100%;
        margin-top: 50px;
        text-align: center;
         }
    
    #joinBtn {
        width: 110px;
        height: 50px;
        color: white;
        border: none;
        background: #319cee;
        border-radius: 5px;
        font-size: 14px;
        font-weight: 600;
        cursor: pointer;
    }

    #backBtn {
        width: 90px;
        height: 50px;
        background: #f8f8f8;
        font-size: 14px;
        font-weight: 600;
        border: 1px solid #dddddd;
        border-radius: 5px;
        cursor: pointer;
    }

    #un, #in3 {
        border: none;
    }

    #un::placeholder, #in3::placeholder {
        color: black;
        font-size: 14px;
    }
    
    #in3:focus, #un:focus { outline:none; }
    
    #idChk{
        margin-left : 15px;
        background: #e9e9e9;
        font-size: 14px;
        font-weight: 600;
        border: 1px solid #b8b8b8;
        border-radius: 5px;
        cursor: pointer;
        width: 150px;
        height: 34px;
    }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
    <div id="top">
        <p id="top-t">회원가입</p>
        <p id="top-s">KH대학병원의 회원이 되시면 진료 예약, 
            증명서 발급, 사전 상담 등 다양한 서비스를 받으실 수 있습니다.</p>
    </div>
    <div id="cArea">
        <p id="cTitle">이메일 인증</p>
        <p id="cSub">고객님 입력한 이메일을 통해 인증 과정을 거치게 됩니다.</p>
        <button id="verifyBtn" onclick="showConfirm();">이메일 인증</button>
    </div>
    <div class="joinArea">
        <form class="joinForm" action="${ contextPath }/member/insert" method="post">
        <table id="join" style="border-collapse: collapse;" align="center">
            <tr>
                <th width="20%" height="80px"><span class="empa">* </span>아이디</th>
                <td><input type="text" id="in1" name="userId"><button type="button" id="idChk">아이디 확인</button><br>
                    <p class="innerText it1">아이디는 5~15자의 영어 소문자, 숫자만 사용 가능합니다.</p></td>
            </tr>
            <tr>
                <th width="20%" height="60px">이름</th>
                <td><input type="text" name="userName" id="un" placeholder="본인 인증 후 자동 입력됩니다." readonly></td>
            </tr>
            <tr>
                <th width="20%" height="80px"><span class="empa">* </span>비밀번호</th>
                <td><input type="password" id="in2" name="userPwd" style="IME-MODE: disabled"><br>
                    <p class="innerText">영문, 숫자, 특수문자 모두 포함, 최소 8자 ~ 최대 20자를 입력하세요.</p></td>
            </tr>
            <tr>
                <th width="20%" height="60px"><span class="empa">* </span>비밀번호확인</th>
                <td><input type="password" name="pwd2" id="pwd2" style="IME-MODE: disabled"></td>
            </tr>
            <tr>
                <th width="20%" height="60px">성별</th>
                <td>
                   <select id="gender" name="gender">
                        <option>남자</option>
                        <option>여자</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th width="20%" height="60px">생년월일</th>
                <td>
                    <select id="year" name="year" onchange="javascript:lastday();"></select>
                    <select id="month" name="month" onchange="javascript:lastday();"></select>
                    <select id="days" name="days"></select>
                </td>
            </tr>
            <tr>
                <th width="20%" height="60px">휴대폰번호</th>
                <td><input type="tel" name="phone"></td>
            </tr>
            <tr>
                <th width="20%" height="60px"><span class="empa">* </span>이메일</th>
                <td><input type="email" id="in3" name="email"  placeholder="본인 인증 후 자동 입력됩니다." readonly></td>
            </tr>
        </table>
        <script>
            function showConfirm(){
            	var popupWidth = 450;
            	var popupHeight = 400;

            	var left = (screen.availWidth - popupWidth) / 2;
            	if( window.screenLeft < 0){
            	left += window.screen.width*-1;
            	}
            	else if ( window.screenLeft > window.screen.width ){
            	left += window.screen.width;
            	}

            	var top = (screen.availHeight - popupHeight) / 2 - 10;

            	var options = 'resizable=no,left=' + left + ',top=' + top +', width=' + popupWidth+ ',height=' + popupHeight;

            	window.open("${ contextPath }/member/confirm2","이메일인증", options);
            }
            

            var sy="1920";
            var today = new Date(); 
            var ty= today.getFullYear(); 
            var index=0; 
            
            for(var y=sy;  y<=ty; y++){ 
            document.getElementById('year').options[index] = new Option(y, y); 
            index++; 
            } 
            index=0; 
            for(var m=1; m<=12; m++){ 
            document.getElementById('month').options[index] = new Option(m, m); 
            index++; 
            } 
            lastday(); 
            
            function lastday(){
            var Year=document.getElementById('year').value;
            var Month=document.getElementById('month').value; 
            var day=new Date(new Date(Year,Month,1)-86400000).getDate(); 
            var dayindex_len=document.getElementById('days').length; 
            
            if(day>dayindex_len){ 
                for(var i=(dayindex_len+1); i<=day; i++){ 
            document.getElementById('days').options[i-1] = new Option(i, i);
                } 
            } else if(day<dayindex_len){ 
            for(var i=dayindex_len; i>=day; i--){ 
            document.getElementById('days').options[i]=null; 
                    } 
                } 
            } 
        </script>
        <div class="btns">
        <button type="button" id="joinBtn">가입신청</button>
        <button type="button" id="backBtn" onclick="location.href='${contextPath}/'">취소</button>
        </div>
    </form>
    <script>
		    $("#idChk").click(function() {
		    	var userId =  $("#in1").val(); 
		    	var num = userId.search(/[0-9]/g);
		    	var eng = userId.search(/[a-z]/ig);
		    	
		    	if(Number(userId)){
		    	    $(".it1").html("아이디는 숫자만 사용할 수 없습니다.");
                	$(".it1").css({"color": "red"});
                    $("#in1").focus();
		    	} else if(!/^[a-zA-Z]/.test(userId)){
		    	    $(".it1").html("아이디는 영문으로 시작해야 합니다.");
                	$(".it1").css({"color": "red"});
                	$("#in1").focus();
		    	} else if(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/.test(userId)){
		    	    $(".it1").html("아이디 안에 한글은 포함될 수 없습니다.");
                	$(".it1").css({"color": "red"});
                	$("#in1").focus();
		    	} else if(userId.length < 5){
		    		$(".it1").html("5자리 ~ 15자리 이내로 입력해주세요.");
                	$(".it1").css({"color": "red"});
                	$("#in1").focus();
		    	} else if(userId.length > 15){
		    		$(".it1").html("5자리 ~ 15자리 이내로 입력해주세요.");
                	$(".it1").css({"color": "red"});
                	$("#in1").focus();
		    	} else if(userId.search(/\s/) != -1){
		    		$(".it1").html("아이디는 공백 없이 입력해주세요.");
                	$(".it1").css({"color": "red"});
                	$("#in1").focus();
		    	} else if(num < 0 || eng < 0){
		    		$(".it1").html("영문,숫자를 혼합하여 입력해주세요.");
                	$(".it1").css({"color": "red"});
                	$("#in1").focus();
		    	} else {
		    		$.ajax({
    		            type : 'POST',
    		            data : userId,
    		            url : "idCheck",
    		            dataType : "json",
    		            contentType: "application/json; charset=UTF-8",
    		            success : function(data) {
    		                if (data.cnt > 0) {
    		                	$(".it1").html("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
    		                	$(".it1").css({"color": "red"});
    		                	$("#in1").focus();
    		                } else {
    		                	$(".it1").html("사용 가능한 아이디입니다.");
    		                	$(".it1").css({"color": "#319cee"});
    		                	$("#in2").focus();
    		                }
    		            },
    		            error : function(e) {
    		                console.log(e);
    		            }
    		        });
		    	}
		    });
		    
		    $("#joinBtn").click(function() {
		    	var pwd1 = $("#in2").val();
		    	var pwd2 = $("#pwd2").val();
		    	var idchk = $(".it1").text();
		    	var num = pwd1.search(/[0-9]/g);
		    	var eng = pwd1.search(/[a-z]/ig);
		    	var spe = pwd1.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		    	
		    	if($('#in1').val()==""){
	    			alert('아이디를 입력해주세요.');
	    		} else if(idchk == "아이디는 5~15자의 영어 소문자, 숫자만 사용 가능합니다."){
	  				alert('아이디 확인을 진행해주세요.')
	    		} else if(pwd1 == ""){
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
		    	} else if($('#phone').val()==""){
	    			alert('휴대폰 번호를 입력해주세요.');
	    		} else if($('#email').val()==""){
	    			alert('이메일 인증을 해주세요.');
	    		} else if($('#un').val()==""){
	    			alert('이메일 인증을 진행해주세요.');
	    		} else {
		    		$(".joinForm").submit();
		    	}
		    });
    </script>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>