<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>길안내</title>

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=rc1mz35nzp"></script>
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

#content {
   
    height: 200px;

}
/* wrap */
.guide_wrap {  
    display: block;
  
}

.guide_tap {
    margin-left: auto;
    margin-right: auto;
    height: 100px;
   
    
}

.guide_wrap div {
    width : 1200px
    
}

/* tab */

.guide_tap ul {
    list-style: none;
    width: 100%;
    box-sizing: border-box;
    margin-left: auto;
    margin-right: auto;
   
}

.tab_style01 li { 
    border: 1px solid #ccc; 
    position: relative;
    float: left;
    display: block;
    text-align: center;
    width: 50%;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
  	left: -20px;

}

.tab_style01 li a {
    text-decoration: none;
    font-size: 22px;
    font-weight: bolder;
    line-height: 64px;
    height: 60px;
    color: black;
    
}

/* 스크립트 li 실행시 class가 on으로 변경 */
.tab_style01 li.on {
    border-top: 3px solid #a08b65;
    border-left: 3px solid  #a08b65;
    border-right: 3px solid #a08b65;
    border-bottom: 0;
    
}


/* train */
.load_guide h4 {
    height: 53px;
    margin-bottom: 40px;
    padding-bottom: 17px;
    color: #000;
    font-size: 30px;
    font-weight: 300;
    line-height: 30px;
    border-bottom: 3px solid #a08b65;
}

.load_guide {
    padding-top: 30px; 
    display: flex;
    
}



.tab_contents {
    display: block;
    
    margin-left: auto;
    margin-right: auto;
    
    
}

.train ul {
    border: 3px solid #00b050;
    width: 420px;
    height: 360px;
    display: inline-block;

}

.train img {
    width: 100px;
    height: 100px;
    display: inline-block;
   
    margin-top: 10px;
    
}

.train ul li {
    list-style: none;

    width: 300px;
    display: block;
    position: relative;
    font-size: 18px;
    margin-top: 10px;
    
}

.bus ul {
    border: 3px solid #00b050;
    display: inline-block;
    width: 420px;
    height: 360px;
    
}

.bus img {
    width: 100px;
    height: 100px;
    display: inline-block;
    margin-top: 10px;
}

.bus ul li {
    list-style: none;
    position: relative;
    font-size: 18px;   
    margin-top: 10px;
    width: 300px;
    display: block;
   
}
/* color */

.green {
    color: #00b050;
}

.blue {
    color: #0070c0;
}

/* park_guide */
.park_guide h4 {
    height: 53px;
    margin-bottom: 40px;
    padding-bottom: 17px;
    color: #000;
    font-size: 30px;
    font-weight: 300;
    line-height: 30px;
    border-bottom: 3px solid #a08b65;

}

/* park table */
caption {
    display: none;
}
.table_style02 table {
    width: 100%;
    text-align: center;
    border: 3px solid gray;
    border-collapse: collapse;
}

.table_style02 table th {
    border-left: 1px solid gray;
    border-bottom: 1px solid gray;
    height: 60px;
}

.table_style02 table td {
    border-left: 1px solid gray;
    border-bottom: 1px solid gray;
    height: 60px;
}


/* map */
#naver_map {
    border: 2px solid #00b050;
    width: 100%;
    height: 400px;
        
}

.park_picture {
    border: 3px solid gray;
    margin-top: 20px;
    display: flex;
}

.park_picture > div {
    padding: 10px;
}

.park_picture > div> div {
    display: inline-block;
    border: 2px solid gray;
    width: 410px;
    text-align: center;
    height: 180px;
    margin-top: 10px;
    background-color: #f7f7f7;

}

.park_picture > div > div h3 {
    line-height: 100px;
}

