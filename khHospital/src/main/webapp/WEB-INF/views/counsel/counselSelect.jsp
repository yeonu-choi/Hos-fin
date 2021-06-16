<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        #sArea { margin-bottom: 200px;}
    </style>
</head>
<body>
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
        
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>