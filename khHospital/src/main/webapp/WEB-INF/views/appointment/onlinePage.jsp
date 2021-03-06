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
        <h1 align="center">????????? ?????? ??????</h1>
		
		<div id="txtArea">
            <p>
                - ????????? ????????? ???????????? ???????????? ???????????? ????????? ???????????? ????????? ??? ?????? ??????????????????.<br>
                - ????????? ????????? ?????? ?????? ????????? ??????????????? ???????????? ????????? ???????????? ??? ????????????.<br>
                - ?????? ???????????? ????????? ?????? ????????? ??????????????????.<br>
				- ?????? ??????????????? ?????? ??? ?????? ?????? ??? ?????? ??????????????????. (???????????? 02-123-4567)
            </p>
        </div>

        <div class="appointmentArea">
        
        
            <form action="${ contextPath }/appoint/online2" onsubmit="return submitCheck();">
                <div class="textArea">
	                <table id="userInfoArea">
	                	<tr><td colspan="2" align="center"><h2>?????? ??????</h2><input type="hidden" name="userId" value="${ loginUser.userId }"></td></tr>
	                	<tr>
	                		<th><label> ?????? : </label></th>
	                		<td><label>${ loginUser.userName } ???</label></td>
	                	</tr>
	                	<tr>
	                		<th><label> ???????????? : </label></th>
	                		<td><label> ${ loginUser.birth }</label></td>
	                	</tr>
	                	<tr>
	                		<th><label> ?????? : </label></th>
	                		<td><label><c:if test="${ loginUser.gender eq '??????' }">??????</c:if>
	                        <c:if test="${ loginUser.gender eq '??????' }">??????</c:if></label></td>
	                	</tr>
	                	<tr>
	                		<th><label>* ????????? : </label></th>
	                		<td><input type="text" class="phone txt"  name="phone" maxlength="13" value="${ loginUser.phone }" required></td>
	                	</tr>
	                	<tr>
	                		<th><label>* ????????? ?????? : </label></th>
	                		<td><input type="text" class="email txt" name="email" value="${ loginUser.email }" required></td>
	                	</tr>
	                </table>
                </div>
				
				<div id="infoArea">?????? ?????? ????????? '?????? ????????? - ?????? ?????? ??????'?????? ??????????????? ????????????. &nbsp;&nbsp;&nbsp;<button type="button" onclick="location.href='${contextPath}/mypage/modify'" >????????????</button></div>
				
	            <div class="textArea deptArea">   
	                <div id="departmentArea">
	                    <h2>????????? & ?????????</h2>
	                    <div>
	                        <label>?????????</label>
	                        <select name="did">
	                        	<option selected disabled>--------------</option>
	                        	<c:forEach items="${ deptList }" var="d">
	                            <option value="${ d.did }">${ d.deptName }</option>
	                            </c:forEach>
	                        </select>
	                        <label>?????????</label>
	                        <select name="dname">
	                        	<option>--------------</option>
	                    	</select>
	                	</div>
	            	</div>
                </div>

                <div class="btnArea">
                    <button id="nextBtn">??????</button>
                    <button type="button" id="cancelBtn" onclick="location.href='${ contextPath }'">??????</button>
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
		   			select.html("<option selected disabled>?????????</option>");
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
    			alert('???????????? ???????????? ??????????????????');
    			return false;
    		};
        }
        
      

    </script>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>