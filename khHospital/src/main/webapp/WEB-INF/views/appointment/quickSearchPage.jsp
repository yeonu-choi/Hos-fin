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
            width:70%;
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
        }

        #infoArea{
            padding: 50px;
            border-top: 1px solid rgba(178, 182, 182, 0.918);
            border-bottom: 1px solid rgba(178, 182, 182, 0.918);
            font-size: 15px;
        }

        #infoArea span{
            margin: 18px;
            display: inline-block;
        }

        #infoArea label{
            width: 50px;
            display: inline-block;
            padding: 15px;
            vertical-align: middle;
            text-align: center;
        }

        #infoArea input{
            width: 270px;
            height: 28px;
            font-size: 15px;
            vertical-align: middle;
            border: 1px solid rgba(213, 218, 218, 0.918);
            border-radius: 3px;
            padding-left: 5px;
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
            margin-top : 7%;
        }

        #cancelBtn{
            background-color: rgba(213, 218, 218, 0.918);
        }
    </style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/> 
	
	<div id="content" >
        <div>
            <h1 align="center">?????? ?????? ?????? ??????</h1>
            <div id="txtArea">
                <p>????????? ???????????? ???????????? ?????? ?????? ????????? ?????? ???????????????.</p>
            </div>
            
			<form action="${ contextPath }/appoint/quick/list" method="get" onsubmit="return check();">
	            <div id="infoArea" align="center">
	                <span>
		                <label>??????</label>
		                <input type="text" name="qname" required>
	                </span>
	                <span>
	                    <label>?????????</label>
	                    <input type="text" class="phone txt" name="qphone" maxlength="11" placeholder="??????????????? ('-'???????????? ????????? ??????)" required>
	                </span>
	            </div>
	
	            <div class="btnArea">
	                <button>??????</button>
	                <button type="button" id="cancelBtn" onclick="location.reload();">??????</button>
	            </div>
            </form>
        </div>
    </div>
    
    <script>
    function check(){
        var phone = $('.phone').val().trim();
        if(!(/^(01[016789]{1})([0-9]{3,4})([0-9]{4})$/.test(phone))){
            alert("????????? ????????? ???????????????.")
            $(".phone").select();
            return false
        }    
    }
	</script>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>