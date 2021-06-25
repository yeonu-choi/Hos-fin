<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
</head>
<style>


.title h1 {
    margin-top: 50px;
    text-align: center;
    height: 200px;
    font-size: 42px;
    line-height: 200px;
    
}

.title p {
    border-top: 3px solid #a08b65;
    text-align: center;
    margin-bottom: 50px;
}

/* container */
.container {
    border: 1px solid black;
    margin-bottom: 200px;
    box-sizing: border-box;
    margin: 0;
    padding: 0;;
}

.container{
    margin-bottom: 200px;
}

.culture_wrap > div{
    width: 1200px;
   
   
}

.culture_info {
    margin-left: auto;
    margin-right: auto;
}

.culture_list {
    margin-top: 20px;
    border: 1px solid  #006a79;
    
}

.culture_list > ul {
    list-style: none;   
    display: inline-block;
}

.culture_list ul li {
    position: relative;
    width: 340px;
    border: 2px solid  #006a79;
    float: left;
    margin-left: 30px;
    margin-bottom: 30px;
    height: 500px;
    
}

.culture_list ul li > div:first-child {
    width: 340px;
    height: 340px;
    overflow: hidden;
    text-align: center;
    margin-top: 20px;
    
}

.culture_list ul li > div:last-child {
    width: 100%;
    height: 140px;
    overflow: hidden;
    margin-top: 20px;
    
}
/* dl 위치 조정 */
.culture_list ul li > div dl {
    
    display: block;
    margin-block-start: 0em;
    margin-block-end: 0em;
    margin-inline-start: 1em;
    margin-inline-end: 1em;
    border: 1px solid  #006a79;
    height: 80%;
    border-radius: 30px;
    
}


.culture_list ul li > div dl dt {
    display: block;
    color:black;
    font-size: 32px;
    line-height: 20px;
    height: auto;
    margin-bottom: 20px;
    margin-top: 20px;
    text-align: center;
}

.culture_list ul li > div dl dd {
    border-bottom: 1px solid;
    text-align: center;
    max-height: 40px;
    font-size: 15px;
    width: 250px;
    margin-left: auto;
    margin-right: auto;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    
}

/* img 크기 맞추기 */
#list_ul img {
    width: 100%;
    height: 100%;
   
    
    
}

.writebtn {
    
    text-align: center;
}

.writebtn button {
    border: 2px solid white;
    background-color: #006a79;
    color: white;
    cursor: pointer;
    width: 100px;
    height: 30px;
    border-radius: 30px;
}

.morelistbtn {
    
    display: block;
   
    text-align: center;
    
}

.morelistbtn button {
    background-color: #006a79;
    color: white;
    border-radius: 30px;
    width: 100px;
    height: 30px;
   
}
</style>
<body>

	<jsp:include page="../common/menubar.jsp"/>
	
    <div class="title">
        <h1>문화센터</h1>

        <p>
            kh병원의 다양한 강의를 만나실 수 있습니다.
        </p>
        <div class="writebtn">
                 <c:if test="${ loginUser.userId eq 'admin11' }">
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
    <jsp:include page="../common/footer.jsp"/>
    <script>
		function cultureDetail(cid) {
			console.log(cid);
			location.href = '${ contextPath }/culture/detail?cid=' + cid;
			
		}
	
	</script>
	
	<!-- ajax 더보기 -->
	<script>
		
	$(document).ready(function(){
		
		var startIndex = 6;
		var stepIndex = 3;
		
		console.log(startIndex);
		morelist(startIndex);
		 
		$("#morelist").click(function(){
			
			startIndex += stepIndex;
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