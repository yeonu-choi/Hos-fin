<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>khHospital</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <style>
        #content{
            width:900px;
            margin: auto;
            margin-top:80px;
            margin-bottom:100px;
            min-width: 600px;
        }
        
        #content h1{
            color: #00a5db;
        }

        #txtArea{
            margin: 30px 0px;
            line-height: 25px;
        }

        .appointmentArea{
            margin: 20px;
            background-color: rgba(241, 243, 243, 0.918);
            padding: 20px;
            padding-bottom: 50px;
            font-size: 15px;
        }

        .appointmentArea label{
            display: inline-block;
            width: 130px;
            padding: 20px;
            text-align: center;
            line-height: 25px;
        }


        .appointmentArea [class*=txt]{
            margin: 13px;
            padding-left: 5px;
            border: 1px rgba(197, 198, 201, 0.918) solid;
            border-radius: 5px;
            font-size: 15px;
        }

        .appointmentArea input{
            width: 300px;
            height: 30px;
        }

        .appointmentArea .etc{
            width: 60%;
            height: 150px;
            padding: 5px;
            resize: none;
            vertical-align:top;
        }
        
        #info {
        	width:150px;
        	font-size:12px;
        	text-align:left;
        	color:red;
        }

        .btnArea{
            text-align: center;
        }

        .btnArea button{
            width: 100px;
            height: 30px;
            border: 1px rgba(255, 255, 255, 0.918) solid;
            background-color:  rgba(169, 209, 241, 0.897);
            border-radius: 5px;
            color: white;
            margin-top : 5%;
        }

        #cancelBtn{
            background-color: rgba(213, 218, 218, 0.918);
        }


    </style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/> 

	<div id="content">
        <h1 align="center">빠른 진료 예약</h1>

        <div id="txtArea">
            <p>
                - 빠른 예약은 초진 고객님, 시간이 없는 고객님을 위한 빠른 서비스 예약입니다.<br>
                - 회원 로그인 없이 예약 가능합니다.<br>
                - 입력 완료 후 예약 버튼을 누르시면 아래의 상담 시간 내에 연락 드리겠습니다.<br>
                - 상담 시간 : 평일 9 : 00 ~ 17 : 00  토요일 9 : 00 ~ 12 : 00
            </p><hr>
        </div>

        <div class="appointmentArea">
            <form action="${ contextPath }/appoint/quick/insert" method="post" onsubmit="return check();">
                <div>
                    <span><label>*이름</label></span>
                    <span><input type="text" class="name txt" name="qname" maxlength="20" required></span>
                </div>
                <div> 
                    <span><label>*연락처</label></span>
                    <span><input type="text" class="phone txt" name="qphone" maxlength="11" placeholder="휴대폰번호 ('-'제외하고 숫자만 입력)" required><label id="info">'-'제외하고 숫자만 입력</label></span>
                </div>
                <div>
                    <span><label>연락 가능 시간</label></span>
                    <span><input type="text" class="time txt" name="qtime" maxlength="100"></span>
                </div>
                <div>    
                    <span><label>간단한 증상 <br>또는 <br>문의 사항</label></span>
                    <span><textarea class="etc txt" name="qetc" onKeyUp="len_check(this);"></textarea></span>
                </div>
                <div class="btnArea">
                    <button id="appointmentBtn">예약</button>
                    <button type="button" id="cancelBtn" onclick="location.reload();">취소</button>
                </div>
            </form>
        </div>
    </div>
    
    <script>
    function check(){
        var phone = $('.phone').val().trim();
        if(!(/^(01[016789]{1})([0-9]{3,4})([0-9]{4})$/.test(phone))){
            alert("잘못된 휴대폰 번호입니다.")
            $(".phone").select();
            return false
        }    
        
        if(!confirm('예약하시겠습니까?')) return false
    }
    
    function len_check(e){
    	console.log(e);
    	if(e.value.length > 300){
    		alert("300자까지만 작성 가능합니다.");
    	}
    }
    
    
	</script>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>