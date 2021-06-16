<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>khHospital</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <style>
        #content{
            width:50%;
            margin: auto;
			margin-top: 100px; 
			margin-bottom : 200px;
            min-width: 900px;
        }

        #tabArea{
            width: 100%;
            min-width:950px;
            margin: auto;
        }
		
        .tabUl{
            display: inline-block;
            list-style: none;
            margin: 0px;
            padding: 0px 0px;
        }

        .tabUl li {
            display: inline-block;
        }

        .tabUl li a {
            text-decoration: none;
            color: #2d2d2d;
    		font-size: large;
            background-color: rgb(226 229 234);
            padding: 30px 175px;
        }
        
        .tab{
        	width:930px;
            position: relative;
            top : 70px;
            display:none;
        }
        
        .tab .imgArea, .infoArea{
        	text-align: center;
        }
		
        .tabArea .on{
            display:block;
        }
        
        .tabUl li .on {
            background-color: rgb(211, 232, 255);
        }
        

        #tab1 .infoArea {
            background-color: rgba(241, 243, 243, 0.918);
            padding : 30px;
        }
        
        #tab1 label{
            font-size: 20px;
            margin: 10px;
            font-weight: 540;
        }
        
        #tab1 i {
            color: rgb(69, 161, 189);
        }

    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp"/> 

<div id="content">
	
		<div class=""></div>
		
        <div id="tabArea">
            <ul class="tabUl">
                <li class="li on"><a href="#" class="on">방문예약 안내</a></li>
                <li class="li"><a href="#">전화예약 안내</a></li>
            </ul>
        </div>

        <div class="tabArea">
            <div id="tab0" class="tab on">
                <h1 align="center">방문예약 안내</h1><br>
                <p>예약 없이 오시면 당일 진료가 어려울 수 있습니다.</p>
                <p>※ 예약하신 분은 예약시간보다 20분 전에 내원하셔서 예약 확인 후 원무팀에 수납하시고 해당 진료과에 가시면 됩니다.</p>
                <div class="imgArea"><img src="../resources/image/appointment/방문예약.PNG"></div>
            </div>

            <div id="tab1" class="tab">
                <h1 align="center">전화예약 안내</h1><br>
                <p>전화예약은 고객께서 상담원과 직접 통화하여 진료예약/변경/확인/취소 등을 진행하실 수 있습니다.</p>
                <div class="infoArea">
                    <p>
                        <label><i class="bi bi-telephone-fill"></i> 진료 예약 전화 </label>
                        <label>02 - 123 - 4567</label>
                    </p>
                    <p> 예약 상담 시간 : 평일 9 : 00 ~ 17 : 00  &nbsp; 토요일 9 : 00 ~ 12 : 00</p>
                </div>
                <div class="imgArea"><img src="../resources/image/appointment/전화예약.PNG"></div>
            </div>
        </div>

    </div>

    <script>
            $('.tabUl li').click(function(){
                var num = $(this).index();
                
                $('.tabUl li').removeClass('on');
                $('.tabUl li a').removeClass('on');
                $('.tab').removeClass('on');

                $(this).addClass('on');
                $(this).children('a').addClass('on');
                $("#tab" + num).addClass('on');
                
            });

    </script>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>