.container {
    margin-bottom: 200px;
}
</style>
<body>
	<jsp:include page="../common/menubar.jsp"/>


    <div class="title">
        <h1>오시는길/주차안내</h1>
        
        <p>   
            kh병원은 본관, 국민건강검진센터, 키즈센터 3개의 동이 연결되어 있습니다.
            <br>
            건강검진부터 진료, 입퇴원, 수술 및 문화센터 등 방문전에 미리 둘러보세요.
        </p>
    </div>    

    <!-- container -->
    <div class="container" id="container">
    	
        <!-- content -->
        <div class="guide_wrap">
            <!-- tap -->
            <div class="guide_tap" id="guide_tap">
                <ul class="tab_style01">
                    <li class=""  onclick="location1('1')" id="c1">
                        <a href="">오시는길</a>
                    </li>
                    <li class=""  onclick="location2('2')" id="c2">
                        <a href="">주차안내</a>
                    </li>
                </ul>
            </div>
            
            <!-- content1 -->
            <div class="tab_contents" id="location1" style="display: block;">
            <div id="naver_map"></div>
                <div class="load_guide">
                    <div class="train">
                        <h4>지하철 이용안내</h4>
                            <ul>
                            <img src="${contextPath}/resources/images/free-icon-underground-66273.png">
                                <li>
                                    "2호선 <strong class="green">강남역 4번 출구</strong> "
                                    <em>-></em>
                                    "도보 8분 소요"
                                </li>
                                <li>
                                    "2호선 <strong class="green">강남역 7번 출구</strong> "
                                    <em>-></em>
                                    "도보 10분 소요"
                                </li>
                                <li>
                                    "공항에서 오실 때,
                                    <strong class="blue">공항철도 김포공항역</strong>
                                    에 하차하여, 9호선 환승하여
                                    <strong class="green">강남역 / 강남(신분당선)역</strong>에서 하차해 주세요."
                                </li>
                            </ul>
                            

                            
                    </div>
                    <div class="bus">
                        <h4>버스 이용안내</h4>
                            <ul>
                            <img src="${contextPath}/resources/images/iconmonstr-bus-7-240.png">
                                <li>
                                    "버스 (강남세무서입구 하차)"
                                    <br>
                                    <strong class="green">6629</strong>,
                                    <strong class="green">6630</strong>,
                                    <strong class="green">6627</strong>,
                                    <strong class="blue">652</strong>
                                </li>
                                <li>
                                    "마을버스 (네이버파트너스퀘어 하차)"
                                    <br>
                                    <strong class="green">05</strong>
                                    ,
                                    <strong class="green">06</strong>
                                </li>
                                <li>
                                    "공항리무진 (강남역 하차 후 도보)"
                                    <br>
                                    <strong>
                                        600, 601, 602, 602-1, 603,
                                    <br>
                                        604, 604-1, 605, 605-1, 608번
                                    </strong>
                                </li>
                            </ul>
                    </div>
                </div>
            </div>

            <!-- content2 -->
            <div class="tab_contents" id="location2" style="display: none;">
                <div class="park_guide">
                    <h4>주차 이용안내</h4>
                        <div class="table_style02">
                            <table>
                                <caption>주차장 사용 요금</caption>
                                <colgroup>
                                    <col>
                                    <col width="40%">
                                    <col width="40%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>외래</th>
                                        <th>입원 및 퇴원</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th>환자무료주차</th>
                                        <td>
                                            당일 4시간 무료(진료영수증 지참)
                                            <br>
                                            4시간 초과 시 (해당부서에서 주차확인)
                                        </td>
                                        <td>입원 기간 중 차량 1대 무료 (원무과 등록)</td>
                                    </tr>
                                    <tr>
                                        <th>방문객 주차</th>
                                        <td>30분당 : 1,000원</td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" class="none">발렛파킹 서비스 : 2,000원 (주차요금 별도)</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        
                        <div class="park_picture">
                            <div>
                                <img src="${contextPath}/resources/images/park01.png">
                            </div>
                            <div>
                                <img src="${contextPath}/resources/images/park02.jpg">
                                <div>
                                    <h3>제1주차장</h3>
                                    <p>서울특별시 강남구 테헤란로14길 6 어딘가에 있음</p>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>

    </div>
    
    <jsp:include page="../common/footer.jsp"/>
    <script>
    $(document).ready(function(){
        
       
        $("#c1").trigger("click");
    });
    
    // 지도 설정
    var mapOptions = {
    	    center: new naver.maps.LatLng(37.4989966363357, 127.032848249971),
    	    zoom: 16
    	   	   
    	};
    
    	var map = new naver.maps.Map('naver_map', mapOptions);
    
    	var marker = new naver.maps.Marker({
    	    position: new naver.maps.LatLng(37.4989966363357, 127.032848249971),
    	    title: '미즈메디병원',
    	    map:map
    	});
    	
    	var contentString = [
            '<div id="test" style="padding:4px 4px; text-align: center; background-color:#006a79; color:white;">',
            '   <div style="font-weight:bold;">kh병원</div>',  
            '</div>'
        ].join('');
     
    	var infowindow = new naver.maps.InfoWindow({
        	content: contentString
   	 });
     
	    naver.maps.Event.addListener(marker, "click", function(e) {
	        if (infowindow.getMap()) {
	            infowindow.close();
	        } else {
	            infowindow.open(map, marker);
	        }
	    });
	     
	    infowindow.open(map, marker);
	    
    	// 화면 선택자
	    function location1() {
            var area1 = document.getElementById("location1");
            var area2 = document.getElementById("location2");
            area1.style.display="block";
            area2.style.display="none";
            
        }
        function location2() {
             var area1 = document.getElementById("location1");
             var area2 = document.getElementById("location2");
             area2.style.display="block";
             area1.style.display="none";
            
        }
        /* 클릭시 css 변경 및 해당되지않는 자손은 disply none */
        
    
        $(".tab_style01 li").on('click' , function (){
           
            $(this).addClass("on").siblings().removeClass("on");
            
            
        });
    </script>
</body>
</html>