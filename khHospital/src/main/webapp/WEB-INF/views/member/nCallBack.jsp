<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<title>callBack</title>
</head>
<body>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	
	<script>
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "9HbxJCEUsIE0Gd0MpeYw",
				callbackUrl: "https://localhost:8800/hospital/member/nLogin",
				isPopup: true,
				callbackHandle: true
			}
		);

		naverLogin.init();

		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					var email = naverLogin.user.getEmail();
					var userName = naverLogin.user.getName();
					var userId = naverLogin.user.getId();
					var userPwd = Math.random().toString(36).substr(0, 13);
					
					if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					} else if( userName == undefined || userName == null) {
						alert("이름은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					} else if( userId == undefined || userId == null) {
						alert("아이디는 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
					
					self.close();
					opener.location.href="${contextPath}/member/naver?userId=" + userId + "&userPwd=" 
							+ userPwd + "&userName=" + userName + "&email=" + email;
                 } else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
	</script>
</body>
</html>