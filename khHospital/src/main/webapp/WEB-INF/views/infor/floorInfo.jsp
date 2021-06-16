<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>층별안내</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${ contextPath }/resources/css/floorInfo.css" type="text/css">
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	

    <div class="title">
        <h1>시설안내</h1>
      
    <p>   
        kh병원은 본관, 국민건강검진센터, 키즈센터 3개의 동이 연결되어 있습니다.
        <br>
        건강검진부터 진료, 입퇴원, 수술 및 문화센터 등 방문전에 미리 둘러보세요.
    </p>
    </div> 

    <!-- container -->
    <div class="container" id="container">
        <!-- content -->
        <div class="floor_wrap">        
            <div class="floor_select">
                <img src="${contextPath}/resources/images/guide_floor.png"></img>
            </div>
            <div class="floor_info">
                <div class="floor_main">
                    <ul>
                        <li class="">
                            <span>5F</span>
                            <div>
                                
                                <div class="content_bg1">
                                    <h5>5F</h5>
                                    <img src="${contextPath}/resources/images/center1f.png" alt="">
                                </div>
                                
                            </div>
                            <div class="content_bg2">
                                <img src="${contextPath}/resources/images/1floor_bg.jpg">
                            </div>
 
                        </li>
                        <li class="">
                            <span>4F</span>
                            <div>
                                
                                <div>
                                    <h5>4F</h5>
                                    <img src="${contextPath}/resources/images/center2f.png" alt="">
                                </div>
                            </div>
                            <div class="content_bg2">
                                <img src="${contextPath}/resources/images/2floor_bg.jpg">
                            </div>
                        </li>
                        <li class="">
                            <span>3F</span>
                            <div>
                                
                                <div>
                                    <h5>3F</h5>
                                    <img src="${contextPath}/resources/images/center3f.png" alt="">
                                </div>
                            </div>
                            <div class="content_bg2">
                                <img src="${contextPath}/resources/images/3floor_bg.jpg">
                            </div>
                            
                        </li>
                        <li class="">
                            <span>2F</span>
                            <div>
                                
                                <div>
                                    <h5>2F</h5>
                                    <img src="${contextPath}/resources/images/center4f.png" alt="">
                                </div>
                            </div>
                            <div class="content_bg2">
                                <img src="${contextPath}/resources/images/4floor_bg.jpg">
                            </div>
                            
                        </li>
                        <li class="on">
                            <span>1F</span>
                            <div>
                                
                                <div>
                                    <h5>1F</h5>
                                    <img src="${contextPath}/resources/images/center5f.png" alt="">
                                </div>
                            </div>
                            <div class="content_bg2" style="visibility: visible;">
                                <img src="${contextPath}/resources/images/5floor_bg.jpg">
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
    <jsp:include page="../common/footer.jsp"/>
    
    <!-- script -->
    <script>
        /* 버튼 클릭 class on off */
        $(".floor_main > ul > li").on('click', function(){
            $(this).addClass("on").siblings().removeClass("on");
            
            var bg = $(this).siblings().children(".content_bg2");
            console.log(bg);

           $(this).children("div :nth-child(3n)").addClass("on").css("visibility","visible");
           $(this).siblings().children(".content_bg2").removeClass("on").css("visibility","hidden");
            
        });

       
        

    </script>

</body>
</html>