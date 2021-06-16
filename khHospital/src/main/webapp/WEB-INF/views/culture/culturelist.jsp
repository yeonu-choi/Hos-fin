<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/culturelist.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<body>

	<jsp:include page="../common/menubar.jsp"/>
	
    <div class="title">
        <h1>문화센터</h1>

        <p>
            kh병원의 다양한 강의를 만나실 수 있습니다.
        </p>
        <div class="writebtn">
                 <c:if test="${ loginUser.userId eq 'admin1' }">
                	<button onclick="location.href='${ contextPath }/culture/write/'" width="80px" height="20px">작성하기</button>	
                 </c:if>
         </div>
    </div>
    

    <!-- container-->
    <div class="container" id="container">
        <!-- content -->
        <div class="culture_wrap">
            <div class="culture_info">
                <div class="culture_list">
                    <ul id="list_ul">
                    	<%-- 이거 지우면 안대요
                    	 <c:forEach items="${ list }" var="c">
                        <li onclick="cultureDetail( ${ c.cid } )">
                            <div>
                            <c:if test="${ !empty c.renameFileName }">
                                <img src="${ contextPath }/resources/cuploadFiles/${c.renameFileName}" width="100%" height="100%">                        
                            </c:if>
                            </div>
                            <div>
                                <dl>
                                    <dt>${ c.ctitle }</dt>
                                    <dd>${ c.csubtitle }</dd>
                                    <dd hidden>${ c.cid }</dd>
                                </dl>                    
                            </div>
                        </li>
                        </c:forEach>   --%>                  
                    </ul>
                    <div class="morelistbtn">
                    		<img id="photo_image" src="">
                            <button id="morelist"onclick="">더보기</button>
                    </div>
                    
                </div>
                
               
            </div>
        </div>

    </div>
    
    <script>
		function cultureDetail(cid) {
			console.log(cid);
			location.href = '${ contextPath }/culture/detail?cid=' + cid;
			
		}
	
	</script>
	
	<!-- ajax 더보기 -->
	<script>
		
	/* function morelist() {
		
		var startNum = $("#list_ul li").length;
		var addListHtml = ""; 
		
		console.log(startNum);
		
		$.ajax({
			url : "${ contextPath }/culture/culturelist",
			type : "get",
			dataType : "json",
			success : function(mv) {
				console.log(mv);
                console.log(mv.userList);
				
			}
			
			
		});
		
		
	} */
	
	$(document).ready(function(){
		
		var startIndex = 6;
		var stepIndex = 3;
		
		console.log(startIndex);
		morelist(startIndex);
		 
		$("#morelist").click(function(){
			
			startIndex += stepIndex;
			console.log(startIndex);	
			morelist(startIndex)
		});
				
		// 더보기 실행 함수
		function morelist(index){
			
			let stepIndex = index;
			
			$.ajax({
				url : "${ contextPath }/culture/morelist",
				type : "post",
				dataType: "json",
				data: {"stepIndex":stepIndex},
				success : function(data){
					console.log(data);
					
					let morelist = "";
					for(var i in data){
						let more ="<li onclick=cultureDetail(" + data[i].cid + ")><div><img src=" 
							+ "${ contextPath }/resources/cuploadFiles/" +  data[i].renameFileName + ">"
							+"</div><div><dl><dt>"+ data[i].ctitle +"</dt><dd>"+ data[i].csubtitle +"</dd></dl></div></li>";
								 
						
						morelist += more;
						
					}
					
					$("#list_ul").html(morelist); 
					
					//더보기 제거 console.log(data.length);
					
					
				}
			});
			
		};
		
		

	});
	
	
	
	
	
	
	</script>

</body>
</html>