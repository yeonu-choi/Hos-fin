<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>khHospital</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/Redmond/jquery-ui.css">
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

        #fixArea{
            width: 920px;
            height: 270px;
            margin: auto;
            background-color: rgb(253 253 253);
            border: 1px solid rgba(224, 231, 236, 0.897);
            margin-bottom : 30px;
        }
        
        #fixArea label{
            display: inline-block;
            line-height: 25px;
        }
        
        #fixArea table{
        	width:100%;
        }
        
        #fixArea table tr{
			height:55px;
        }
        
        #fixArea th {
			width : 200px;
			line-height: 25px;
			text-align:right;
			padding-right:30px;
		}
        
		#fixArea td {
			text-align:left;
		}
		
        #dateTimeArea{
            margin: auto;
            width: 1020px;
            background-color: rgb(253 253 253);
            border: 1px solid rgba(224, 231, 236, 0.897);
            border-radius: 3px;
            padding-bottom: 15px;
        }

        #dateTimeArea #datepicker {
            margin-left: 20px;
        }
	
		.ui-datepicker{
		  	font-size: 19px; 
		 }
		 
		.ui-widget-header {
		    border: 1px solid #c5d1da;
		    background: #c6d5e8;
		    color: #ffffff;
		    font-weight: bold;
		}
		
		
		.ui-widget-content .ui-state-default{
		    border: 1px solid #d7e1e8;
		    background: #fafdff;
		    font-weight: bold;
		    color: #a1adbb;
		    height:30px;
		} 
		
		.ui-state-active, .ui-widget-content .ui-state-active{
			border: 1px solid #dee5ea;
			background: #d0dcea;
			font-weight: bold;
			color: #7f8c9a;
		} 
		
        #dateTimeArea .time{
            margin-left: 270px;
        }

        #dateTimeArea input[type=radio]{
            margin-left: 20px;
        }
        
        #dateTimeArea label{
            font-size: 18px;
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
            background-color:  rgba(169, 209, 241, 0.897);
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
            <form action="${ contextPath }/appoint/online/insert" method="post" id="onlineAppoint">
                <div id="fixArea">
                	<table>
                		<tr>
                			<td colspan="4" align="center"><h2>${ loginUser.userName } 님 </h2>
	                		<input type="hidden" name="userId" value="${ o.userId }">
	                        <input type="hidden" name="phone" value="${ o.phone }">
	                        <input type="hidden" name="email" value="${ o.email }">
	                        <input type="hidden" name="did" value="${ o.did }">
	                        <input type="hidden" name="deptName" value="${ o.deptName }">
	                        <input type="hidden" name="dname" value="${ o.dname }"></td>
                        </tr>
                		<tr>
                			<th><label>생년월일 : </label></th>
                			<td><label>${ loginUser.birth }</label></td>
                			<th><label>성별 : </label></th>
                			<td><label><c:if test="${ loginUser.gender eq '남자' }">남자</c:if><c:if test="${ loginUser.gender eq '여자' }">여자</c:if></label></td>
                		</tr>
                		<tr>
                			<th><label>핸드폰 : </label></th>
                			<td><label>${ o.phone }</label></td>
                			<th><label>이메일 : </label></th>
                			<td><label>${ o.email }</label></td>
                		</tr>
                		<tr>
                			<th><label>진료과 : </label></th>
                			<td><label>${ o.deptName }</label></td>
                			<th><label>의료진 : </label></th>
                			<td><label>${ o.dname }</label></td>
                		</tr>
                	</table>
                </div>

                <div id="dateTimeArea">
                    <h2>날짜 & 시간</h2>
                    <div id="datepicker"></div>
                    
                    <div class="date">
                        <h4 id="day" align="center">&nbsp;</h4>
                        <input type="hidden" name="adate" id="adate">
                    </div>
                    
					<h4 align="center">예약 가능 시간 </h4>
					
                    <div class="time">
                        <input type="radio" value="9:00" id="9:00" name="atime"><label for="9:00">9:00</label> &nbsp;
                        <input type="radio" value="9:20" id="9:20" name="atime"><label for="9:20">9:20</label> &nbsp;
                        <input type="radio" value="9:40" id="9:40" name="atime"><label for="9:40">9:40</label> &nbsp;
                        <input type="radio" value="10:00" id="10:00" name="atime"><label for="10:00">10:00</label>
                        <input type="radio" value="10:20" id="10:20" name="atime"><label for="10:20">10:20</label>
                        <input type="radio" value="10:40" id="10:40" name="atime"><label for="10:40">10:40</label>
                        <br>
                        <input type="radio" value="11:00" id="11:00" name="atime"><label for="11:00">11:00</label>
                        <input type="radio" value="11:20" id="11:20" name="atime"><label for="11:20">11:20</label>
                        <input type="radio" value="11:40" id="11:40" name="atime"><label for="11:40">11:40</label>
                        <input type="radio" value="12:00" id="12:00" name="atime"><label for="12:00">12:00</label>
                        <input type="radio" value="12:20" id="12:20" name="atime"><label for="12:20">12:20</label>
                        <input type="radio" value="12:40" id="12:40" name="atime"><label for="12:40">12:40</label>
                        <br>
                        <input type="radio" value="1:00" id="1:00" name="atime"><label for="1:00">1:00</label> &nbsp;
                        <input type="radio" value="1:20" id="1:20" name="atime"><label for="1:20">1:20</label> &nbsp;
                        <input type="radio" value="1:40" id="1:40" name="atime"><label for="1:40">1:40</label> &nbsp;
                        <input type="radio" value="2:00" id="2:00" name="atime"><label for="2:00">2:00</label> &nbsp;
                        <input type="radio" value="2:20" id="2:20" name="atime"><label for="2:20">2:20</label> &nbsp;
                        <input type="radio" value="2:40" id="2:40" name="atime"><label for="2:40">2:40</label> &nbsp;
                        <br>
                        <input type="radio" value="3:00" id="3:00"name="atime"><label for="3:00">3:00</label> &nbsp;
                        <input type="radio" value="3:20" id="3:20" name="atime"><label for="3:20">3:20</label> &nbsp;
                        <input type="radio" value="3:40" id="3:40" name="atime"><label for="3:40">3:40</label> &nbsp;
                        <input type="radio" value="4:00" id="4:00" name="atime"><label for="4:00">4:00</label> &nbsp;
                        <input type="radio" value="4:20" id="4:20" name="atime"><label for="4:20">4:20</label> &nbsp;
                        <input type="radio" value="4:40" id="4:40" name="atime"><label for="4:40">4:40</label> &nbsp;
                        
                    </div>
                </div>

                <div class="btnArea">
                    <button type="button" onclick="location.href='${ contextPath }/appoint/online'">이전페이지로</button>
                    <button type="button" id="cancelBtn" onclick="location.reload();">취소</button>
                    <button type="button" id="appointmentBtn">예약</button>
                </div>


            </form>
        </div>
    </div>

    
    <script>
	    var dayOff = "${dayOff}"
    	
        $('#datepicker').datepicker({
            dateFormat: 'yy-mm-dd',
            prevText: '이전 달',
            nextText: '다음 달',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더중 월 표시를 위한 부분
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더 중 월 표시를 위한 부분
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],		// 한글 요일 표시 부분
            minDate:"+1d",
            maxDate:"+2m 30d",
            beforeShowDay : function(date){
            	var day = date.getDay();							// 요일을 숫자로 가져옴
        		return [(dayOff.indexOf(day) == -1)]				// dayOff = [3, 6] -> day = 0, 1, 2, 4, 5 일때  dayOff.indexOf(day) 가  -1 -> true day가  0, 1, 2, 4, 5 일때 선택 가능
        															// dayOff = [3, 6] -> day = 3, 6 일때 dayOff.indexOf(day) 가 1 -> false -> day가 3, 6 일때 선택 불가
        	},
            numberOfMonths :[1,3],
            changeMonth: false,
            changeYear: false
        });
        
        $('#datepicker').on('change', function() {
            $('#day').html($('#datepicker').val());
            var adate = $('#datepicker').val();
            $("#adate").val(adate);
            var did = '${ o.did }';
            var dname = '${ o.dname }';
            
            $.ajax({
            	url : "${ contextPath }/appoint/time",
            	type : "get",
            	data : { adate:adate, did:did, dname:dname },
            	dataType : "json",
            	success : function(data){
            		console.log(data);
            		
            		$('.time').find('input').each(function(i, e){
            			var value = $(this).val();
            			$(this).prop('checked', false);
            			$(this).prop('disabled', false);
            			
            			for(var j in data){
            				if(value == data[j].atime){
            					$(this).prop('disabled', true);
            				}
            			}
            		});
            		
            	}, error : function(e){
            		console.log(e);
            	}
            })
        });
        
        $("#appointmentBtn").on('click', function(){
        	var day = $("#adate").val();
        	var time = $("input[name=atime]");
        	
        	if(day == ""){
        		alert("날짜를 선택해주세요.");
        	} else if(!$(time).is(':checked')){
        		alert("시간을 선택해주세요.");
        	} else {
        		if(confirm('예약하시겠습니까?')) $("#onlineAppoint").submit();
        	}
        	
        });
        
    </script>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>