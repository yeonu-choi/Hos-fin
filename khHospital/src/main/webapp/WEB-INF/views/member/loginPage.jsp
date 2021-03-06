<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<meta name ="google-signin-client_id" content="468040766247-j4oob2loovgd76hfkok8sou54opr8das.apps.googleusercontent.com">
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
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
	
	    if (getCookie("id")) { //ì¿ í¤ê° ììê²½ì°
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
	         alert("ìì´ëë¥¼ ìë ¥ í´ì£¼ì¸ì.");
	         userId.focus();
	         return;
	     }
	     if (!userPwd.value) {
	         alert("í¨ì¤ìëë¥¼ ìë ¥ í´ì£¼ì¸ì.");
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
        <p id="top-t">ë¡ê·¸ì¸</p>
    </div>
    <div id="lArea">
        <p class="lTitle">ì¼ë° ë¡ê·¸ì¸</p>
        <form id="loginForm" action="${ contextPath }/member/login" method="post">
        <table id="login" style="border-collapse:collapse" align="center">
        <tr>
            <th>
                <input type="text" id="userId" name="userId" placeholder="ìì´ëë¥¼ ìë ¥í´ì£¼ì¸ì.">
            </th>
        </tr> 
        <tr>
            <th>
                <input type="password" name="userPwd" id="userPwd" placeholder="ë¹ë°ë²í¸ë¥¼ ìë ¥í´ì£¼ì¸ì.">
            </th>
        </tr>
        <tr>
            <td align="left">
                <input type="checkbox" id="saveId" name="saveId" style="zoom: 1.5;">
                <label for="saveId">ìì´ë ì ì¥</label>
            </td>
        </tr>
        </table>
        <div class="btns">
            <button type="button" id="loginBtn" onclick="sendIt()">ë¡ê·¸ì¸</button><br>
            <button type="button" id="joinBtn" onclick="location.href='${contextPath}/member/joinPage1'">íìê°ì</button>
        </div>
        </form>
        <div id="findArea">
            <a class="find f1" href="${contextPath}/member/idChk1">ìì´ë ì°¾ê¸°</a>
            <span>&nbsp;|&nbsp;</span>
            <a class="find f3" href="${contextPath}/member/findPw">ë¹ë°ë²í¸ ì°¾ê¸°</a>
        </div>
    </div>
    <div id="slArea">
        <p class="lTitle">sns ê°í¸ ë¡ê·¸ì¸</p>
        <p id="lSub">íìì ì´ì©íë SNSë¡ ê°ìíì¸ì.</p>
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
           <img src="${contextPath}/resources/images/google.png"><span>êµ¬ê¸ IDë¡ ë¡ê·¸ì¸</span>
        </div>
    </div>   
	<script>
		var googleUser = {};
		
		function init() {
			 gapi.load('auth2', function() {
			  console.log("êµ¬ê¸ ë¡ê·¸ì¸ ìì");
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
			  	  console.log('IDí í°: ' + id_token);
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
						            alert("êµ¬ê¸ìì´ëë¡ ë¡ê·¸ì¸ ëììµëë¤");
						            location.href="${contextPath}/";
						        }
						});
					})
		        }, function(error) {
		          console.log(error);
		        });
		    console.log("êµ¬ê¸ ë¡ê·¸ì¸ ë");
		  }
	</script>
	<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script> 
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>