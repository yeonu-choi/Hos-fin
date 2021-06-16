<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<title>KH대학병원</title>
   <style>
         #top {
            margin-top: 80px;
            text-align: center;
        }

        #top-t {
            margin-left: 10%;
            width: 80%;
            color: #00a5db;
            font-size: 43px;
            font-weight: 600;
            margin-bottom: 0;
        }

        #top-s {
            margin-left: 10%;
            width: 80%;
            margin-top: 25px;
            color: #404040;
            font-size: 19px;
            font-weight: 600;
            border-bottom: 2px solid #e3e3e3;
            padding-bottom: 30px;
        }

        #cArea, #sArea {
            width: 100%;
            position: relative;
        }

        #cc { 
            width: 50%;
            margin-left: 25%;
            }
        
        #cc p {
            font-size: 16px;
            color: black;
        }

        .c1 { margin-top: 60px;}

        #sc1, #sc2 {
            width: 60%;
            height: 100px;
            margin-left: 20%;
            background: #f6f7f9;
            border: 2px solid #ededed;
        }

        #sc1 { 
            margin-top: 50px; 
            border-bottom: none;
        }

        #sc2 { border-top: none;}

        #sArea a {
            text-decoration: none;
            color: #4c4d4f;
            font-size: 18px;
            font-weight: 600;
            display: inline-block;
        }

        #sc1 a { margin-top: 46px;}
        #sc2 a { margin-top: 30px;}

        #sArea a:hover { 
            color: #00a4da;
            cursor: pointer;
            }

        .dept1, .dept5 { margin-left: 8%;}
        .dept2, .dept3, .dept4 { margin-left: 18%;}
        .dept6, .dept7 {margin-left: 15%;}
        #sArea { margin-bottom: 100px;}

        #sOuter {
            width: 100%;
            position: relative;
            margin-bottom: 10px;
        }

        #searchArea { 
            width: 70%;
            margin-left: 15%;
            text-align: right;
        }
         
        #condition { 
            width: 80px ; 
            height: 30.5px;
       }
        
        #search { 
            width: 250px;
            height: 25px; 
            margin-left: -4px; 
        }

        #searchBtn { 
            width: 50px; 
            height: 31px; 
            margin-left: -50px; 
            position: absolute;
        }
        
        #subselect {
            margin-bottom: 10px;
        }

        #listArea { 
            margin-top: 10px; 
            width: 100%;
            position: relative;
            }

        #cList { 
            width: 70%;
            margin-left: 15%;
            margin-bottom: 30px;
            }

        #cList tr {
            border-bottom: 2px solid #e7e7e7;
        }
        
        #cList tr:first-child {
            background: #f2f3f7;
            border-top: 2px solid #797983;
            
        }

        #cList tr:first-child th {
            height: 50px;
            color: #535458;
        }

        #blank {
            height: 350px;
            font-size: 18px;
        }

        #cList td {
            height: 40px;
        }

        #cList td:not(.title) {
            text-align: center;
        }

        .title { padding-left: 40px; }  
        .title:hover { cursor: pointer; }
        .title span {vertical-align: middle;}
        
        .title img {
            width: 12px;
            padding-right: 10px;
            vertical-align: middle;
        }

        #btn { 
            width: 70%;
            margin-left: 15%;
            text-align: right;
            margin-bottom: 50px;
            }

        #writeBtn { 
            width: 140px;
            height: 40px;
            border: none;
            background: #06a3ea;
            color: white;
            font-weight: 600;
            font-size: 15px;
            cursor: pointer;
        }

        #paging {
            width: 100%;
            height: 200px;
            position: relative;
            text-align: center;
        }

        #paging button {
            width: 40px;
            height: 40px;
        }

        .move {
            background: white;
            border: 1px solid #979797;
            color: #676767;
        }

        .sel {
            background: #8b919f;
            color: white;
            border: none;
        }
        .non {
            background: white;
            border: none;
            color: #7b7b7b;
        }
        
        #searBtn { 
            display: inline-block;
            position: absolute;    
        }
    </style>
    <script>
   		 window.onload = function(){
			var dId = "${did}";
    		
    		if(dId == 1){
    			$(".dept2").css({"color" : "#03a3dd"});
    			$(".dept2").css({"cursor" : "default"});
    			$('.dept2').click(function () {return false;});
    		} else if(dId == 6){
    			$(".dept7").css({"color" : "#03a3dd"});
    			$(".dept7").css({"cursor" : "default"});
    			$('.dept7').click(function () {return false;});
    		} else if(dId == 7){
    			$(".dept4").css({"color" : "#03a3dd"});
    			$(".dept4").css({"cursor" : "default"});
    			$('.dept4').click(function () {return false;});
    		} else if(dId == 8){
    			$(".dept3").css({"color" : "#03a3dd"});
    			$(".dept3").css({"cursor" : "default"});
    			$('.dept3').click(function () {return false;});
    		} else if(dId == 9){
    			$(".dept1").css({"color" : "#03a3dd"});
    			$(".dept1").css({"cursor" : "default"});
    			$('.dept1').click(function () {return false;});
    		} else if(dId == 11){
    			$(".dept6").css({"color" : "#03a3dd"});
    			$(".dept6").css({"cursor" : "default"});
    			$('.dept6').click(function () {return false;});
    		} else if(dId == 13){
    			$(".dept5").css({"color" : "#03a3dd"});
    			$(".dept5").css({"cursor" : "default"});
    			$('.dept5').click(function () {return false;});
    		}
   		 }
    </script>
