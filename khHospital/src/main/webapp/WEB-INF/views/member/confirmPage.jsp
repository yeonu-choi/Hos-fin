<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    #phone {
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
    <div id="cArea">
        <p id="cTitle">휴대폰 인증</p>
        <p id="cSub">전송된 인증번호를 입력해주세요.</p>
        <table class="vTable" style="border-collapse:collapse" align="center">
            <tr>
                <td align="center" colspan="2">
                    <input type="text" id="userName" placeholder="이름 입력">
                </td>
            </tr> 
            <tr>
                <td align="center" class="second">
                    <input type="tel" id="phone" placeholder="휴대폰 번호 입력">
                    <button class="verifyBtn" id="vbtn2">발송</button>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <input type="text" id="verifyNo" placeholder="인증번호 입력">
                </td>
            </tr>
            </table>
            <div class="btns">
            	 <input type="hidden" name="text" id="realNo">  	
                <button id="goJoin">인증하기</button>
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
         
         if(phone == "" || phone == null){
            alert("휴대폰 번호를 입력해주세요");
         } else {
                 $.ajax({
                     url:"confirmPage",
                     type:"post",
                     data:{phone: $("#phone").val(),
                          realNo: $("#realNo").val()
                          },
                   success:function(data){
                	  if(data.success != null){
                		  alert("인증번호를 발송했습니다");
                	  };
                	  if(data.duplicate != null){
                		  alert("이미 등록된 휴대폰 번호입니다.");
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
    		
    
    	$(document).on('click', '#goJoin', function(){
    		
    		var userNum = $("#verifyNo").val();
    	    var sysNum = $("#realNo").val();    
    	    
    		if($('#userName').val()==""){
    			alert('이름을 입력해주세요.');
    		} else if($('#phone').val()==""){
    			alert('휴대폰 번호를 입력해주세요.');
    		} else if($('#verifyNo').val()==""){
    			alert('인증번호를 입력해주세요.');
    		} else {
    			if(userNum.trim() == sysNum.trim()){
    				alert('인증되었습니다.');
    				$(opener.document).find('#un').val($('#userName').val());
            		$(opener.document).find('#ph').val($('#phone').val());
            		window.close();
    			} else {
    				alert('인증번호가 일치하지 않습니다.');
    			}			
    		}
    	});
    </script>
   </body>
</html>