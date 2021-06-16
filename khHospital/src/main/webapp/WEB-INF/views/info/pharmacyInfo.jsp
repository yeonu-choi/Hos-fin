<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<style>
	#content{
        width:75%;
        margin: auto;
        margin-top:80px;
        margin-bottom:100px;
        min-width: 1000px;
    }
    
    #map{
    	width:1000px;
    	height:700px;
    	margin: auto;
    	margin-top: 50px;
    	border :1px solid black;
    }
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<div id="content">
		<h1 align="center">약국 안내</h1>
		
		<div id="map"></div>
	</div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=76ec60486dcadbfd8c87813ae0255007&libraries=services"></script>
	
	<script>
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});	// 마커를 클릭하면 장소명을 표출할 인포윈도우

		var container = document.getElementById('map');	//지도를 담을 영역의 DOM 레퍼런스
		
		var options = {	//지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.4989966363357, 127.032848249971),	//지도의 중심좌표
			level: 3	//지도의 레벨(확대, 축소 정도)
		};
		
		var map = new kakao.maps.Map(container, options);	//지도 생성 및 객체 리턴
		
		var geocoder = new kakao.maps.services.Geocoder();	// 주소-좌표 변환 객체를 생성합니다

		geocoder.addressSearch('서울특별시 강남구 테헤란로14길 6', function(result, status) {	// 주소로 좌표를 검색합니다

		     if (status === kakao.maps.services.Status.OK) {	// 정상적으로 검색이 완료됐으면 
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);	// 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        var infowindow = new kakao.maps.InfoWindow({	// 인포윈도우로 장소에 대한 설명을 표시합니다
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">kh병원</div>'
		        });
		        infowindow.open(map, marker);

		        map.setCenter(coords);	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		    } 
		});    
		
		map.setZoomable(false);	// 마우스 휠을 이용한 지도 확대, 축소를 막는다.
		
		var zoomControl = new kakao.maps.ZoomControl();	// 지도에 확대 축소 컨트롤을 생성
		
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);	// 지도의 우축에 확대 축소 컨트롤을 추가
		
		var ps = new kakao.maps.services.Places(map); 	// 장소 검색 객체를 생성합니다

		ps.categorySearch('PM9', placesSearchCB, {useMapBounds:true}); 	// 카테고리로 약국을 검색합니다

		function placesSearchCB (data, status, pagination) {	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		    if (status === kakao.maps.services.Status.OK) {
		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		        }       
		    }
		}

		function displayMarker(place) {	// 지도에 마커를 표시하는 함수입니다
		    
		    var marker = new kakao.maps.Marker({	// 마커를 생성하고 지도에 표시합니다
		        map: map,
		        position: new kakao.maps.LatLng(place.y, place.x) 
		    });

		    
		    kakao.maps.event.addListener(marker, 'click', function() {	// 마커에 클릭이벤트를 등록합니다
		        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');	// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		        infowindow.open(map, marker);
		    });
		}
		
	</script>
	
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>