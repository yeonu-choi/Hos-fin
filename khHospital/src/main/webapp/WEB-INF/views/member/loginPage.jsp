<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<meta name ="google-signin-client_id" content="468040766247-j4oob2loovgd76hfkok8sou54opr8das.apps.googleusercontent.com">
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
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
         border-bottom: 2px solid #e3e3e3;
         padding-bottom: 30px;
     }

     #lArea {
         text-align: center;
         margin-top: 40px;
         width: 100%;
     }

     .lTitle {
         font-size: 26px;
         font-weight: 600;
         color: #404040;
         margin-bottom: 10px;
     }

     #userId, #userPwd {
         width: 400px;
         height: 40px;
         border: none;
         border-bottom: 2px solid #eeeeee;
         display: block;
         margin-top: 30px;
     }

     #userId::placeholder,
     #userPwd::placeholder {
         font-size: 16px;
         color: #a1a0a0;
         padding-left: 20px;
     }

     .btns button {
         text-align: center;
         width: 400px;
         height: 60px;
         border-radius: 5px;
     }

     #loginBtn { 
         margin-top: 30px; 
         border: none;
         background: #4599ef;
         color: white;
         font-size: 18px;
         cursor: pointer;
         font-weight: 600;
         }
     #joinBtn { 
         margin-top: 10px; 
         border: 1px solid #b6b6b6;
         background: white;
         font-size: 18px;
         cursor: pointer;
         font-weight: 600;
         }
     
     #saveId { 
         position: relative; 
         top: 3px;
         }

     #login td { padding-top: 20px; }
     #login label { font-weight: 600;}

     #findArea { 
         display: inline-block;
         width: 410px;
         margin-top: 30px;
         padding-bottom: 30px;
         border-bottom: 2px solid #eeeeee;
         }
     
     .f1, .f3 { 
         text-decoration: none;
         color: black;
         }

     #slArea {
         text-align: center;
         margin-top: 40px;
         width: 100%;
         margin-bottom: 150px;
     }

     #lSub { color: #7f8082; font-size: 17px;}

     .sBtn {
         width: 220px;
         height: 48px;
         position: relative;
         border-radius: 5px;
         margin: 0 auto;
         cursor: pointer;
     }
     
     .b1 { background: #fae301; margin-top: 30px;}
     
     .b2 *{ 
         width : 222px;
         margin-top: 5px;
         }
     
     .b3 { 
         border: 1px solid #bdb3bb;
         margin-top: 9px;
         } 

     .b3 img { height: 25px; margin-top: 9px; margin-left: -150px;}

     .sBtn span { 
         position: absolute; 
         font-size: 16px;
         font-weight: 600;
         top: 10px;
}

     .b3 span { left: 60px; color : black;}
</style>  
<script>
	window.onload = function() {
	
	    if (getCookie("id")) { //쿠키가 있을경우
	    	document.getElementById("userId").value = getCookie("id");
	    	document.getElementById("saveId").checked = true; 
	     }
	
	 }
	
	 function setCookie(name, value, expiredays) 
	 {
	     var todayDate = new Date();
	     todayDate.setDate(todayDate.getDate() + expiredays);
	     document.cookie = name + "=" + escape(value) + "; path=/; expires="
	             + todayDate.toGMTString() + ";"
	 }
	
	 function getCookie(Name) {
	     var search = Name + "=";
	     if (document.cookie.length > 0) { 
	         offset = document.cookie.indexOf(search);
	         if (offset != -1) { 
	             offset += search.length; 
	             end = document.cookie.indexOf(";", offset); 
	             if (end == -1)
	                 end = document.cookie.length;
	             return unescape(document.cookie.substring(offset, end));
	         }
	     }
	 }
	
	 function sendIt() {
	     var frm = document.getElementById("loginForm");
	     var userId = document.getElementById("userId");
	     var userPwd = document.getElementById("userPwd")
	     
	     if (!userId.value) {
	         alert("아이디를 입력 해주세요.");
	         userId.focus();
	         return;
	     }
	     if (!userPwd.value) {
	         alert("패스워드를 입력 해주세요.");
	         userPwd.focus();
	         return;
	     }
	
	     if (document.getElementById("saveId").checked == true) { 
	         setCookie("id", userId.value, 7); 
	     } else {
	         setCookie("id", userId.value, 0);
	     }
	
	     frm.submit();
	 }
</script>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
     <div id="top">
        <p id="top-t">로그인</p>
    </div>
    <div id="lArea">
        <p class="lTitle">일반 로그인</p>
        <form id="loginForm" action="${ contextPath }/member/login" method="post">
        <table id="login" style="border-collapse:collapse" align="center">
        <tr>
            <th>
                <input type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요.">
            </th>
        </tr> 
        <tr>
            <th>
                <input type="password" name="userPwd" id="userPwd" placeholder="비밀번호를 입력해주세요.">
            </th>
        </tr>
        <tr>
            <td align="left">
                <input type="checkbox" id="saveId" name="saveId" style="zoom: 1.5;">
                <label for="saveId">아이디 저장</label>
            </td>
        </tr>
        </table>
        <div class="btns">
            <button type="button" id="loginBtn" onclick="sendIt()">로그인</button><br>
            <button type="button" id="joinBtn" onclick="location.href='${contextPath}/member/joinPage1'">회원가입</button>
        </div>
        </form>
        <div id="findArea">
            <a class="find f1" href="${contextPath}/member/idChk1">아이디 찾기</a>
            <span>&nbsp;|&nbsp;</span>
            <a class="find f3" href="${contextPath}/member/findPw">비밀번호 찾기</a>
        </div>
    </div>
    <div id="slArea">
        <p class="lTitle">sns 간편 로그인</p>
        <p id="lSub">평소에 이용하는 SNS로 가입하세요.</p>
        <div class="sBtn b1" id="kakaoBtn">
            <a id="kakao-login-btn"></a>
        </div>
        <script src = "//developers.kakao.com/sdk/js/kakao.min.js"></script>
		<script>
		Kakao.init('3cbb102ecfc79c3188f5f5049d7d0de9');
		var kakaonickname = "";
		var newPwd = Math.random().toString(36).substr(0, 13);
		
		Kakao.Auth.createLoginButton({ 
		    container: '#kakao-login-btn', 
		    success: function(authObj) { 
		           Kakao.API.request({
		               url: '/v2/user/me',
		               success: function(res) {
						/*   console.log(res.id);
		                     console.log(res.kaccount_email);
		                     console.log(res.properties['nickname']);
		                     console.log(authObj.access_token); */
		          kakaonickname = res.properties.nickname;   
		                     
		          kLogin(kakaonickname, res.kaccount_email, res.id, newPwd);
                   }
                 })
               },
               fail: function(e) {
                 alert(JSON.stringify(e));
               }
             });
		
			function kLogin(userName, email, userId, userPwd){
				location.href='${contextPath}/member/kLogin?userName='+ userName + "&email=" 
						+ email + "&userId=" + userId + "&userPwd=" + userPwd;
			}
		</script>
        <div class="sBtn b2" id="naverIdLogin" onclick="">
        
        </div>
        <script type="text/javascript">
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "9HbxJCEUsIE0Gd0MpeYw",
				callbackUrl: "http://localhost:8800/hospital/member/nLogin",
				isPopup: true, 
				loginButton: {color: "green", type: 3, height: 48}
			}
		);
		
		naverLogin.init();
		</script>
        <div class="sBtn b3" id="googleBtn" onclick="init();">
           <img src="${contextPath}/resources/images/google.png"><span>구글 ID로 로그인</span>
        </div>
    </div>   
	<script>
		var googleUser = {};
		
		function init() {
			 gapi.load('auth2', function() {
			  console.log("구글 로그인 시작");
			  auth2 = gapi.auth2.init({
			        client_id: '468040766247-j4oob2loovgd76hfkok8sou54opr8das.apps.googleusercontent.com',
			        cookiepolicy: 'single_host_origin',
			      });
			      attachSignin(document.getElementById('googleBtn'));
			 });
		}
	
		function attachSignin(e) {
		    auth2.attachClickHandler(e, {},
		        function(googleUser) {
		    	var profile = googleUser.getBasicProfile();
		    	var id_token = googleUser.getAuthResponse().id_token;
		    	var newId = Math.random().toString(36).substr(2, 16);
			  	var newPwd = Math.random().toString(36).substr(0, 13);
		    	  
			  	  /* console.log('ID: ' + profile.getId()); 
			  	  console.log('ID토큰: ' + id_token);
			  	  console.log('Name: ' + profile.getName());
			  	  console.log('Email: ' + profile.getEmail()); */
			  	  
					$(function() {
						$.ajax({
						    url: '${contextPath}/member/gLogin',
						    type: 'post',
						    data: {
								"userId" : newId,
								"userPwd" : newPwd,
						        "userName": profile.getName(),
								"email": profile.getEmail()
							    },
						    success: function (data) {
						            alert("구글아이디로 로그인 되었습니다");
						            location.href="${contextPath}/";
						        }
						});
					})
		        }, function(error) {
		          console.log(error);
		        });
		    console.log("구글 로그인 끝");
		  }
	</script>
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script> 
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>