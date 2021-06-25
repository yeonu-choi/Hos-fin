<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>층별안내</title>
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

/* floor content */

.floor_wrap div {
    width: 1200px;

}


.floor_select {
    margin-left: auto;
    margin-right: auto;
}

/* floor main */

.floor_info{
    margin-left: auto;
    margin-right: auto;
    margin-top: 30px;
   
    
}
.floor_main {

    display: block;
    border: 2px solid#07394a;
    height: 729px;
    position: relative;
    overflow: hidden;
    box-sizing: border-box;
}

.floor_main ul {
    margin: 0;
    border: 0;
    padding: 0;
    top: 0;
    left: 0;
    z-index: 10;
    width: 80px;
    height: 100%;
    background: #07394a;
    text-align: center;
    box-sizing: border-box;
}


.floor_main ul li {
    width: 80px;
    height: 81px;
    border: 1px solid white;
    list-style: none;
    box-sizing: border-box;
}

.floor_main ul li:hover span, .floor_main ul li.on span {
    background: #8abdd1;
    
}

.floor_main ul li span {
    position: relative;
    z-index: 10;
    display: block;
    height: 81px;
    color: #fff;
    font-size: 22px;
    font-weight: 300;
    line-height: 81px;
    border-top: 1px solid #476a76;
    background: #07394a;
    cursor: pointer;
    transition: .5s;

    
}

.floor_main ul li div div {
    position: absolute;
    top: 0;
    left: -730px;
    z-index: 1;
    width: 430px;
    height: 100%;
    background: rgba(0,0,0,.1);
    transition: .5s;
    border: 1px solid teal;
    
    
}

.floor_main ul li.on div:first-child {
    left: 80px;
    
}

.floor_main ul li.on div h5 {
    
    font-size: 100px;
    font-weight: 300;
    line-height: 22px;
    margin-bottom: 30px;
    margin-top: 100px;
    
    text-align: center;
    
}

.floor_main ul li div div {
    
    width: 400px;
    text-align: center;
    left: -400px;
    
}


/* 내부도 사진 */
.floor_main ul li div div img {
    position: relative;
    border: 3px solid beige;
    width: 100%;    
    margin-top: 100px;
    
}

.content_bg2 {
    position: absolute;
    left: 0;
    top: 0;
    
    
}

.content_bg2 .on {
    width: 100%;
    height: 100%;
    
}

.content_bg2 {
    visibility: hidden;
}

.content_bg2 img {
    opacity: 0.8;
}


.container {
    margin-bottom: 200px;
}

</style>
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