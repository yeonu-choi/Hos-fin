<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>khHospital</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <style>
        #content{
            width:1100px;
            margin: auto;
            margin-top:70px;
            min-width: 600px;
        }
        
        #content h1{
            color: #00a5db;
        }
        
        #txtArea{
        	width:90%;
            margin: 30px auto;
            line-height: 25px;
        }

        .appointmentArea{
            width: 90%;
            margin: 20px;
            padding: 20px;
            padding-bottom: 50px;
            font-size: 15px;
            margin: auto;
            min-width: 900px;
        }

        .appointmentArea h2{
            text-align: center;
        }

        .textArea{
            width: 840px;
            height: 380px;
            margin: auto;
            background-color: rgba(250, 253, 253, 0.918);
            border: 1px solid rgba(224, 231, 236, 0.897);
        }
        
        .textArea label{
            display: inline-block;
            line-height: 25px;
        }
		
		#userInfoArea{
			width : 100%;
		}
		
		#userInfoArea tr{
			height:55px;
		}
	
		#userInfoArea th {
			width : 200px;
			line-height: 25px;
			text-align:right;
			padding-right:30px;
		}
        
        #userInfoArea [class*=txt]{
            padding-left: 8px;
            border: 1px rgba(197, 198, 201, 0.918) solid;
            border-radius: 5px;
            font-size: 15px;
        }

        #userInfoArea input{
            width: 300px;
            height: 30px;
        } 
        
		#infoArea{
			text-align: left;
			width: 840px;
			margin: 30px auto;
		}
		
		#infoArea button{
			width: 100px;
            height: 30px;
            border: 1px rgba(255, 255, 255, 0.918) solid;
            background-color: rgba(213, 218, 218, 0.918);
            border-radius: 5px;
            color: white;
		}

		.deptArea{
            height: 180px;
		}

        #departmentArea{
            display: inline-block;
            width:100%;
            border-radius: 3px;
            padding-bottom: 30px;
            margin-left: 15px;
        }

        #departmentArea label{
            display: inline-block;
            width: 170px;
            padding: 20px 15px;
            text-align: right;
            line-height: 25px;
            font-weight:bold;
        }

        #departmentArea option, select{
            width: 150px;
            padding-left: 10px;
            border: 1px rgba(197, 198, 201, 0.918) solid;
            border-radius: 3px;
            font-size: 15px;
            height: 25px;
        }
        
        .btnArea{
            margin-top: 50px;
            text-align: center;
            margin-bottom: 50px;
        }

        .btnArea button{
            width: 100px;
            height: 30px;
            border: 1px rgba(255, 255, 255, 0.918) solid;
            background-color: rgba(169, 209, 241, 0.897);
            border-radius: 5px;
            color: white;
        }

        #cancelBtn{
            background-color: rgba(213, 218, 218, 0.918);
        }
    </style>

</head>
<body>
	<jsp:include page="../common/menubar.jsp"/> 
		
	<div id="content">
        <h1 align="center">온라인 진료 예약</h1>
		
		<div id="txtArea">
            <p>
                - 온라인 예약은 진료과와 의료진을 선택하여 원하는 시간대에 예약할 수 있는 서비스입니다.<br>
                - 선택이 어려운 경우 빠른 예약을 이용하시면 상담원이 예약을 도와드릴 수 있습니다.<br>
                - 처음 진료하는 경우는 빠른 예약을 이용해주세요.<br>
				- 당일 방문하시는 경우 꼭 전화 문의 후 방문 부탁드립니다. (전화예약 02-123-4567)
            </p>
        </div>

        <div class="appointmentArea">
        
        
            <form action="${ contextPath }/appoint/online2" onsubmit="return submitCheck();">
                <div class="textArea">
	                <table id="userInfoArea">
	                	<tr><td colspan="2" align="center"><h2>고객 정보</h2><input type="hidden" name="userId" value="${ loginUser.userId }"></td></tr>
	                	<tr>
	                		<th><label> 이름 : </label></th>
	                		<td><label>${ loginUser.userName } 님</label></td>
	                	</tr>
	                	<tr>
	                		<th><label> 생년월일 : </label></th>
	                		<td><label> ${ loginUser.birth }</label></td>
	                	</tr>
	                	<tr>
	                		<th><label> 성별 : </label></th>
	                		<td><label><c:if test="${ loginUser.gender eq '남자' }">남자</c:if>
	                        <c:if test="${ loginUser.gender eq '여자' }">여자</c:if></label></td>
	                	</tr>
	                	<tr>
	                		<th><label>* 연락처 : </label></th>
	                		<td><input type="text" class="phone txt"  name="phone" maxlength="13" value="${ loginUser.phone }" required></td>
	                	</tr>
	                	<tr>
	                		<th><label>* 이메일 주소 : </label></th>
	                		<td><input type="text" class="email txt" name="email" value="${ loginUser.email }" required></td>
	                	</tr>
	                </table>
                </div>
				
				<div id="infoArea">회원 정보 수정은 '마이 페이지 - 회원 정보 수정'에서 수정하시기 바랍니다. &nbsp;&nbsp;&nbsp;<button type="button" onclick="location.href='${contextPath}/mypage/modify'" >바로가기</button></div>
				
	            <div class="textArea deptArea">   
	                <div id="departmentArea">
	                    <h2>진료과 & 의료진</h2>
	                    <div>
	                        <label>진료과</label>
	                        <select name="did">
	                        	<option selected disabled>--------------</option>
	                        	<c:forEach items="${ deptList }" var="d">
	                            <option value="${ d.did }">${ d.deptName }</option>
	                            </c:forEach>
	                        </select>
	                        <label>의료진</label>
	                        <select name="dname">
	                        	<option>--------------</option>
	                    	</select>
	                	</div>
	            	</div>
                </div>

                <div class="btnArea">
                    <button id="nextBtn">다음</button>
                    <button type="button" id="cancelBtn" onclick="location.href='${ contextPath }'">취소</button>
                </div>

            </form>
        </div>
    </div>

    
    <script>
    	
	    $('select[name=did]').on('change', function(){
	    	var did = $('select[name=did]').val();
	    	
 		    $.ajax({
		   		url :"${ contextPath }/appoint/doctor",
		   		type : "get",
		   		data : {did : did},
		   		dataType : "json",
		   		success : function(data){
		   			console.log(data);
		   			var select = $('select[name=dname]');
		   			select.text("");
		   			select.html("<option selected disabled>의료진</option>");
		   			for(var i in data){
		   				var option = "";
		   				option += "<option value='" + data[i].userName + "'>" + data[i].userName + "</option>";
		   				select.append(option);
		   			}
		   		},
		   		error : function(e){
		   			console.log(e);
		   		}
		    }) 
	    });
  
        function submitCheck(){
        	var did = $('select[name=did]').val();
    		var dname = $('select[name=dname]').val();
    		
    		if(did != null && dname != null) {
    			return true;
    		} else {
    			alert('진료과나 의료진을 선택해주세요');
    			return false;
    		};
        }
        
      

    </script>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>