</head>
<body>
	<c:if test="${ !empty did }">
	<c:set var="currDid" value="${ did }"/>
	</c:if>
	<jsp:include page="../common/menubar.jsp"/>
	
    <div id="top">
        <p id="top-t">1:1 전문의 상담</p>
        <p id="top-s">궁금하신 질환 또는 건강 관련 문의를 남겨주시면 
            분야별 최고의 전문의가 친절하게 답변해드립니다.</p>
    </div>
    <div id="cArea">
        <div id="cc">
            <p class="caution c1">· 상담글을 작성하실 때는 로그인이 필요합니다.</p>
            <p class="caution">· 게시판 성격에 맞지 않는 글(비방, 광고성)은 관리자에 의해 임의 삭제될 수 있습니다.</p>
            <p class="caution">· 고객님의 상담 내용 및 개인 정보 보호를 위해 상담글은 비공개 글로만 등록 가능 합니다.</p>
            <p class="caution">· 게시글 수정 및 삭제가 가능하나 전문의의 답변이 달린 이후에는 수정 및 삭제가 불가합니다.</p>
            <p class="caution">· 아래에서 상담을 원하시는 진료과를 선택한 후 
                해당 진료 과목에 알맞는 상담글을 작성해주시기 바랍니다.</p>
        </div>
    </div>
    <div id="sArea">
        <div id="sc1">
            <a class="dept1" href="${contextPath}/counsel/list?did=9">· 내과</a>
            <a class="dept2" href="${contextPath}/counsel/list?did=1">· 외과</a>
            <a class="dept3" href="${contextPath}/counsel/list?did=8">· 산부인과</a>
            <a class="dept4" href="${contextPath}/counsel/list?did=7">· 소아청소년과</a>
        </div>
        <div id="sc2">
            <a class="dept5" href="${contextPath}/counsel/list?did=13">· 정신건강의학과</a>
            <a class="dept6" href="${contextPath}/counsel/list?did=11">· 치과</a>
            <a class="dept7" href="${contextPath}/counsel/list?did=6">· 소아외과</a>
        </div>
    </div>
    <div id="sOuter">
        <div id="searchArea">
        <form action="${ contextPath }/counsel/search" method="get">
            <select id="condition" name="condition">
                <option value="all" <c:if test="${param.condition == 'all'}">selected</c:if>>전체</option>
                <option value="title" <c:if test="${param.condition == 'title'}">selected</c:if>>제목</option>
                <option value="writer" <c:if test="${param.condition == 'writer'}">selected</c:if>>작성자</option> 
            </select>
            <input type="text" id="search" name="search" value="${param.search}">
            <button id="searchBtn">검색</button>
            <input type="hidden" name="did" value="${did}">  
        </form>
        </div>
    </div>
    <div id="listArea">
        <table id="cList" style="border-collapse: collapse;" align="center">
            <tr>
                <th width="5%">번호</th>
                <th width="60%">제목</th>
                <th width="10%">작성자</th>
                <th width="10%">상태</th>
                <th width="15%">등록일</th>
            </tr>
            <c:if test="${ empty list }">
            <tr id="blank">
                <td colspan="5" align="center">조회된 게시물이 없습니다.</td>
            </tr>
            </c:if>
            <c:if test="${ !empty list }">
            <c:forEach items="${list}" var="c">
			<tr onclick="toDetail(${c.cid}, '${c.userId}')">
                <td>${c.cid}</td>
                <td class="title"><img src="${contextPath}/resources/images/lock.png"><span>${c.ctitle}</span></td>
                <td>${c.userId}</td>
                <td>${c.cstatus}</td>
                <td>${c.c_createDate}</td>
            </tr>
            </c:forEach>
            </c:if>
        </table>
        <c:if test="${ !empty sessionScope.loginUser }">
        <div id=btn>
        <button id="writeBtn" onclick="location.href='${contextPath}/counsel/write?did=${did}'">글쓰기</button>
        </div>
        </c:if>
    </div>
    <div id="paging">
    	<c:if test="${empty param.condition}">
    	<c:if test="${ pi.currentPage <= 1 }">
			<button class="move" disabled> &lt; </button>
		</c:if>
		<c:if test="${ pi.currentPage > 1 }">
			<c:url var="before" value="/counsel/list?did=${did}">
				<c:param name="page" value="${ pi.currentPage -1}"/>
			</c:url>
			<button class="move" onclick="location.href='${ before }'" style="cursor:pointer;"> &lt; </button>
		</c:if>
		</c:if>
		<c:if test="${ !empty param.condition}">
    	<c:if test="${ pi.currentPage <= 1 }">
			<button class="move" disabled> &lt; </button>
		</c:if>
		<c:if test="${ pi.currentPage > 1 }">
			<c:url var="before" value="/counsel/list?did=${did}&condition=${ param.condition }&search=${ param.search }">
				<c:param name="page" value="${ pi.currentPage -1}"/>
			</c:url>
			<button class="move" onclick="location.href='${ before }'" style="cursor:pointer;"> &lt; </button>
		</c:if>
		</c:if>
		<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		<c:if test="${empty param.condition}">
			<c:if test="${ p eq pi.currentPage }">
				<button class="sel" disabled>${ p }</button>
			</c:if>
			<c:if test="${ p ne pi.currentPage }">
				<c:url var="pagination" value="/counsel/list?did=${did}">
					<c:param name="page" value="${p}"/>
				</c:url>
				<button class="non" onclick="location.href='${ pagination }'" style="cursor:pointer;">${ p }</button>
			</c:if>
		</c:if>
		<c:if test="${!empty param.condition}">
			<c:if test="${ p eq pi.currentPage }">
				<button class="sel" disabled>${ p }</button>
			</c:if>
			<c:if test="${ p ne pi.currentPage }">
				<c:url var="pagination" value="/counsel/list?did=${did}&condition=${ param.condition }&search=${ param.search }">
					<c:param name="page" value="${p}"/>
				</c:url>
				<button class="non" onclick="location.href='${ pagination }'" style="cursor:pointer;">${ p }</button>
			</c:if>
		</c:if>
		</c:forEach>
		<c:if test="${empty param.condition}">
		<c:if test="${pi.currentPage >= pi.maxPage }">
			<button class="move" disabled> &gt; </button>
		</c:if>
		<c:if test="${ pi.currentPage < pi.maxPage}">
			<c:url var="after" value="/counsel/list?did=${did}">
				<c:param name="page" value="${pi.currentPage + 1}"/>
			</c:url>
			<button class="move" onclick="location.href='${ after }'" style="cursor:pointer;"> &gt; </button>
		</c:if>
		</c:if>
		<c:if test="${!empty param.condition}">
		<c:if test="${pi.currentPage >= pi.maxPage }">
			<button class="move" disabled> &gt; </button>
		</c:if>
		<c:if test="${ pi.currentPage < pi.maxPage}">
			<c:url var="after" value="/counsel/list?did=${did}&condition=${ param.condition }&search=${ param.search }">
				<c:param name="page" value="${pi.currentPage + 1}"/>
			</c:url>
			<button class="move" onclick="location.href='${ after }'" style="cursor:pointer;"> &gt; </button>
		</c:if>
		</c:if>
    </div>
        
    <jsp:include page="../common/footer.jsp"/>
    
    <script>
    	$(document).ready(function () {
	    	$('html, body').animate({
	    	scrollTop: $('#sOuter').offset().top
	    	}, 'slow');
    	});
    	
    	function toDetail(cid, userId){	
    		var did = "${currDid}";
    		var lId = "${loginUser.userId}";
    		var lGrade = "${loginUser.grade}";
    		var lDid = "${loginUser.did}";
    		
    		if(userId == lId){
    			location.href="${contextPath}/counsel/detail?cid=" + cid + "&did=" + did + "&page=${pi.currentPage}";
    		} else if(did == lDid){
    			location.href="${contextPath}/counsel/detail?cid=" + cid + "&did=" + did + "&page=${pi.currentPage}";
    		} else if(lGrade == '관리자'){
    			location.href="${contextPath}/counsel/detail?cid=" + cid + "&did=" + did + "&page=${pi.currentPage}";
    		} else {
    			alert('해당 상담글에 접근 권한이 없습니다.');
    		}
    	}
    </script>
</body>
</html>