<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    #in1, #in2, #in3 { margin-top: 18px; }
    
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

    #ph, #un { border: none; }

    #ph::placeholder, #un::placeholder {
        color: black;
        font-size: 14px;
    }
    
    #ph:focus, #un:focus { outline:none; }
    
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
        <p id="top-t">íìê°ì</p>
        <p id="top-s">KHëíë³ìì íìì´ ëìë©´ ì§ë£ ìì½, 
            ì¦ëªì ë°ê¸, ì¬ì  ìë´ ë± ë¤ìí ìë¹ì¤ë¥¼ ë°ì¼ì¤ ì ììµëë¤.</p>
    </div>
    <div id="cArea">
        <p id="cTitle">ë³¸ì¸ì¸ì¦</p>
        <p id="cSub">ê³ ê°ë ëªìë¡ ë±ë¡ë í´ëí° ë²í¸ë¥¼ íµí´ ë³¸ì¸ ì¸ì¦ ê³¼ì ì ê±°ì¹ê² ë©ëë¤.</p>
        <button id="verifyBtn" onclick="showConfirm();">í´ëí° ì¸ì¦</button>
    </div>
    <div class="joinArea">
        <form class="joinForm" action="${ contextPath }/member/insert" method="post">
        <table id="join" style="border-collapse: collapse;" align="center">
            <tr>
                <th width="20%" height="80px"><span class="empa">* </span>ìì´ë</th>
                <td><input type="text" id="in1" name="userId"><button type="button" id="idChk">ìì´ë íì¸</button><br>
                    <p class="innerText it1">ìì´ëë 5~15ìì ìì´ ìë¬¸ì, ì«ìë§ ì¬ì© ê°ë¥í©ëë¤.</p></td>
            </tr>
            <tr>
                <th width="20%" height="60px">ì´ë¦</th>
                <td><input type="text" id="un" name="userName" placeholder="ë³¸ì¸ ì¸ì¦ í ìë ìë ¥ë©ëë¤." readonly></td>
            </tr>
            <tr>
                <th width="20%" height="80px"><span class="empa">* </span>ë¹ë°ë²í¸</th>
                <td><input type="password" id="in2" name="userPwd"><br>
                    <p class="innerText">ìë¬¸, ì«ì, í¹ìë¬¸ì ëª¨ë í¬í¨, ìµì 8ì ~ ìµë 20ìë¥¼ ìë ¥íì¸ì.</p></td>
            </tr>
            <tr>
                <th width="20%" height="60px"><span class="empa">* </span>ë¹ë°ë²í¸íì¸</th>
                <td><input type="password" id="pwd2" name="pwd2"></td>
            </tr>
            <tr>
                <th width="20%" height="60px">ì±ë³</th>
                <td>
                    <select id="gender" name="gender">
                        <option>ë¨ì</option>
                        <option>ì¬ì</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th width="20%" height="60px">ìëìì¼</th>
                <td>
                    <select id="year" name="year" onchange="javascript:lastday();"></select>
                    <select id="month" name="month" onchange="javascript:lastday();"></select>
                    <select id="days" name="days"></select>
                </td>
            </tr>
            <tr>
                <th width="20%" height="60px">í´ëí°ë²í¸</th>
                <td><input type="tel" id="ph" name="phone" placeholder="ë³¸ì¸ ì¸ì¦ í ìë ìë ¥ë©ëë¤." readonly></td>
            </tr>
            <tr>
                <th width="20%" height="80px"><span class="empa">* </span>ì´ë©ì¼</th>
                <td><input type="email" id="in3" name="email">
                    <p class="innerText">ì´ë©ì¼ ì£¼ìë ìì´ë@ìë¹ì¤ ííì´ì§ìëë¤. ì) kh_hospital@iei.or.kr</p></td>
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

            	window.open("${ contextPath }/member/confirm","ë³¸ì¸ì¸ì¦", options);
            }
            

            var sy="1925";
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
            
            var birth = Year + Month;
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
        <button type="button" id="joinBtn">ê°ìì ì²­</button>
        <button type="button" id="backBtn" onclick="location.href='${contextPath}/'">ì·¨ì</button>
        </div>
    </form>
    <script>
		    $("#idChk").click(function() {
		    	var userId =  $("#in1").val(); 
		    	var num = userId.search(/[0-9]/g);
		    	var eng = userId.search(/[a-z]/ig);
		    	
		    	if(Number(userId)){
		    	    $(".it1").html("ìì´ëë ì«ìë§ ì¬ì©í  ì ììµëë¤.");
                	$(".it1").css({"color": "red"});
                    $("#in1").focus();
		    	} else if(!/^[a-zA-Z]/.test(userId)){
		    	    $(".it1").html("ìì´ëë ìë¬¸ì¼ë¡ ììí´ì¼ í©ëë¤.");
                	$(".it1").css({"color": "red"});
                	$("#in1").focus();
		    	} else if(/[ã±-ã|ã-ã£|ê°-í]/.test(userId)){
		    	    $(".it1").html("ìì´ë ìì íê¸ì í¬í¨ë  ì ììµëë¤.");
                	$(".it1").css({"color": "red"});
                	$("#in1").focus();
		    	} else if(userId.length < 5){
		    		$(".it1").html("5ìë¦¬ ~ 15ìë¦¬ ì´ë´ë¡ ìë ¥í´ì£¼ì¸ì.");
                	$(".it1").css({"color": "red"});
                	$("#in1").focus();
		    	} else if(userId.length > 15){
		    		$(".it1").html("5ìë¦¬ ~ 15ìë¦¬ ì´ë´ë¡ ìë ¥í´ì£¼ì¸ì.");
                	$(".it1").css({"color": "red"});
                	$("#in1").focus();
		    	} else if(userId.search(/\s/) != -1){
		    		$(".it1").html("ìì´ëë ê³µë°± ìì´ ìë ¥í´ì£¼ì¸ì.");
                	$(".it1").css({"color": "red"});
                	$("#in1").focus();
		    	} else if(num < 0 || eng < 0){
		    		$(".it1").html("ìë¬¸,ì«ìë¥¼ í¼í©íì¬ ìë ¥í´ì£¼ì¸ì.");
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
    		                	$(".it1").html("ìì´ëê° ì¡´ì¬í©ëë¤. ë¤ë¥¸ ìì´ëë¥¼ ìë ¥í´ì£¼ì¸ì.");
    		                	$(".it1").css({"color": "red"});
    		                	$("#in1").focus();
    		                } else {
    		                	$(".it1").html("ì¬ì© ê°ë¥í ìì´ëìëë¤.");
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
		    	var spe = pwd1.search(/[`~!@@#$%^&*|â©â©â©'â©";:â©/?]/gi);
		    	
		    	if($('#in1').val()==""){
	    			alert('ìì´ëë¥¼ ìë ¥í´ì£¼ì¸ì.');
	    		} else if(idchk == "ìì´ëë 5~15ìì ìì´ ìë¬¸ì, ì«ìë§ ì¬ì© ê°ë¥í©ëë¤."){
	  				alert('ìì´ë íì¸ì ì§íí´ì£¼ì¸ì.')
	    		} else if(pwd1 == ""){
	    			alert('ë¹ë°ë²í¸ë¥¼ ìë ¥í´ì£¼ì¸ì.');
	    		} else if(pwd2 == ""){
	    			alert('ë¹ë°ë²í¸ë¥¼ íì¸í´ì£¼ì¸ì.');
	    		} else if(pwd1.length < 8){
	    			alert('ë¹ë°ë²í¸ë 8ì ì´ì 20ì ì´íì¬ì¼ í©ëë¤.');
	    		} else if(pwd1.length > 20){
	    			alert('ë¹ë°ë²í¸ë 8ì ì´ì 20ì ì´íì¬ì¼ í©ëë¤.');
	    		} else if(pwd1.search(/\s/) != -1){
	    			alert('ë¹ë°ë²í¸ìë ê³µë°±ì ìë ¥í  ì ììµëë¤.');
	    		} else if(num < 0 || eng < 0 || spe < 0 ){
	    			alert('ë¹ë°ë²í¸ë ìë¬¸, ì«ì, í¹ìë¬¸ìë¥¼ í¼í©íì¬ ìë ¥í´ì£¼ì¸ì.');
	    		} else if(pwd1 != pwd2){
		    		alert('ë¹ë°ë²í¸ê° ì¼ì¹íì§ ììµëë¤. ë¹ë°ë²í¸ë¥¼ íì¸í´ì£¼ì¸ì.');
	    		} else if($('#email').val()==""){
	    			alert('ì´ë©ì¼ ì£¼ìë¥¼ ìë ¥í´ì£¼ì¸ì.');
	    		} else if($('#phone').val()==""){
	    			alert('í´ëí° ì¸ì¦ì í´ì£¼ì¸ì.');
	    		} else if($('#un').val()==""){
	    			alert('ë³¸ì¸ ì¸ì¦ì ì§íí´ì£¼ì¸ì.');
	    		} else {
		    		$(".joinForm").submit();
		    	}
		    });
    </script>
    </div>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>